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
-- File       : PIO_TX_ENGINE.vhd
-- Version    : 3.0
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
-- File       : PIO_TX_ENGINE.vhd
-- Version    : 2.2
--
-- Description: 64/128 bit Local-Link Transmit Unit.
--
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity PIO_TX_ENGINE is
generic (
  C_DATA_WIDTH : integer range 64 to 128 := 64;
  TCQ          : time                    := 1 ps
);
port (

  clk                      : in std_logic;
  rst_n                    : in std_logic;

  -- AXIS
  s_axis_tx_tready      : in  std_logic;
  s_axis_tx_tdata       : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  s_axis_tx_tkeep       : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  s_axis_tx_tlast       : out std_logic;
  s_axis_tx_tvalid      : out std_logic;
  tx_src_dsc            : out std_logic;

  req_compl             : in  std_logic;
  req_compl_wd          : in  std_logic;
  compl_done            : out  std_logic;
                        
  req_tc                : in std_logic_vector(2 downto 0);
  req_td                : in  std_logic;
  req_ep                : in  std_logic;
  req_attr              : in std_logic_vector(1 downto 0);
  req_len               : in std_logic_vector(9 downto 0);
  req_rid               : in std_logic_vector(15 downto 0);
  req_tag               : in std_logic_vector(7 downto 0);
  req_be                : in std_logic_vector(7 downto 0);
  req_addr              : in std_logic_vector(12 downto 0);
                        
  rd_addr               : out std_logic_vector(10 downto 0);
  rd_be                 : out std_logic_vector(3 downto 0);
  rd_data               : in std_logic_vector(31 downto 0);
                          
  completer_id          : in std_logic_vector(15 downto 0)

);

end PIO_TX_ENGINE;

architecture rtl of PIO_TX_ENGINE is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  signal req_compl_q           : std_logic;
  signal req_compl_wd_q        : std_logic;
  signal req_compl_q2          : std_logic;
  signal req_compl_wd_q2       : std_logic;
  signal rd_be_int             : std_logic_vector(3 downto 0);
  signal byte_count            : std_logic_vector(11 downto 0);
  signal lower_addr            : std_logic_vector(6 downto 0);

  -- TLP Header format/type values
  constant PIO_CPLD_FMT_TYPE : std_logic_vector(6 downto 0) := "1001010";
  constant PIO_CPL_FMT_TYPE  : std_logic_vector(6 downto 0) := "0001010";

  signal compl_busy_i : std_logic;

  attribute mark_debug : string;
  attribute keep : string;

begin

  process begin
    wait until rising_edge(clk);
    if (rst_n = '0') then
      req_compl_q            <= '0' after TCQ;
      req_compl_wd_q         <= '1' after TCQ;
    else
      req_compl_q            <= req_compl after TCQ;
      req_compl_wd_q         <= req_compl_wd after TCQ;
    end if;
  end process;

  --
  -- Unused discontinue signal
  --

  tx_src_dsc <= '0';

  --
  -- Assign byte enables to output bus
  --

  rd_be <= rd_be_int;

  --
  -- Present address and byte enable to memory module
  --
  rd_addr    <= req_addr(12 downto 2);

  process (clk )
  begin
   if (clk'event and clk = '1') then
     if (rst_n = '0') then
        rd_be_int <= (OTHERS => '0') after TCQ;
     else
        rd_be_int <= req_be(3 downto 0) after TCQ;
     end if;
   end if;
  end process;

  --
  -- Calculate byte count based on byte enable
  --
  process(rd_be_int) begin
    case rd_be_int(3 downto 0) is
      when "1001" => byte_count <= X"004";
      when "1011" => byte_count <= X"004";
      when "1101" => byte_count <= X"004";
      when "1111" => byte_count <= X"004";
      when "0101" => byte_count <= X"003";
      when "0111" => byte_count <= X"003";
      when "1010" => byte_count <= X"003";
      when "1110" => byte_count <= X"003";
      when "0011" => byte_count <= X"002";
      when "0110" => byte_count <= X"002";
      when "1100" => byte_count <= X"002";
      when "0001" => byte_count <= X"001";
      when "0010" => byte_count <= X"001";
      when "0100" => byte_count <= X"001";
      when "1000" => byte_count <= X"001";
      when "0000" => byte_count <= X"001";
      when others => byte_count <= X"000";
    end case;
  end process;

  --
  -- Calculate lower address based on  byte enable
  --

  process(rd_be_int, req_addr) begin
    case (rd_be_int(3 downto 0)) is
      when "0000" => lower_addr <= req_addr(6 downto 2) & "00";
      when "0001" => lower_addr <= req_addr(6 downto 2) & "00";
      when "0011" => lower_addr <= req_addr(6 downto 2) & "00";
      when "0101" => lower_addr <= req_addr(6 downto 2) & "00";
      when "0111" => lower_addr <= req_addr(6 downto 2) & "00";
      when "1001" => lower_addr <= req_addr(6 downto 2) & "00";
      when "1011" => lower_addr <= req_addr(6 downto 2) & "00";
      when "1101" => lower_addr <= req_addr(6 downto 2) & "00";
      when "1111" => lower_addr <= req_addr(6 downto 2) & "00";
      when "0010" => lower_addr <= req_addr(6 downto 2) & "01";
      when "0110" => lower_addr <= req_addr(6 downto 2) & "01";
      when "1010" => lower_addr <= req_addr(6 downto 2) & "01";
      when "1110" => lower_addr <= req_addr(6 downto 2) & "01";
      when "0100" => lower_addr <= req_addr(6 downto 2) & "10";
      when "1100" => lower_addr <= req_addr(6 downto 2) & "10";
      when "1000" => lower_addr <= req_addr(6 downto 2) & "11";
      when others => lower_addr <= req_addr(6 downto 2) & "00";
    end case;
  end process;


  cpl_64_gen : if (C_DATA_WIDTH = 64) generate



    -- States
    type state_type is (
      PIO_64_TX_RST_STATE,
      PIO_64_TX_CPLD_QW1_FIRST,
      PIO_64_TX_CPLD_QW1_TEMP,
      PIO_64_TX_CPLD_QW1
    );
    signal state                 : state_type;

    -- Local signals
    signal cpl_w_data            : std_logic;

    begin

      --
      --  Generate Completion with 1 DW Payload or Completion with
      --  no data
      --
      process begin
        wait until rising_edge(clk);
        if (rst_n = '0') then

          s_axis_tx_tlast   <= '0' after TCQ;
          s_axis_tx_tvalid  <= '0' after TCQ;
          s_axis_tx_tdata   <= (others => '0') after TCQ;
          s_axis_tx_tkeep   <= (others => '1') after TCQ;

          compl_done        <= '0' after TCQ;
          compl_busy_i      <= '0' after TCQ;

          state             <= PIO_64_TX_RST_STATE after TCQ;
        else
          compl_done        <= '0' after TCQ;

          if req_compl_q = '1' then
            compl_busy_i <= '1';
          end if;


          case (state) is
            when PIO_64_TX_RST_STATE =>
              if (compl_busy_i = '1') then
                s_axis_tx_tlast   <= '0' after TCQ;
                s_axis_tx_tvalid  <= '0' after TCQ;
                s_axis_tx_tdata   <= (others => '0') after TCQ; -- 64-bit
                s_axis_tx_tkeep   <= x"FF" after TCQ;
                if (s_axis_tx_tready = '1') then
                  state           <= PIO_64_TX_CPLD_QW1_FIRST after TCQ;
                else
                  state           <= PIO_64_TX_RST_STATE after TCQ;
                end if;
              else
                state             <= PIO_64_TX_RST_STATE after TCQ;
                compl_done        <= '0' after TCQ;
                s_axis_tx_tlast   <= '0' after TCQ;
                s_axis_tx_tvalid  <= '0' after TCQ;
                s_axis_tx_tdata   <= (others => '0') after TCQ; -- 64-bit
                s_axis_tx_tkeep   <= x"FF" after TCQ;
              end if;

              when PIO_64_TX_CPLD_QW1_FIRST =>
			
					
              if (s_axis_tx_tready = '1') then
				  
						  s_axis_tx_tlast   <= '0' after TCQ;
						  s_axis_tx_tvalid  <= '1' after TCQ;
						  s_axis_tx_tkeep   <= x"FF" after TCQ;

							 -- Swap DWORDS for AXI
							 if (req_compl_wd_q = '1')  then
								-- Begin a CplD TLP
								s_axis_tx_tdata  <=  completer_id &
															"000" &
															'0' &
															byte_count &
															'0' &
															PIO_CPLD_FMT_TYPE &
															'0' &
															req_tc &
															"0000" &
															req_td &
															req_ep &
															req_attr &
															"00" &
															req_len after TCQ;

							 else
							  -- Begin a Cpl TLP
								s_axis_tx_tdata  <=  completer_id &
															"000" &
															'0' &
															byte_count &
															'0' &
															PIO_CPL_FMT_TYPE &
															'0' &
															req_tc &
															"0000" &
															req_td &
															req_ep &
															req_attr &
															"00" &
															req_len after TCQ;
							 end if;
							  --Wait in this state if the PCIe core does not accept
							  --the first beat of the packet
							 state             <= PIO_64_TX_CPLD_QW1_TEMP after TCQ;
               else
						
                      state             <= PIO_64_TX_RST_STATE after TCQ;
							 
					end if;
              -- end of PIO_64_TX_RST_STATE
				  
		   when PIO_64_TX_CPLD_QW1_TEMP =>
					
			    s_axis_tx_tvalid <= '0' after TCQ;
				 state <=  PIO_64_TX_CPLD_QW1 after TCQ;


            when PIO_64_TX_CPLD_QW1 =>

              if (s_axis_tx_tready = '1') then

                s_axis_tx_tlast  <= '1' after TCQ;
                s_axis_tx_tvalid <= '1' after TCQ;
                -- Swap DWORDS for AXI
                s_axis_tx_tdata  <=   rd_data &
                                      req_rid &
                                      req_tag &
                                      '0' &
                                      lower_addr after TCQ;

                -- Here we select if the packet has data or
                -- not.  The strobe signal will mask data
                -- when it is not needed.  No reason to change
                -- the data bus.
                if (req_compl_wd_q = '1')then
                  s_axis_tx_tkeep <= x"FF" after TCQ;
                else
                  s_axis_tx_tkeep <= x"0F" after TCQ;
                end if;

                compl_done        <= '1' after TCQ;
 -- De-assert compl_busy...
                compl_busy_i      <= '0' after TCQ;

                state             <= PIO_64_TX_RST_STATE after TCQ;

              else
                 state            <= PIO_64_TX_CPLD_QW1 after TCQ;
              end if;

            when others =>
              state              <= PIO_64_TX_RST_STATE after TCQ;
          end case;
        end if;
      end process;
    end generate cpl_64_gen;


    cpl_128_gen : if (C_DATA_WIDTH = 128) generate

      -- Local registers

      signal hold_state             : std_logic;


    begin


      process (clk)
      begin
        if (clk'event and clk = '1') then

          if (rst_n = '0') then

            req_compl_q2    <= '0' after TCQ;
            req_compl_wd_q2 <= '0' after TCQ;

          else

            req_compl_q2    <= req_compl_q after TCQ;
            req_compl_wd_q2 <= req_compl_wd_q after TCQ;

          end if;
        end if;
      end process;


      --
      -- Generate Completion with 1 DW Payload
      --

      process (clk)
      begin
        if (clk'event and clk = '1') then

          if (rst_n = '0') then

            s_axis_tx_tlast   <= '0' after TCQ;
            s_axis_tx_tvalid  <= '0' after TCQ;
            s_axis_tx_tdata   <= (others => '0') after TCQ;

            s_axis_tx_tkeep   <= (others => '1') after TCQ;
            compl_done        <= '0' after TCQ;

            hold_state <= '0' after TCQ;
          else

            if ((req_compl_q2 or hold_state) = '1') then
              if ((s_axis_tx_tready) = '1') then

                s_axis_tx_tlast <= '1' after TCQ;
                s_axis_tx_tvalid <= '1' after TCQ;

                -- Here we select if the packet has data or
                -- not.  The strobe signal will mask data
                -- when it is not needed.

                if (req_compl_wd_q2 = '1') then
                  s_axis_tx_tdata <= (
                                    rd_data &
                                    req_rid &
                                    req_tag &
                                    '0' &
                                    lower_addr &
                                    completer_id &
                                    "000" &
                                    '0' &
                                    byte_count &
                                    '0' &
                                    PIO_CPLD_FMT_TYPE &
                                    '0' &
                                    req_tc &
                                    "0000" &
                                    req_td &
                                    req_ep &
                                    req_attr &
                                    "00" &
                                    req_len
                                    ) after TCQ;

                  s_axis_tx_tkeep <= x"FFFF" after TCQ;
                else
                  s_axis_tx_tdata <= (
                                    rd_data &
                                    req_rid &
                                    req_tag &
                                    '0' &
                                    lower_addr &
                                    completer_id &
                                    "000" &
                                    '0' &
                                    byte_count &
                                    '0' &
                                    PIO_CPL_FMT_TYPE &
                                    '0' &
                                    req_tc &
                                    "0000" &
                                    req_td &
                                    req_ep &
                                    req_attr &
                                    "00" &
                                    req_len
                                    ) after TCQ;

                  s_axis_tx_tkeep <= x"0FFF" after TCQ;
                end if;
                compl_done <= '1' after TCQ;

                hold_state <= '0' after TCQ;
              else

                hold_state <= '1' after TCQ;
              end if;
            else

              s_axis_tx_tlast  <= '0' after TCQ;
              s_axis_tx_tvalid <= '0' after TCQ;
              s_axis_tx_tdata  <= (others => '0') after TCQ;
              s_axis_tx_tkeep  <= (others => '1') after TCQ;
              compl_done       <= '0' after TCQ;
            end if;
          end if;
        end if;
      end process;
    end generate cpl_128_gen;

end rtl;


