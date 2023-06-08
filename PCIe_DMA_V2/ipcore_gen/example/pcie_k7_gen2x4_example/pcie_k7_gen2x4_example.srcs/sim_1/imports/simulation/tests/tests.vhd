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
-- File       : tests.vhd
-- Version    : 3.0
---- Description:  Test program file.
----
----
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;
use work.test_interface.all;


entity tests is
generic (
  test_selector : in string  := String'("pio_writeReadBack_test0");
  C_DATA_WIDTH  : integer := 64;        -- Data Bus width
  TRN_REM_WIDTH : integer := 8          -- Remainder Width
 );
port (

  trn_td                   : out std_logic_vector ((C_DATA_WIDTH - 1) downto 0 );
  trn_trem_n               : out std_logic_vector ((TRN_REM_WIDTH - 1) downto 0 );
  trn_tsof_n               : out std_logic;
  trn_teof_n               : out std_logic;
  trn_terrfwd_n	           : out std_logic;
  trn_tsrc_rdy_n           : out std_logic;
  trn_tsrc_dsc_n           : out std_logic;
  trn_clk                  : in std_logic;
  trn_reset_n              : in std_logic;
  trn_lnk_up_n             : in std_logic;
  trn_tdst_rdy_n           : in std_logic;
  trn_tdst_dsc_n           : in std_logic;
  trn_tbuf_av              : in std_logic_vector (5 downto 0);
  speed_change_done_n      : in std_logic;
  rx_tx_read_data          : in std_logic_vector(31 downto 0);
  rx_tx_read_data_valid    : in std_logic;
  tx_rx_read_data_valid    : out std_logic

);

end tests;

-- Package Declaration

architecture rtl of  tests is

begin

  trn_td <= trn_td_c;
  
  gen_64_gen : if C_DATA_WIDTH = 64 generate
  begin
  
    trn_trem_n <= trn_trem_n_c;
  end generate;
  
  gen_128_gen : if C_DATA_WIDTH = 128 generate
  begin
  
    trn_trem_n <= "000000" & trn_trem_n_c;
  end generate;
  
  



  TX_STIMULI : process

    begin

      pio_check_design := true; -- By default check to make sure that the core has been configured
                                                -- appropriately for the PIO Design (see user guide for details)
      NUMBER_OF_IO_BARS := 0;
      NUMBER_OF_MEM32_BARS := 0;
      NUMBER_OF_MEM64_BARS :=0;

      frame_store_tx_idx := 0;
      success := true;

      trn_tsof_n <= '1';
      trn_teof_n <= '1';
      trn_terrfwd_n <= '1';
      trn_tsrc_rdy_n <= '1';
      trn_tsrc_dsc_n <= '1';
      trn_td_c <= (others => '0');
      tx_rx_read_data_valid <= '0';

     writeNowToScreen(String'("CoreName = pcie_7x"));

----------------------------------------------------------------------------------------
-- Testname: smoke_test
----------------------------------------------------------------------------------------

    if (test_selector = String'("sample_smoke_test0")) then

      writeNowToScreen(String'("Running sample_smoke_test0"));

      write (LGlobal, String'("Expected Device/Vendor ID = 0x")); 
      hwrite(LGlobal, DEV_VEN_ID);
      writeline (output, LGlobal);

      PROC_SYSTEM_INITIALIZATION(trn_reset_n, trn_lnk_up_n, speed_change_done_n);

    --------------------------------------------------------------------------
    -- Read core configuration space via PCIe fabric interface
   --------------------------------------------------------------------------

      writeNowToScreen(String'("Reading from PCI/PCI-Express Configuration Register 0x00"));


      PROC_TX_TYPE0_CONFIGURATION_READ (
        X"00", X"000", X"F", trn_td_c, trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n,
        trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

      PROC_WAIT_FOR_READ_DATA (tx_rx_read_data_valid, rx_tx_read_data_valid, rx_tx_read_data, trn_clk);

      if (P_READ_DATA = DEV_VEN_ID) then

        writeNowToScreen(String'("TEST PASSED. Completion Data = DEV_VEN_ID "));
        writeNowToScreen(String'("Test Completed Successfully"));

      else

        success := false;
        writeNowToScreen(String'("TEST FAILED. Completion Data != DEV_VEN_ID "));
        write (LGlobal, String'("Data = 0x"));
        hwrite(LGlobal, P_READ_DATA);
        writeline (output, LGlobal);

      end if;


----------------------------------------------------------------------------------------
-- Testname: pio_write_readBack_test0
----------------------------------------------------------------------------------------

    elsif (test_selector = String'("pio_writeReadBack_test0")) then

      writeNowToScreen(String'("Running pio_writeReadBack_test0"));

      PROC_SYSTEM_INITIALIZATION(trn_reset_n, trn_lnk_up_n, speed_change_done_n);

      PROC_BAR_INIT (tx_rx_read_data_valid, rx_tx_read_data_valid, rx_tx_read_data, trn_td_c,
        trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n, trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

      PROC_TX_CLK_EAT(300, trn_clk);

      for i in 0 to 6 loop

        case BAR_ENABLED(i) is

          when 1 =>

-- Test PIO IO Space

            write (Lglobal, String'("Testing PIO IO Space BAR "));
            hwrite(Lglobal, std_logic_vector(to_unsigned(i, 4)));
            writeline (output, Lglobal);

            PROC_TX_IO_WRITE (
              X"00", BAR(i)(31 downto 0), X"F", X"DEADBEEF",
              trn_td_c, trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n, trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            P_READ_DATA := X"FFFFFFFF";

            PROC_TX_IO_READ (
              X"01", BAR(i)(31 downto 0), X"F",
              trn_td_c, trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n, trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            PROC_WAIT_FOR_READ_DATA (tx_rx_read_data_valid, rx_tx_read_data_valid, rx_tx_read_data, trn_clk);

            if (P_READ_DATA = X"DEADBEEF") then

              writeNowToScreen(String'("Test PASSED. Completion Data = 0xDEADBEEF "));

            else

              success := false;
              writeNowToScreen(String'("Test FAILED. Completion Data != 0xDEADBEEF. "));
              write (LGlobal, String'("Data = 0x"));
              hwrite(LGlobal, P_READ_DATA);
              writeline (output, LGlobal);

            end if;

            PROC_TX_CLK_EAT(100, trn_clk);

          when 2 =>

-- Test PIO Mem32 Space
            write (Lglobal, String'("Testing PIO Mem32 Space BAR "));
            hwrite(Lglobal, std_logic_vector(to_unsigned(i, 4)));
            writeline (output, Lglobal);

            DATA_STORE(0) := X"04";
            DATA_STORE(1) := X"03";
            DATA_STORE(2) := X"02";
            DATA_STORE(3) := X"01";


            PROC_TX_MEMORY_WRITE_32 (
              X"02", "000", "0000000001", BAR(i)(31 downto 0), X"0", X"F",'0',
              trn_td_c, trn_tsof_n, trn_teof_n , trn_trem_n_c, trn_tsrc_rdy_n, trn_terrfwd_n,
              trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            P_READ_DATA := X"FFFFFFFF";

            PROC_TX_MEMORY_READ_32 (
              X"03", "000", "0000000001", BAR(i)(31 downto 0), X"0", X"F",
              trn_td_c, trn_tsof_n, trn_teof_n , trn_trem_n_c, trn_tsrc_rdy_n, trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            PROC_WAIT_FOR_READ_DATA (tx_rx_read_data_valid, rx_tx_read_data_valid, rx_tx_read_data, trn_clk);


            if (P_READ_DATA = X"01020304") then

              writeNowToScreen(String'("Test PASSED. Completion Data = 0x01020304"));

            else

              success := false;
              writeNowToScreen(String'("Test FAILED. Completion Data != 0x01020304"));
              write (LGlobal, String'("Data = 0x"));
              hwrite(LGlobal, P_READ_DATA);
              writeline (output, LGlobal);

            end if;

            PROC_TX_CLK_EAT(100, trn_clk);

          when 3 =>

-- Test PIO Mem64 Space

            write (Lglobal, String'("Testing PIO Mem64 Space BAR "));
            hwrite(Lglobal, std_logic_vector(to_unsigned(i, 4)));
            writeline (output, Lglobal);

            DATA_STORE(0) := X"64";
            DATA_STORE(1) := X"63";
            DATA_STORE(2) := X"62";
            DATA_STORE(3) := X"61";

            PROC_TX_MEMORY_WRITE_64 (
              X"04", "000", "0000000001", BAR(i+1)(31 downto 0) & BAR(i)(31 downto 0), X"0", X"F",'0',
              trn_td_c, trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n, trn_terrfwd_n,
              trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            P_READ_DATA := X"FFFFFFFF";

            PROC_TX_MEMORY_READ_64 (
              X"05", "000", "0000000001", BAR(i+1)(31 downto 0) & BAR(i)(31 downto 0), X"0", X"F",
              trn_td_c, trn_tsof_n, trn_teof_n, trn_trem_n_c, trn_tsrc_rdy_n, trn_lnk_up_n, trn_tdst_rdy_n, trn_clk);

            PROC_WAIT_FOR_READ_DATA (tx_rx_read_data_valid, rx_tx_read_data_valid, rx_tx_read_data, trn_clk);


            if (P_READ_DATA = X"61626364") then

               writeNowToScreen(String'("Test PASSED. Completion Data = 0x61626364"));

            else

              success := false;
              writeNowToScreen(String'("Test FAILED. Completion Data != 0x61626364."));
              write (LGlobal, String'("Data = 0x"));
              hwrite(LGlobal, P_READ_DATA);
              writeline (output, LGlobal);

            end if;

            PROC_TX_CLK_EAT(100, trn_clk);

          when others    =>

        end case;

      end loop;

      PROC_TX_CLK_EAT(100, trn_clk);
   
      if (success = true) then
        writeNowToScreen(String'("Test Completed Successfully"));
      end if ;

    else

      writeNowToScreen(String'("ERROR: No test has been selected"));
      FINISH_FAILURE;

    end if;   -- test selection

    ----------------------------------------------------------------------------
    -- Direct Root Port to allow upstream traffic by enabling Mem, I/O and
    -- BusMstr in the command register
    ----------------------------------------------------------------------------
    PROC_READ_CFG_DW(conv_std_logic_vector(1, 10), cfg_rdwr_int);
    PROC_WRITE_CFG_DW(conv_std_logic_vector(1, 10), x"00000007", "1110", cfg_rdwr_int);
    PROC_READ_CFG_DW(conv_std_logic_vector(1, 10), cfg_rdwr_int);

    if (success = false) then
       FINISH_FAILURE;
    end if;

    FINISH;

    wait; -- added just in case previous FINISH calls are removed

  end process TX_STIMULI;


end; -- tests
