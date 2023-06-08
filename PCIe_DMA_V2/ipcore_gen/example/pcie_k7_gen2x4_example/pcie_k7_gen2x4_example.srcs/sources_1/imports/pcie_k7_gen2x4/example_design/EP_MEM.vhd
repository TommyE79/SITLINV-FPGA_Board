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
-- File       : EP_MEM.vhd
-- Version    : 3.0
--
-- Description: Endpoint Memory: 8KB organized as 4 x (512 DW) BlockRAM banks.
--              Block RAM Port A: Read Port
--              Block RAM Port B: Write Port
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

entity EP_MEM is port (

  clk : in std_logic ;

  a_rd_a_i_0 : in std_logic_vector(8 downto 0);
  a_rd_d_o_0 : out std_logic_vector(31 downto 0);
  a_rd_en_i_0 : in std_logic ;

  b_wr_a_i_0 : in std_logic_vector(8 downto 0);
  b_wr_d_i_0 : in std_logic_vector(31 downto 0);
  b_wr_en_i_0 : in std_logic ;
  b_rd_d_o_0 : out std_logic_vector(31 downto 0);
  b_rd_en_i_0 : in std_logic ;

  a_rd_a_i_1 : in std_logic_vector(8 downto 0);
  a_rd_d_o_1 : out std_logic_vector(31 downto 0);
  a_rd_en_i_1 : in std_logic ;

  b_wr_a_i_1 : in std_logic_vector(8 downto 0);
  b_wr_d_i_1 : in std_logic_vector(31 downto 0);
  b_wr_en_i_1 : in std_logic ;
  b_rd_d_o_1 : out std_logic_vector(31 downto 0);
  b_rd_en_i_1 : in std_logic ;

  a_rd_a_i_2 : in std_logic_vector(8 downto 0);
  a_rd_d_o_2 : out std_logic_vector(31 downto 0);
  a_rd_en_i_2 : in std_logic ;

  b_wr_a_i_2 : in std_logic_vector(8 downto 0);
  b_wr_d_i_2 : in std_logic_vector(31 downto 0);
  b_wr_en_i_2 : in std_logic ;
  b_rd_d_o_2 : out std_logic_vector(31 downto 0);
  b_rd_en_i_2 : in std_logic ;

  a_rd_a_i_3 : in std_logic_vector(8 downto 0);
  a_rd_d_o_3 : out std_logic_vector(31 downto 0);
  a_rd_en_i_3 : in std_logic ;

  b_wr_a_i_3 : in std_logic_vector(8 downto 0);
  b_wr_d_i_3 : in std_logic_vector(31 downto 0);
  b_wr_en_i_3 : in std_logic ;
  b_rd_d_o_3 : out std_logic_vector(31 downto 0);
  b_rd_en_i_3 : in std_logic

);

end EP_MEM;

architecture rtl of EP_MEM is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

begin

------------------------------------------------------------------
--
--  4 x 512 DWs Buffer Banks (512 x 32 bits + 512 x 4 bits)
--
------------------------------------------------------------------

ep_io_mem_inst : RAMB16_S36_S36
generic map (
  SIM_COLLISION_CHECK => "NONE"
)
port map (

  CLKA =>  clk,
  SSRA  => '0',
  ADDRA =>  a_rd_a_i_0,
  DIA =>   X"00000000",
  DIPA =>  X"0",
  DOA =>   a_rd_d_o_0,
  DOPA =>  open,
  ENA =>   a_rd_en_i_0,
  WEA =>   '0',

  CLKB =>  clk,
  SSRB =>  '0',
  ADDRB => b_wr_a_i_0,
  DIB  =>  b_wr_d_i_0,
  DIPB =>  X"0",
  DOB  =>  b_rd_d_o_0,
  DOPB =>  open,
  ENB  =>  b_rd_en_i_0,
  WEB   => b_wr_en_i_0

);

ep_mem32_inst : RAMB16_S36_S36
generic map (
  SIM_COLLISION_CHECK => "NONE"
)
port map (

  CLKA =>  clk,
  SSRA =>  '0',
  ADDRA => a_rd_a_i_1,
  DIA  =>  X"00000000",
  DIPA =>  X"0",
  DOA  =>  a_rd_d_o_1,
  DOPA =>  open,
  ENA  =>  a_rd_en_i_1,
  WEA =>   '0',

  CLKB =>  clk,
  SSRB =>  '0',
  ADDRB => b_wr_a_i_1,
  DIB  =>  b_wr_d_i_1,
  DIPB =>  X"0",
  DOB  =>  b_rd_d_o_1,
  DOPB =>  open,
  ENB  =>  b_rd_en_i_1,
  WEB  =>  b_wr_en_i_1

);

ep_mem64_inst : RAMB16_S36_S36
generic map (
  SIM_COLLISION_CHECK => "NONE"
)
port map (

  CLKA =>  clk,
  SSRA =>  '0',
  ADDRA => a_rd_a_i_2,
  DIA  =>  X"00000000",
  DIPA =>  X"0",
  DOA =>   a_rd_d_o_2,
  DOPA =>  open,
  ENA =>   a_rd_en_i_2,
  WEA  =>  '0',

  CLKB =>  clk,
  SSRB =>  '0',
  ADDRB => b_wr_a_i_2,
  DIB =>   b_wr_d_i_2,
  DIPB =>  X"0",
  DOB  =>  b_rd_d_o_2,
  DOPB =>  open,
  ENB =>   b_rd_en_i_2,
  WEB =>   b_wr_en_i_2

);

ep_mem_erom_inst : RAMB16_S36_S36
generic map (
  SIM_COLLISION_CHECK => "NONE"
)
port map (

  CLKA  => clk,
  SSRA =>  '0',
  ADDRA => a_rd_a_i_3,
  DIA =>   X"00000000",
  DIPA =>  X"0",
  DOA  =>  a_rd_d_o_3,
  DOPA =>  open,
  ENA  =>  a_rd_en_i_3,
  WEA  =>  '0',

  CLKB =>  clk,
  SSRB =>  '0',
  ADDRB => b_wr_a_i_3,
  DIB => b_wr_d_i_3,
  DIPB =>  X"0",
  DOB  =>  b_rd_d_o_3,
  DOPB =>  open,
  ENB  =>  b_rd_en_i_3 ,
  WEB  =>  b_wr_en_i_3

);

end; -- EP_MEM

