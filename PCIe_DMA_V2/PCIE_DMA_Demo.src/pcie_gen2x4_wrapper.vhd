------------------------------------------------------------------------------
--      _______      _______                                                --
--     / ____\ \    / /_   _|                                               --
--    | |  __ \ \  / /  | |                                                 --
--    | | |_ | \ \/ /   | |                                                 --
--    | |__| |  \  /   _| |_                                                --
--     \_____|   \/   |_____|                                               --
--                                                                          --
-- Copyright (c) 2012-2015 GVI.  All rights reserved.                       --
--                                                                          --
-- THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY   --
-- KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE      --
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A               --
-- PARTICULAR PURPOSE.                                                      --
--                                                                          --
-- Website: http://www.gvi-tech.com/                                        --
-- Email: support@gvi-tech.com                                              --
--                                                                          --
------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


ENTITY gvi_pcie_gen2x4_wrapper IS
GENERIC(
	G_PL_FAST_TRAIN		: string := "FALSE";
	G_PCIE_EXT_CLK		: string := "TRUE";
	G_NUM_CHNL			: integer range 1 to 12 := 1;
	G_DATA_WIDTH		: integer := 64
);
PORT (
	pci_exp_txp			: out std_logic_vector(3 downto 0);
	pci_exp_txn			: out std_logic_vector(3 downto 0);
	pci_exp_rxp			: in  std_logic_vector(3 downto 0);
	pci_exp_rxn			: in  std_logic_vector(3 downto 0);	
	
	sys_clk_p			: in  std_logic;
	sys_clk_n			: in  std_logic;
	sys_rst_n			: in  std_logic;
	
	link_up				: out std_logic;
	chnl_reset			: out std_logic;
	chnl_user_clk		: out std_logic;
	
	chnl_rx_clk			: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_rx				: out std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_rx_ack			: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_rx_last		: out std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_rx_len			: out std_logic_vector((G_NUM_CHNL*32)-1 downto 0);
	chnl_rx_off			: out std_logic_vector((G_NUM_CHNL*31)-1 downto 0);
	chnl_rx_data		: out std_logic_vector((G_NUM_CHNL*G_DATA_WIDTH)-1 downto 0);
	chnl_rx_data_valid	: out std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_rx_data_ren	: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	
	chnl_tx_clk			: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_tx				: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_tx_ack			: out std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_tx_last		: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_tx_len			: in  std_logic_vector((G_NUM_CHNL*32)-1 downto 0);
	chnl_tx_off			: in  std_logic_vector((G_NUM_CHNL*31)-1 downto 0);
	chnl_tx_data		: in  std_logic_vector((G_NUM_CHNL*G_DATA_WIDTH)-1 downto 0);
	chnl_tx_data_valid	: in  std_logic_vector(G_NUM_CHNL-1 downto 0);
	chnl_tx_data_ren	: out std_logic_vector(G_NUM_CHNL-1 downto 0)
);
END gvi_pcie_gen2x4_wrapper;

ARCHITECTURE trans OF gvi_pcie_gen2x4_wrapper IS

	constant C_KEEP_WIDTH		: integer := G_DATA_WIDTH / 8;
	
	Component riffa_top_pcie_7x_v2_1
	Generic(
		PL_FAST_TRAIN		: string := "FALSE";
		PCIE_EXT_CLK		: string := "TRUE";
		C_NUM_CHNL			: std_logic_vector(3 downto 0) := X"1";
		C_DATA_WIDTH		: integer := 64;
		KEEP_WIDTH			: integer := 8
	);
	Port(
		pci_exp_txp			: out std_logic_vector(3 downto 0);
		pci_exp_txn			: out std_logic_vector(3 downto 0);
		pci_exp_rxp			: in  std_logic_vector(3 downto 0);
		pci_exp_rxn			: in  std_logic_vector(3 downto 0);
		
		link_up				: out std_logic;
		
		sys_clk_p			: in  std_logic;
		sys_clk_n			: in  std_logic;
		sys_rst_n			: in  std_logic;
		
		chnl_reset			: out std_logic;
		chnl_user_clk		: out std_logic;
		
		chnl_rx_clk			: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_rx				: out std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_rx_ack			: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_rx_last		: out std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_rx_len			: out std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*32)-1 downto 0);
		chnl_rx_off			: out std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*31)-1 downto 0);
		chnl_rx_data		: out std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*C_DATA_WIDTH)-1 downto 0);
		chnl_rx_data_valid	: out std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_rx_data_ren	: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		
		chnl_tx_clk			: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_tx				: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_tx_ack			: out std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_tx_last		: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_tx_len			: in  std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*32)-1 downto 0);
		chnl_tx_off			: in  std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*31)-1 downto 0);
		chnl_tx_data		: in  std_logic_vector((to_integer(unsigned(C_NUM_CHNL))*C_DATA_WIDTH)-1 downto 0);
		chnl_tx_data_valid	: in  std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0);
		chnl_tx_data_ren	: out std_logic_vector(to_integer(unsigned(C_NUM_CHNL))-1 downto 0)
	);
	END Component;

BEGIN

	pcie_wrapper : riffa_top_pcie_7x_v2_1
	Generic Map(
		PL_FAST_TRAIN		=> G_PL_FAST_TRAIN,
		PCIE_EXT_CLK		=> G_PCIE_EXT_CLK,
		C_NUM_CHNL			=> std_logic_vector( to_unsigned(G_NUM_CHNL, 4) ),
		C_DATA_WIDTH		=> G_DATA_WIDTH,
		KEEP_WIDTH			=> C_KEEP_WIDTH
	)
	Port Map(
		pci_exp_txp			=> pci_exp_txp,
		pci_exp_txn			=> pci_exp_txn,
		pci_exp_rxp			=> pci_exp_rxp,
		pci_exp_rxn			=> pci_exp_rxn,
		
		link_up				=> link_up,
		
		sys_clk_p			=> sys_clk_p,
		sys_clk_n			=> sys_clk_n,
		sys_rst_n			=> sys_rst_n,
				
		chnl_reset			=> chnl_reset,
		chnl_user_clk		=> chnl_user_clk,
		
		chnl_rx_clk			=> chnl_rx_clk,
		chnl_rx				=> chnl_rx,
		chnl_rx_ack			=> chnl_rx_ack,
		chnl_rx_last		=> chnl_rx_last,
		chnl_rx_len			=> chnl_rx_len,
		chnl_rx_off			=> chnl_rx_off,
		chnl_rx_data		=> chnl_rx_data,
		chnl_rx_data_valid	=> chnl_rx_data_valid,
		chnl_rx_data_ren	=> chnl_rx_data_ren,
		
		chnl_tx_clk			=> chnl_tx_clk,
		chnl_tx				=> chnl_tx,
		chnl_tx_ack			=> chnl_tx_ack,
		chnl_tx_last		=> chnl_tx_last,
		chnl_tx_len			=> chnl_tx_len,
		chnl_tx_off			=> chnl_tx_off,
		chnl_tx_data		=> chnl_tx_data,
		chnl_tx_data_valid	=> chnl_tx_data_valid,
		chnl_tx_data_ren	=> chnl_tx_data_ren
	);
   
END trans;






