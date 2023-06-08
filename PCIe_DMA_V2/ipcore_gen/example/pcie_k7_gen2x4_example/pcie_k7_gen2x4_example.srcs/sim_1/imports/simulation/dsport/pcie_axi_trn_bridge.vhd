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
-- File       : pcie_axi_trn_bridge.vhd
-- Version    : 3.0
--
--     Description : AXI - TRN Bridge for Root Port Model. 
--                   Root Port Usrapp's require TRN interface.
--
--  This file is to be used for simulation purposes only
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity pcie_axi_trn_bridge is
  generic(
    C_DATA_WIDTH           : integer range 32 to 128 := 64;
    RBAR_WIDTH             : integer := 8;
    REM_WIDTH              : integer range 1 to 2 :=1
);
  port
  (

    -- Common
    user_clk               : in  std_logic; 
    user_reset             : in  std_logic; 
    user_lnk_up            : in  std_logic; 
  
    -- AXI TX
    -------------
    s_axis_tx_tdata        : out std_logic_vector(C_DATA_WIDTH-1 downto 0);     -- TX data from user
    s_axis_tx_tvalid       : out std_logic;                                     -- TX data is valid
    s_axis_tx_tready       : in  std_logic;                                     -- TX ready for data
    s_axis_tx_tkeep        : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0); -- TX strobe byte enables
    s_axis_tx_tlast        : out std_logic;                                     -- TX data is last
    s_axis_tx_tuser        : out std_logic_vector( 3 downto 0);                 -- TX user signals
  
    -- AXI RX
    -------------
    m_axis_rx_tdata        : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);     -- RX data to user
    m_axis_rx_tvalid       : in  std_logic;                                     -- RX data is valid
    m_axis_rx_tready       : out std_logic;                                     -- RX ready for data
    m_axis_rx_tkeep        : in  std_logic_vector((C_DATA_WIDTH/8)-1 downto 0); -- RX strobe byte enables
    m_axis_rx_tlast        : in  std_logic;                                     -- RX data is last
    m_axis_rx_tuser        : in  std_logic_vector(21 downto 0);                 -- RX user signals
  
    -------------------------------------------------
    -- PCIe Usrapp I/O                             --
    -------------------------------------------------
  
    -- TRN TX
    -------------
    trn_td                 : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);    -- TX data from usrapp
    trn_tsof               : in  std_logic;                                    -- TX start of packet
    trn_teof               : in  std_logic;                                    -- TX end of packet
    trn_tsrc_rdy           : in  std_logic;                                    -- TX source ready
    trn_tdst_rdy           : out std_logic;                                    -- TX destination ready
    trn_tsrc_dsc           : in  std_logic;                                    -- TX source discontinue
    trn_trem               : in  std_logic_vector(REM_WIDTH-1 downto 0);       -- TX remainder
    trn_terrfwd            : in  std_logic;                                    -- TX error forward
    trn_tstr               : in  std_logic;                                    -- TX streaming enable
    trn_tecrc_gen          : in  std_logic;                                    -- TX ECRC generate
                        
    -- TRN RX
    -------------
    trn_rd                 : out std_logic_vector(C_DATA_WIDTH-1 downto 0);    -- RX data to usrapp
    trn_rsof               : out std_logic;                                    -- RX start of packet
    trn_reof               : out std_logic;                                    -- RX end of packet
    trn_rsrc_rdy           : out std_logic;                                    -- RX source ready
    trn_rdst_rdy           : in  std_logic;                                    -- RX destination ready
    trn_rsrc_dsc           : out std_logic;                                    -- RX source discontinue
    trn_rrem               : out std_logic_vector(REM_WIDTH-1 downto 0);       -- RX remainder
    trn_rerrfwd            : out std_logic;                                    -- RX error forward
    trn_rbar_hit           : out std_logic_vector(RBAR_WIDTH-1 downto 0)       -- RX BAR hit

 );

end pcie_axi_trn_bridge; 

architecture rtl of pcie_axi_trn_bridge is 


  signal is_sof : std_logic_vector(4 downto 0);
  signal is_eof : std_logic_vector(4 downto 0);
  
  signal trn_tdst_rdy_int     : std_logic;
  signal trn_tsrc_rdy_derived : std_logic := '0';
  signal in_packet_reg        : std_logic;
  signal m_axis_rx_tready_int : std_logic;
  
begin


--DWORD Reordering between AXI and TRN interface--

  gen_axis_txdata_64 : if (C_DATA_WIDTH = 64) generate
  begin 
      s_axis_tx_tdata <= trn_td(31 downto 0) & trn_td(63 downto 32);
  end generate;
  
  gen_axis_txdata_128 : if (C_DATA_WIDTH = 128) generate
  begin 
      s_axis_tx_tdata <= trn_td(31 downto  0) & trn_td( 63 downto 32) &
                         trn_td(95 downto 64) & trn_td(127 downto 96);
  end generate;
  
  
  --Coversion from trn_rem to s_axis_tkeep[7:0]--
  
  
  gen_axis_tx_tkeep_64 : if (C_DATA_WIDTH = 64) generate
  begin
  
    CMB_STRB_MUX : process(trn_teof,trn_trem)
    begin
      if (trn_teof = '1' and trn_trem(0) = '0') then
        s_axis_tx_tkeep <= X"0F";
      else
        s_axis_tx_tkeep <= X"FF";
      end if;
    end process;
                       
  end generate;
  
  
  gen_axis_tx_tkeep_128 : if (C_DATA_WIDTH = 128) generate
  begin
   
    CMB_STRB_MUX : process(trn_teof,trn_trem)
    begin
      if trn_teof = '1' then
        if trn_trem = "11" then
          s_axis_tx_tkeep <= X"FFFF";
        elsif trn_trem = "10" then
          s_axis_tx_tkeep <= X"0FFF";
        elsif trn_trem = "01" then
          s_axis_tx_tkeep <= X"00FF";
        else
          s_axis_tx_tkeep <= X"000F";
        end if;  
      else
        s_axis_tx_tkeep <= X"FFFF";
      end if;
    end process;
    
  end generate;
  
  
  
  --Connection of s_axis_tx_tuser with  trn_tsrc_dsc,trn_tstr,trn_terr_fwd and trn_terr_fwd
  s_axis_tx_tuser(3) <= trn_tsrc_dsc; 
  s_axis_tx_tuser(2) <= trn_tstr;
  s_axis_tx_tuser(1) <= trn_terrfwd;
  s_axis_tx_tuser(0) <= trn_tecrc_gen;
  
  --Constraint trn_tsrc_rdy. If constrained, testbench keep trn_tsrc_rdy constantly asserted. This makes axi bridge to generate trn_tsof immeditely after trn_teof of previous packet.--
  
   TRN_TSRC_RDY_DRVD : process(trn_tsof,trn_tsrc_rdy,trn_tdst_rdy_int,trn_teof,trn_tsrc_rdy_derived)
   begin
     
       if (trn_tsof  = '1' and trn_tsrc_rdy = '1' and trn_tdst_rdy_int = '1' and trn_teof = '0') then
         trn_tsrc_rdy_derived <= '1';
       elsif (trn_tsrc_rdy_derived = '1' and trn_teof = '1' and trn_tsrc_rdy = '1' and trn_tdst_rdy_int = '1') then 
         trn_tsrc_rdy_derived <= '0';
       end if;
   end process;
  
  s_axis_tx_tvalid <= trn_tsrc_rdy_derived or trn_tsof or trn_teof;
  
  trn_tdst_rdy         <= s_axis_tx_tready;
  trn_tdst_rdy_int     <= s_axis_tx_tready;
                       
  s_axis_tx_tlast      <= trn_teof;
  
  m_axis_rx_tready     <= trn_rdst_rdy;
  m_axis_rx_tready_int <= trn_rdst_rdy;
  
    
  
  gen_trn_rd_64 : if (C_DATA_WIDTH = 64) generate
  begin 
    trn_rd <= m_axis_rx_tdata( 31 downto  0) & m_axis_rx_tdata( 63 downto 32);
  end generate;
    
  gen_trn_rd_128 : if (C_DATA_WIDTH = 128) generate
  begin
    trn_rd <= m_axis_rx_tdata( 31 downto  0) & m_axis_rx_tdata( 63 downto 32) & 
              m_axis_rx_tdata( 95 downto 64) & m_axis_rx_tdata(127 downto 96);
  end generate;
  
  --Regenerate trn_rsof
  --Used clock. Latency may have been added
  
  
  gen_trn_rsof_64 : if (C_DATA_WIDTH = 64) generate
  begin
  
    in_pckt_register : process(user_clk)
    begin
      if rising_edge(user_clk) then
        if user_reset = '1' then
          in_packet_reg <= '0';
        elsif (m_axis_rx_tvalid = '1' and m_axis_rx_tready_int = '1') then
          in_packet_reg <= not(m_axis_rx_tlast);
        end if;
      end if;
    end process;
  
    trn_rsof <= m_axis_rx_tvalid and not(in_packet_reg);
  
  end generate;
  
  gen_trn_rsof_128 : if (C_DATA_WIDTH = 128) generate
  begin
  
    trn_rsof <= m_axis_rx_tuser(14);
  
  end generate;
  
  
  
  
  gen_trn_reof_64 : if (C_DATA_WIDTH = 64) generate
  begin
  
    trn_reof <= m_axis_rx_tlast;
  
  end generate;
  
  gen_trn_reof_128 : if (C_DATA_WIDTH = 128) generate
  begin
  
    trn_reof <= m_axis_rx_tuser(21); --is_eof(4);
  
  end generate;
  
  trn_rsrc_rdy <= m_axis_rx_tvalid;
  
  
  --Regenerate trn_rsrc_dsc
  --Used clock. Latency may have been added
  trn_rsrc_dsc_reg : process(user_clk)
  begin
  
    if rising_edge(user_clk) then
      if user_reset = '1' then
        trn_rsrc_dsc <= '1';     
      else
        trn_rsrc_dsc <= not(user_lnk_up);
      end if;
    end if;
  end process;
    
  
  is_sof <= m_axis_rx_tuser(14 downto 10);
  is_eof <= m_axis_rx_tuser(21 downto 17);
  
  
  gen_trn_rrem_64 : if (C_DATA_WIDTH = 64) generate
  begin
                   
    CMB_TRN_RREM : process(m_axis_rx_tlast,m_axis_rx_tkeep)
    begin
      if (m_axis_rx_tlast = '1') then
        if ( m_axis_rx_tkeep = X"FF") then
          trn_rrem(0) <= '1';
        else
          trn_rrem(0) <= '0';
        end if;
      else
       trn_rrem(0) <= '1';
      end if;
    end process;                
  end generate;
  
  gen_trn_rrem_128 : if (C_DATA_WIDTH = 128) generate
  begin
    
    trn_rrem(0) <= is_eof(2);
    
    CMB_TRN_RREM : process(is_eof,is_sof)
    begin
      if (is_eof(4) = '1'  or is_sof(4) = '1') then
      
        trn_rrem(1) <= ((     is_sof(4 ) and      is_eof(4)  and      is_eof(3) ) or
                        ((not is_sof(4)) and      is_eof(4)  and      is_eof(3) ) or
                        (     is_sof(4)  and (not is_eof(4)) and (not is_sof(3))));
      else
        trn_rrem(1) <= '1';
      end if;  
    end process;      
  end generate;  
  
  trn_rerrfwd <= m_axis_rx_tuser(1);
  
  trn_rbar_hit <= '0' & m_axis_rx_tuser(8 downto 2);


end rtl; 

