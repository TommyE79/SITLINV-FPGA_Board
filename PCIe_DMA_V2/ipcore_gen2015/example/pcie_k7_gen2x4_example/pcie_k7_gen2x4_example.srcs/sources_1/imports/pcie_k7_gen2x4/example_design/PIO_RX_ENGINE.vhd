-------------------------------------------------------------------------------
--
-- (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Project    : Series-7 Integrated Block for PCI Express
-- File       : PIO_RX_ENGINE.vhd
-- Version    : 3.1
----
---- Description: Local-Link Receive Unit.
----
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PIO_RX_ENGINE is
generic (
  C_DATA_WIDTH          : integer range 64 to 128 := 64;
  TCQ                   : time                    := 1 ps
);

port (
  clk                   : in  std_logic;
  rst_n                 : in  std_logic;
  --
  -- Receive AXI-S interface from PCIe core
  --
  m_axis_rx_tdata       : in std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  m_axis_rx_tkeep       : in std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  m_axis_rx_tlast       : in  std_logic;
  m_axis_rx_tvalid      : in  std_logic;
  m_axis_rx_tready      : out std_logic;
  m_axis_rx_tuser       : in  std_logic_vector(21 downto 0);

  --
  -- Memory Read data handshake with Completion
  -- transmit unit. Transmit unit reponds to
  -- req_compl assertion and responds with compl_done
  -- assertion when a Completion w/ data is transmitted.
  --
  req_compl             : out std_logic;
  req_compl_wd          : out std_logic;
  compl_done            : in  std_logic;
                        
  req_tc                : out std_logic_vector(2 downto 0);  -- Memory Read TC
  req_td                : out std_logic;                     -- Memory Read TD
  req_ep                : out std_logic;                     -- Memory Read EP
  req_attr              : out std_logic_vector(1 downto 0);  -- Memory Read Attribute
  req_len               : out std_logic_vector(9 downto 0);  -- Memory Read Length (1DW)
  req_rid               : out std_logic_vector(15 downto 0); -- Memory Read Requestor ID
  req_tag               : out std_logic_vector(7 downto 0);  -- Memory Read Tag
  req_be                : out std_logic_vector(7 downto 0);  -- Memory Read Byte Enables
  req_addr              : out std_logic_vector(12 downto 0); -- Memory Read Address

  --
  -- Memory interface used to save 1 DW data received
  -- on Memory Write 32 TLP. Data extracted from
  -- inbound TLP is presented to the Endpoint memory
  -- unit. Endpoint memory unit reacts to wr_en
  -- assertion and asserts wr_busy when it is
  -- processing written information.
  --
  wr_addr               : out std_logic_vector(10 downto 0); -- Memory Write Address
  wr_be                 : out std_logic_vector(7 downto 0);  -- Memory Write Byte Enable
  wr_data               : out std_logic_vector(31 downto 0); -- Memory Write Data
  wr_en                 : out std_logic;                     -- Memory Write Enable
  wr_busy               : in std_logic                       -- Memory Write Busy
);

end PIO_RX_ENGINE;

architecture rtl of PIO_RX_ENGINE is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  constant RX_MEM_RD32_FMT_TYPE    : std_logic_vector(6 downto 0) := "0000000";
  constant RX_MEM_WR32_FMT_TYPE    : std_logic_vector(6 downto 0) := "1000000";
  constant RX_MEM_RD64_FMT_TYPE    : std_logic_vector(6 downto 0) := "0100000";
  constant RX_MEM_WR64_FMT_TYPE    : std_logic_vector(6 downto 0) := "1100000";
  constant RX_IO_RD32_FMT_TYPE     : std_logic_vector(6 downto 0) := "0000010";
  constant RX_IO_WR32_FMT_TYPE     : std_logic_vector(6 downto 0) := "1000010";

begin

  pio_rx_sm_64_gen : if (C_DATA_WIDTH = 64) generate


    type state_type is (PIO_64_RX_RST_STATE,
                        PIO_64_RX_MEM_RD32_DW1DW2,
                        PIO_64_RX_MEM_WR32_DW1DW2,
                        PIO_64_RX_IO_WR_DW1DW2,
                        PIO_64_RX_MEM_RD64_DW1DW2,
                        PIO_64_RX_MEM_WR64_DW1DW2,
                        PIO_64_RX_MEM_WR64_DW3,
                        PIO_64_RX_IO_MEM_WR_WAIT_STATE,
                        PIO_64_RX_WAIT_STATE);

    signal state              : state_type;
    signal tlp_type           : std_logic_vector(6 downto 0);
    signal m_axis_rx_tready_int : std_logic;
    signal io_bar_hit_n       : std_logic;
    signal mem32_bar_hit_n    : std_logic;
    signal mem64_bar_hit_n    : std_logic;
    signal erom_bar_hit_n     : std_logic;
    signal bar_hit_select     : std_logic_vector(3 downto 0);
    signal region_select      : std_logic_vector(1 downto 0);

    signal in_packet_q        : std_logic;
    signal sop                : std_logic;

    begin

      m_axis_rx_tready <= m_axis_rx_tready_int;

      -- Create logic to determine when a packet starts
      sop <= not(in_packet_q) and m_axis_rx_tvalid;

      process begin
        wait until rising_edge(clk);
        if (rst_n = '0') then
          in_packet_q    <= '0' after TCQ;
        elsif (m_axis_rx_tvalid = '1' and m_axis_rx_tready_int = '1' and m_axis_rx_tlast = '1') then
          in_packet_q    <= '0' after TCQ;
        elsif (sop = '1' and m_axis_rx_tready_int = '1') then
          in_packet_q    <= '1' after TCQ;
        end if;
      end process;

    mem64_bar_hit_n <= '1';
    io_bar_hit_n <= '1';
    mem32_bar_hit_n <= not(m_axis_rx_tuser(2));
    erom_bar_hit_n  <= not(m_axis_rx_tuser(8));
    process
    begin
      wait until rising_edge(clk);
        if (rst_n = '0' ) then
          m_axis_rx_tready_int  <= '0' after TCQ;

          req_compl             <= '0' after TCQ;
          req_compl_wd          <= '1' after TCQ;

          req_tc                <= (others => '0') after TCQ;
          req_td                <= '0' after TCQ;
          req_ep                <= '0' after TCQ;
          req_attr              <= (others => '0') after TCQ;
          req_len               <= (others => '0') after TCQ;
          req_rid               <= (others => '0') after TCQ;
          req_tag               <= (others => '0') after TCQ;
          req_be                <= (others => '0') after TCQ;
          req_addr              <= (others => '0') after TCQ;
                                
          wr_be                 <= (others => '0') after TCQ;
          wr_addr               <= (others => '0') after TCQ;
          wr_data               <= (others => '0') after TCQ;
          wr_en                 <= '0' after TCQ;
          state                 <= PIO_64_RX_RST_STATE after TCQ;
          tlp_type              <= (others => '0') after TCQ;
        else

          wr_en                    <= '0' after TCQ;
          req_compl                <= '0' after TCQ;
          req_compl_wd             <= '1' after TCQ;

          case (state) is
            when PIO_64_RX_RST_STATE =>
              m_axis_rx_tready_int <= '1' after TCQ;
              tlp_type             <= m_axis_rx_tdata(30 downto 24) after TCQ;
              req_tc               <= m_axis_rx_tdata(22 downto 20) after TCQ;
              req_td               <= m_axis_rx_tdata(15) after TCQ;
              req_ep               <= m_axis_rx_tdata(14) after TCQ;
              req_attr             <= m_axis_rx_tdata(13 downto 12) after TCQ;
              req_len              <= m_axis_rx_tdata(9 downto 0) after TCQ;
              req_rid              <= m_axis_rx_tdata(63 downto 48) after TCQ;
              req_tag              <= m_axis_rx_tdata(47 downto 40) after TCQ;
              req_be               <= m_axis_rx_tdata(39 downto 32) after TCQ;
              wr_be                <= m_axis_rx_tdata(39 downto 32) after TCQ;

              if ((sop = '1') and (m_axis_rx_tvalid = '1') and (m_axis_rx_tready_int = '1')) then
                case (m_axis_rx_tdata(30 downto 24)) is
                  when RX_MEM_RD32_FMT_TYPE =>
                    m_axis_rx_tready_int <= '0' after TCQ;
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_MEM_RD32_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when RX_MEM_WR32_FMT_TYPE =>
                    m_axis_rx_tready_int <= '0' after TCQ;
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_MEM_WR32_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when RX_MEM_RD64_FMT_TYPE =>
                    m_axis_rx_tready_int <= '0' after TCQ;
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_MEM_RD64_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when RX_MEM_WR64_FMT_TYPE =>
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_MEM_WR64_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when RX_IO_RD32_FMT_TYPE =>
                    m_axis_rx_tready_int <= '0' after TCQ;
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_MEM_RD32_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when RX_IO_WR32_FMT_TYPE =>
                    m_axis_rx_tready_int <= '0' after TCQ;
                    if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                      state        <= PIO_64_RX_IO_WR_DW1DW2 after TCQ;
                    else
                      state        <= PIO_64_RX_RST_STATE after TCQ;
                    end if;

                  when others => -- other TLPs
                    state        <= PIO_64_RX_RST_STATE after TCQ;
                end case; -- m_axis_rx_tdata(30 downto 24)
              else -- ((trn_rsof_n = '0') and (trn_rsrc_rdy_n = '0') and (trn_rdst_rdy_n_int = '0'))
                state <= PIO_64_RX_RST_STATE after TCQ;
              end if;
            -- end of PIO_64_RX_RST_STATE


            -- first and second dwords of mem32 read tlp
            when PIO_64_RX_MEM_RD32_DW1DW2 =>

              if (m_axis_rx_tvalid = '1') then
                m_axis_rx_tready_int  <= '0' after TCQ;
                req_addr     <= region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2) & "00" after TCQ;
                req_compl    <= '1' after TCQ;
                req_compl_wd <= '1' after TCQ;
                state        <= PIO_64_RX_WAIT_STATE after TCQ;
              else
                state        <= PIO_64_RX_MEM_RD32_DW1DW2 after TCQ;
              end if;
            -- end of PIO_64_RX_MEM_RD32_DW1

            -- first and second dwords of mem32 write tlp
            when PIO_64_RX_MEM_WR32_DW1DW2 =>

              if (m_axis_rx_tvalid = '1') then
                wr_data          <= m_axis_rx_tdata(63 downto 32) after TCQ;
                wr_en            <= '1' after TCQ;
                m_axis_rx_tready_int <= '0' after TCQ;
                wr_addr          <= region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2) after TCQ;
                state            <= PIO_64_RX_WAIT_STATE after TCQ;
              else
                state              <= PIO_64_RX_MEM_WR32_DW1DW2 after TCQ;
              end if;

            -- first and second dwords of mem64 read tlp
            when PIO_64_RX_MEM_RD64_DW1DW2 =>

              if (m_axis_rx_tvalid = '1') then

                req_addr         <= region_select(1 downto 0) & m_axis_rx_tdata(42 downto 34) & "00" after TCQ;
                req_compl        <= '1' after TCQ;
                req_compl_wd     <= '1' after TCQ;
                m_axis_rx_tready_int <= '0' after TCQ;
                state            <= PIO_64_RX_WAIT_STATE after TCQ;

              else

                state        <= PIO_64_RX_MEM_RD64_DW1DW2 after TCQ;

              end if;
            -- first and second dwords of mem64 write tlp
            when PIO_64_RX_MEM_WR64_DW1DW2 =>

              if (m_axis_rx_tvalid = '1') then
                m_axis_rx_tready_int  <= '0' after TCQ;
                wr_addr           <= region_select(1 downto 0) & m_axis_rx_tdata(42 downto 34) after TCQ;
                state             <= PIO_64_RX_MEM_WR64_DW3 after TCQ;

              else

                state        <= PIO_64_RX_MEM_WR64_DW1DW2 after TCQ;

              end if;

            -- third dword of mem64 write tlp contains 1 DW write data
            when PIO_64_RX_MEM_WR64_DW3 =>

              if (m_axis_rx_tvalid = '1') then

                wr_data           <= m_axis_rx_tdata(31 downto 0) after TCQ;
                wr_en             <= '1' after TCQ;
                m_axis_rx_tready_int  <= '0' after TCQ;
                state             <= PIO_64_RX_WAIT_STATE after TCQ;

              else

                state        <= PIO_64_RX_MEM_WR64_DW3 after TCQ;

              end if;
            -- first and second dwords of io write tlp
            when PIO_64_RX_IO_WR_DW1DW2 =>

              if (m_axis_rx_tvalid = '1') then

                wr_data            <= m_axis_rx_tdata(63 downto 32) after TCQ;
                wr_en              <= '1' after TCQ;
                m_axis_rx_tready_int   <= '0' after TCQ;
                wr_addr            <= region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2) after TCQ;
                req_compl          <= '1' after TCQ;
                req_compl_wd       <= '0' after TCQ;
                state              <=  PIO_64_RX_WAIT_STATE after TCQ;


              else

                state        <= PIO_64_RX_IO_WR_DW1DW2 after TCQ;

              end if;

            -- Stay in wait state for
            --  1. Target writes until the write has been completed and
            --     written into BRAM.
            --  2. Target reads until the completion has been generated
            --     and has been successfully transmitted via the PIO's
            --     TX interface.
            --  3. IO Write and Extended CFG write until the completion
            --     has been generated and has been successfully transmitted
            --     via the PIOs TX interface

            when PIO_64_RX_WAIT_STATE =>

              wr_en      <= '0';
              req_compl    <= '0';
              if ((tlp_type = RX_MEM_WR32_FMT_TYPE) and
                  (wr_busy = '0')) then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              elsif ((tlp_type = RX_IO_WR32_FMT_TYPE) and
                    (wr_busy = '0'))  then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              elsif ((tlp_type = RX_MEM_WR64_FMT_TYPE) and
                    (wr_busy = '0')) then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              elsif ((tlp_type = RX_MEM_RD32_FMT_TYPE) and
                    (compl_done = '1')) then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              elsif ((tlp_type = RX_IO_RD32_FMT_TYPE) and
                    (compl_done = '1')) then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              elsif ((tlp_type = RX_MEM_RD64_FMT_TYPE) and
                    (compl_done = '1')) then

                m_axis_rx_tready_int   <= '1' after TCQ;
                state        <= PIO_64_RX_RST_STATE;

              else

                state        <= PIO_64_RX_WAIT_STATE;

              end if;

            when others =>

              state <= PIO_64_RX_WAIT_STATE;

          end  case;

        end if;



    end process;

    -- bar_hit_select is used to map the four dedicated bar hit signals to the
    -- correct BlockRAM address. This ensures that TLPs destined to BARs that
    -- are configured for IO, Mem32, Mem64, and EROM transactions will be
    -- written to the PIO's BlockRAM memories that have been dedicated for IO,
    -- Mem32, Mem64,and Erom TLP storage, respectively.

    bar_hit_select <= io_bar_hit_n & mem32_bar_hit_n & mem64_bar_hit_n & erom_bar_hit_n;


    process (bar_hit_select)
    begin

      case (bar_hit_select) is

        when "0111" =>

          -- Enable BlockRAM reserved for IO TLPs for read or write
          region_select <= "00";

        when "1011" =>

          -- Enable BlockRAM reserved for Mem32 TLPs for read or write
          region_select <= "01";

        when "1101" =>

          -- Enable BlockRAM reserved for Mem64 TLPs for read or write
          region_select <= "10";

        when "1110" =>

          -- Enable BlockRAM reserved for Mem32 EROM TLPs for read or write
          region_select <= "11";

        when others =>

          region_select <= "00";

      end  case;

    end process;
  end generate pio_rx_sm_64_gen;

  pio_rx_sm_128_gen : if (C_DATA_WIDTH = 128) generate

    type state_type is (PIO_128_RX_RST_STATE,
                    PIO_128_RX_MEM_RD32_DW1DW2,
                    PIO_128_RX_MEM_WR32_DW1DW2,
                    PIO_128_RX_MEM_RD64_DW1DW2,
                    PIO_128_RX_MEM_WR64_DW1DW2,
                    PIO_128_RX_WAIT_STATE,
                    PIO_128_RX_MEM_WR64_DW3);

    -- Local Registers

    signal state                  : state_type;
    signal tlp_type               : std_logic_vector(7 downto 0);

    signal io_bar_hit_n           : std_logic;
    signal mem32_bar_hit_n        : std_logic;
    signal mem64_bar_hit_n        : std_logic;
    signal erom_bar_hit_n         : std_logic;
    signal bar_hit_select     : std_logic_vector(3 downto 0);

    signal region_select          : std_logic_vector(1 downto 0);

    signal state_ascii            : String(1 to 20) := "                    ";

    -- Declare intermediate signals for referenced outputs
    signal m_axis_rx_tready_v6pcie0 : std_logic;

    signal sof_present : std_logic;
    signal sof_right   : std_logic;
    signal sof_mid     : std_logic;

    begin


       -- Drive referenced outputs
       m_axis_rx_tready <= m_axis_rx_tready_v6pcie0;
       sof_present      <= m_axis_rx_tuser(14);
       sof_right        <= not(m_axis_rx_tuser(13)) and sof_present;
       sof_mid          <= m_axis_rx_tuser(13) and sof_present;

       process (clk)
       begin
         if (clk'event and clk = '1') then
           if (rst_n = '0') then
             m_axis_rx_tready_v6pcie0 <= '0' after TCQ;
             req_compl <= '0' after TCQ;
             req_compl_wd <= '1' after TCQ;
             req_tc <= "000" after TCQ;
             req_td <= '0' after TCQ;
             req_ep <= '0' after TCQ;
             req_attr <= "00" after TCQ;
             req_len <= "0000000000" after TCQ;
             req_rid <= "0000000000000000" after TCQ;
             req_tag <= "00000000" after TCQ;
             req_be <= "00000000" after TCQ;
             req_addr <= "0000000000000" after TCQ;
             wr_be <= "00000000" after TCQ;
             wr_addr <= "00000000000" after TCQ;
             wr_data <= "00000000000000000000000000000000" after TCQ;
             wr_en <= '0' after TCQ;
             state <= PIO_128_RX_RST_STATE after TCQ;
             tlp_type <= "00000000" after TCQ;

           else

             wr_en <= '0' after TCQ;
             req_compl <= '0' after TCQ;
             req_compl_wd <= '1' after TCQ;

             case state is

               when PIO_128_RX_RST_STATE  =>

                 m_axis_rx_tready_v6pcie0 <= '1' after TCQ;

                 -- PKT STARTS IN LOWER QW

                 if (((m_axis_rx_tvalid) and (m_axis_rx_tready_v6pcie0)) = '1') then

                   if ((sof_mid) = '1') then
                     tlp_type <= m_axis_rx_tdata(95 downto 88) after TCQ;
                     req_len <= m_axis_rx_tdata(73 downto 64) after TCQ;
                     m_axis_rx_tready_v6pcie0 <= '0' after TCQ;

                     case m_axis_rx_tdata(94 downto 88) is

                       when RX_MEM_RD32_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                           req_tc <= m_axis_rx_tdata(86 downto 84) after TCQ;
                           req_td <= m_axis_rx_tdata(79) after TCQ;
                           req_ep <= m_axis_rx_tdata(78) after TCQ;
                           req_attr <= m_axis_rx_tdata(77 downto 76) after TCQ;
                           req_len <= m_axis_rx_tdata(73 downto 64) after TCQ;
                           req_rid <= m_axis_rx_tdata(127 downto 112) after TCQ;
                           req_tag <= m_axis_rx_tdata(111 downto 104) after TCQ;
                           req_be <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state <= PIO_128_RX_MEM_RD32_DW1DW2 after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_WR32_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                           wr_be <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state <= PIO_128_RX_MEM_WR32_DW1DW2 after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_RD64_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                           req_tc <= m_axis_rx_tdata(86 downto 84) after TCQ;
                           req_td <= m_axis_rx_tdata(79) after TCQ;
                           req_ep <= m_axis_rx_tdata(78) after TCQ;
                           req_attr <= m_axis_rx_tdata(77 downto 76) after TCQ;
                           req_len <= m_axis_rx_tdata(73 downto 64) after TCQ;
                           req_rid <= m_axis_rx_tdata(127 downto 112) after TCQ;
                           req_tag <= m_axis_rx_tdata(111 downto 104) after TCQ;
                           req_be <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state <= PIO_128_RX_MEM_RD64_DW1DW2 after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_WR64_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                           wr_be <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state <= PIO_128_RX_MEM_WR64_DW1DW2 after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_IO_RD32_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                           req_tc <= m_axis_rx_tdata(86 downto 84) after TCQ;
                           req_td <= m_axis_rx_tdata(79) after TCQ;
                           req_ep <= m_axis_rx_tdata(78) after TCQ;
                           req_attr <= m_axis_rx_tdata(77 downto 76) after TCQ;
                           req_len <= m_axis_rx_tdata(73 downto 64) after TCQ;
                           req_rid <= m_axis_rx_tdata(127 downto 112) after TCQ;
                           req_tag <= m_axis_rx_tdata(111 downto 104) after TCQ;
                           req_be <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state <= PIO_128_RX_MEM_RD32_DW1DW2 after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_IO_WR32_FMT_TYPE =>
                         if (m_axis_rx_tdata(73 downto 64) = "0000000001") then
                         
                           req_tc   <= m_axis_rx_tdata(86 downto 84) after TCQ;
                           req_td   <= m_axis_rx_tdata(79) after TCQ;
                           req_ep   <= m_axis_rx_tdata(78) after TCQ;
                           req_attr <= m_axis_rx_tdata(77 downto 76) after TCQ;
                           req_len  <= m_axis_rx_tdata(73 downto 64) after TCQ;
                           req_rid  <= m_axis_rx_tdata(127 downto 112) after TCQ;
                           req_tag  <= m_axis_rx_tdata(111 downto 104) after TCQ;
                           
                           wr_be    <= m_axis_rx_tdata(103 downto 96) after TCQ;
                           state    <= PIO_128_RX_MEM_WR32_DW1DW2 after TCQ;                  
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when others =>   -- other TLPs
                         state <= PIO_128_RX_RST_STATE after TCQ;
                     end case;

                   else
                     tlp_type <= m_axis_rx_tdata(31 downto 24) after TCQ;
                     req_len <= m_axis_rx_tdata(9 downto 0) after TCQ;
                     m_axis_rx_tready_v6pcie0 <= '0' after TCQ;

                     case m_axis_rx_tdata(30 downto 24) is   -- 62:56

                       when RX_MEM_RD32_FMT_TYPE =>

                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                           req_tc   <= m_axis_rx_tdata(22 downto 20) after TCQ;
                           req_td   <= m_axis_rx_tdata(15) after TCQ;
                           req_ep   <= m_axis_rx_tdata(14) after TCQ;
                           req_attr <= m_axis_rx_tdata(13 downto 12) after TCQ;
                           req_len  <= m_axis_rx_tdata(9 downto 0) after TCQ;
                           req_rid  <= m_axis_rx_tdata(63 downto 48) after TCQ;
                           req_tag  <= m_axis_rx_tdata(47 downto 40) after TCQ;
                           req_be   <= m_axis_rx_tdata(39 downto 32) after TCQ;

                           --lower qw
                           req_addr     <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66) & "00") after TCQ;
                           req_compl    <= '1' after TCQ;
                           req_compl_wd <= '1' after TCQ;
                           state <= PIO_128_RX_WAIT_STATE after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_WR32_FMT_TYPE =>
                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                           wr_be <= m_axis_rx_tdata(39 downto 32) after TCQ;

                           --lower qw
                           wr_data <= m_axis_rx_tdata(127 downto 96) after TCQ;
                           wr_en <= '1' after TCQ;
                           wr_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66)) after TCQ;
                           wr_en <= '1' after TCQ;
                           state <= PIO_128_RX_WAIT_STATE after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_RD64_FMT_TYPE =>
                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                           req_tc <= m_axis_rx_tdata(22 downto 20) after TCQ;
                           req_td <= m_axis_rx_tdata(15) after TCQ;
                           req_ep <= m_axis_rx_tdata(14) after TCQ;
                           req_attr <= m_axis_rx_tdata(13 downto 12) after TCQ;
                           req_len <= m_axis_rx_tdata(9 downto 0) after TCQ;
                           req_rid <= m_axis_rx_tdata(63 downto 48) after TCQ;
                           req_tag <= m_axis_rx_tdata(47 downto 40) after TCQ;
                           req_be <= m_axis_rx_tdata(39 downto 32) after TCQ;

                           --lower qw
                           req_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66) & "00") after TCQ;
                           req_compl <= '1' after TCQ;                      
                           req_compl_wd <= '1' after TCQ;
                           state <= PIO_128_RX_WAIT_STATE after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_MEM_WR64_FMT_TYPE =>
                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                           wr_be <= m_axis_rx_tdata(39 downto 32) after TCQ;

                           -- lower qw
                           wr_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66)) after TCQ;
                           state <= PIO_128_RX_MEM_WR64_DW3 after TCQ;
                         else
                           state <= PIO_128_RX_WAIT_STATE after TCQ;
                         end if;

                       when RX_IO_RD32_FMT_TYPE =>
                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then
                           req_tc <= m_axis_rx_tdata(22 downto 20) after TCQ;
                           req_td <= m_axis_rx_tdata(15) after TCQ;
                           req_ep <= m_axis_rx_tdata(14) after TCQ;
                           req_attr <= m_axis_rx_tdata(13 downto 12) after TCQ;
                           req_len <= m_axis_rx_tdata(9 downto 0) after TCQ;
                           req_rid <= m_axis_rx_tdata(63 downto 48) after TCQ;
                           req_tag <= m_axis_rx_tdata(47 downto 40) after TCQ;
                           req_be <= m_axis_rx_tdata(39 downto 32) after TCQ;

                           -- lower qw
                           req_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66) & "00") after TCQ;
                           req_compl <= '1' after TCQ;
                           req_compl_wd <= '1' after TCQ;
                           state <= PIO_128_RX_WAIT_STATE after TCQ;
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when RX_IO_WR32_FMT_TYPE =>
                         if (m_axis_rx_tdata(9 downto 0) = "0000000001") then

                          --lower qw
                          req_tc       <= m_axis_rx_tdata(22 downto 20) after TCQ;
                          req_td       <= m_axis_rx_tdata(15) after TCQ;
                          req_ep       <= m_axis_rx_tdata(14) after TCQ;
                          req_attr     <= m_axis_rx_tdata(13 downto 12) after TCQ ;
                          req_len      <= m_axis_rx_tdata(9 downto 0) after TCQ;
                          req_rid      <= m_axis_rx_tdata(63 downto 48) after TCQ;
                          req_tag      <= m_axis_rx_tdata(47 downto 40) after TCQ;
  
                          wr_be <= m_axis_rx_tdata(39 downto 32) after TCQ;
                          wr_data      <= m_axis_rx_tdata(127 downto 96) after TCQ;
                          wr_en        <= '1'  after TCQ;
                          wr_addr      <= (region_select(1 downto 0) & m_axis_rx_tdata(74 downto 66)) after TCQ;
                          wr_en        <= '1' after TCQ;
                          req_compl    <= '1' after TCQ;
                          req_compl_wd <= '0' after TCQ;
                          state        <= PIO_128_RX_WAIT_STATE after TCQ;                                                     
                         else
                           state <= PIO_128_RX_RST_STATE after TCQ;
                         end if;

                       when others =>
                         state <= PIO_128_RX_RST_STATE after TCQ;

                     end case;
                   end if;

                 else   -- No packet started
                   state <= PIO_128_RX_RST_STATE after TCQ;
                 end if;                    -- PIO_128_RX_RST_STATE

               when PIO_128_RX_MEM_WR64_DW3 =>
                 if ((m_axis_rx_tvalid) = '1') then
                   wr_data <= m_axis_rx_tdata(31 downto 0) after TCQ;   -- 63:32
                   wr_en <= '1' after TCQ;
                   state <= PIO_128_RX_WAIT_STATE after TCQ;
                 else
                   state <= PIO_128_RX_MEM_WR64_DW3 after TCQ;
                 end if;

               when PIO_128_RX_MEM_RD32_DW1DW2 =>
                 if ((m_axis_rx_tvalid) = '1') then
                   m_axis_rx_tready_v6pcie0 <= '0' after TCQ;
                   req_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2) & "00") after TCQ;
                   req_compl <= '1' after TCQ;
                   req_compl_wd <= '1' after TCQ;
                   state <= PIO_128_RX_WAIT_STATE after TCQ;
                 else
                   state <= PIO_128_RX_MEM_RD32_DW1DW2 after TCQ;
                 end if;

               when PIO_128_RX_MEM_WR32_DW1DW2 =>
                 if ((m_axis_rx_tvalid) = '1') then
                   wr_data <= m_axis_rx_tdata(63 downto 32) after TCQ;
                   wr_en <= '1' after TCQ;
                   m_axis_rx_tready_v6pcie0 <= '0' after TCQ;
                   wr_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2)) after TCQ;
                   state <= PIO_128_RX_WAIT_STATE after TCQ;
                 else
                   state <= PIO_128_RX_MEM_WR32_DW1DW2 after TCQ;
                 end if;

               when PIO_128_RX_MEM_RD64_DW1DW2 =>
                 if ((m_axis_rx_tvalid) = '1') then  
                   req_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2) & "00") after TCQ;
                   req_compl <= '1' after TCQ;
                   req_compl_wd <= '1' after TCQ;
                   m_axis_rx_tready_v6pcie0 <= '0' after TCQ;
                   state <= PIO_128_RX_WAIT_STATE after TCQ;
                 else
                   state <= PIO_128_RX_MEM_RD64_DW1DW2 after TCQ;
                 end if;

               when PIO_128_RX_MEM_WR64_DW1DW2 =>
                 if ((m_axis_rx_tvalid) = '1') then
                   wr_addr <= (region_select(1 downto 0) & m_axis_rx_tdata(10 downto 2)) after TCQ;
                   -- lower QW
                   wr_data <= m_axis_rx_tdata(95 downto 64) after TCQ;
                   wr_en <= '1' after TCQ;
                   m_axis_rx_tready_v6pcie0 <= '0' after TCQ;
                   state <= PIO_128_RX_WAIT_STATE after TCQ;
                 else
                   state <= PIO_128_RX_MEM_WR64_DW1DW2 after TCQ;
                 end if;

               when PIO_128_RX_WAIT_STATE =>
                 wr_en <= '0' after TCQ;
                 req_compl <= '0' after TCQ;
                 if ((tlp_type = RX_MEM_WR32_FMT_TYPE) and ((not(wr_busy)) = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 elsif ((tlp_type = RX_IO_WR32_FMT_TYPE) and ((not(wr_busy)) = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 elsif ((tlp_type = RX_MEM_WR64_FMT_TYPE) and ((not(wr_busy)) = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 elsif ((tlp_type = RX_MEM_RD32_FMT_TYPE) and (compl_done = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 elsif ((tlp_type = RX_IO_RD32_FMT_TYPE) and (compl_done = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 elsif ((tlp_type = RX_MEM_RD64_FMT_TYPE) and (compl_done = '1')) then

                   m_axis_rx_tready_v6pcie0 <= '1' after TCQ;
                   state <= PIO_128_RX_RST_STATE after TCQ;

                 else

                   state <= PIO_128_RX_WAIT_STATE after TCQ;

                 end if;   --`PIO_128_RX_WAIT_STATE : begin

               when others => state <= PIO_128_RX_WAIT_STATE after TCQ;  
             end case;
           end if;
         end if;
       end process;

    mem64_bar_hit_n <= '1';
    io_bar_hit_n <= '1';
    mem32_bar_hit_n <= not(m_axis_rx_tuser(2));
    erom_bar_hit_n  <= not(m_axis_rx_tuser(8));

       bar_hit_select <= io_bar_hit_n & mem32_bar_hit_n & mem64_bar_hit_n & erom_bar_hit_n;

       process (bar_hit_select)
       begin
          case bar_hit_select is
             when "0111" =>
                region_select <= "00" after TCQ;   -- Select IO region
             when "1011" =>
                region_select <= "01" after TCQ;   -- Select Mem32 region
             when "1101" =>
                region_select <= "10" after TCQ;   -- Select Mem64 region
             when "1110" =>
                region_select <= "11" after TCQ;   -- Select EROM region
             when others =>
                region_select <= "00" after TCQ;   -- Error selection will select IO region
          end case;
       end process;


       -- synthesis translate_off

       process (state)
       begin
          if (state = PIO_128_RX_RST_STATE) then
            state_ascii <= "RX_RST_STATE        " after TCQ;
          elsif (state = PIO_128_RX_MEM_RD32_DW1DW2) then
            state_ascii <= "RX_MEM_RD32_DW1DW2  " after TCQ;
          elsif (state = PIO_128_RX_MEM_WR32_DW1DW2) then
            state_ascii <= "RX_MEM_WR32_DW1DW2  " after TCQ;
          elsif (state = PIO_128_RX_MEM_RD64_DW1DW2) then
            state_ascii <= "RX_MEM_RD64_DW1DW2  " after TCQ;
          elsif (state = PIO_128_RX_MEM_WR64_DW1DW2) then
            state_ascii <= "RX_MEM_WR64_DW1DW2  " after TCQ;
          elsif (state = PIO_128_RX_MEM_WR64_DW3) then
            state_ascii <= "RX_MEM_WR64_DW3     " after TCQ;
          elsif (state = PIO_128_RX_WAIT_STATE) then
            state_ascii <= "RX_WAIT_STATE       " after TCQ;
          else
            state_ascii <= "PIO 128 STATE ERR   " after TCQ;
          end if;
       end process;

    -- synthesis translate_on
  end generate pio_rx_sm_128_gen;





end; -- PIO_RX_ENGINE

