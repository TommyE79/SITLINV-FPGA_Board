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
-- File       : PIO_TO_CTRL.vhd
-- Version    : 3.1
--
-- Description: Turn-off Control Unit
--
--
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity PIO_TO_CTRL is
generic (
  TCQ          : time                    := 1 ps
);
port (
  clk                 : in std_logic;
  rst_n               : in std_logic;

  req_compl           : in std_logic;
  compl_done          : in std_logic;

  cfg_to_turnoff      : in std_logic;
  cfg_turnoff_ok      : out std_logic
);
end PIO_TO_CTRL;

architecture rtl of PIO_TO_CTRL is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  signal trn_pending : std_logic;

begin

  --
  -- Check if completion is pending
  --
  process begin
    wait until rising_edge(clk);
    if (rst_n = '0') then
      trn_pending    <= '0' after TCQ;
    else
      if ((trn_pending = '0') and (req_compl = '1')) then
        trn_pending  <= '1' after TCQ;
      elsif (compl_done = '1') then
        trn_pending  <= '0' after TCQ;
      end if;
    end if;
  end process;

  --
  --  Turn-off OK if requested and no transaction is pending
  --
  process begin
    wait until rising_edge(clk);
    if (rst_n = '0') then
      cfg_turnoff_ok  <= '0' after TCQ;
    else
      if ((cfg_to_turnoff = '1') and (trn_pending = '0')) then
        cfg_turnoff_ok <= '1' after TCQ;
      else
        cfg_turnoff_ok <= '0' after TCQ;
      end if;
    end if;
  end process;

end rtl;

