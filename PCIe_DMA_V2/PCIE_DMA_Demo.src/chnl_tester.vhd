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


ENTITY chnl_tester IS
GENERIC (
	G_DATA_WIDTH    : INTEGER := 32
);
PORT (
	CLK                 : IN STD_LOGIC;
	RST                 : IN STD_LOGIC;
	CHNL_RX_CLK         : OUT STD_LOGIC;
	CHNL_RX             : IN STD_LOGIC;
	CHNL_RX_ACK         : OUT STD_LOGIC;
	CHNL_RX_LAST        : IN STD_LOGIC;
	CHNL_RX_LEN         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	CHNL_RX_OFF         : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
	CHNL_RX_DATA        : IN STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
	CHNL_RX_DATA_VALID  : IN STD_LOGIC;
	CHNL_RX_DATA_REN    : OUT STD_LOGIC;
	CHNL_TX_CLK         : OUT STD_LOGIC;
	CHNL_TX             : OUT STD_LOGIC;
	CHNL_TX_ACK         : IN STD_LOGIC;
	CHNL_TX_LAST        : OUT STD_LOGIC;
	CHNL_TX_LEN         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	CHNL_TX_OFF         : OUT STD_LOGIC_VECTOR(30 DOWNTO 0);
	CHNL_TX_DATA        : OUT STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
	CHNL_TX_DATA_VALID  : OUT STD_LOGIC;
	CHNL_TX_DATA_REN    : IN STD_LOGIC
);
END chnl_tester;

ARCHITECTURE trans OF chnl_tester IS

	SIGNAL rData		: STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0) := (others=>'0');
	SIGNAL rLen			: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others=>'0');
	SIGNAL rCount		: STD_LOGIC_VECTOR(31 DOWNTO 0) := (others=>'0');
	SIGNAL rCount_ext	: STD_LOGIC_VECTOR(127 DOWNTO 0) := (others=>'0');
	SIGNAL rState		: STD_LOGIC_VECTOR(1 DOWNTO 0) := (others=>'0');
	signal CHNL_TX_DATA_VALID_int	: std_logic;
   
BEGIN

	CHNL_TX_DATA_VALID <= CHNL_TX_DATA_VALID_int;

	CHNL_RX_CLK <= CLK;
	CHNL_RX_ACK <= '1' when rState = "01" else '0';
	CHNL_RX_DATA_REN <= '1' when rState = "01" else '0';

	CHNL_TX_CLK <= CLK;
	CHNL_TX <= '1' when rState = "11" else '0';
	CHNL_TX_LAST <= '1';
	CHNL_TX_LEN <= rLen;
	CHNL_TX_OFF <= (others=>'0');
	CHNL_TX_DATA <= rData;
	CHNL_TX_DATA_VALID_int <= '1' when rState = "11" else '0';
   
	PROCESS (CLK, RST)
	BEGIN
	IF (RST = '1') THEN
		rLen <= (others=>'0');
		rCount <= (others=>'0');
		rState <= (others=>'0');
		rData <= (others=>'0');
	ELSIF (CLK'EVENT AND CLK = '1') THEN
		CASE rState IS            
			WHEN "00" => -- Wait for start of RX, save length
				IF (CHNL_RX = '1') THEN
					rLen <= CHNL_RX_LEN;
					rCount <= (others=>'0');
					rState <= "01";
				END IF;
            
			WHEN "01" => -- Wait for last data in RX, save value
				IF (CHNL_RX_DATA_VALID = '1') THEN
					rData <= CHNL_RX_DATA;
					rCount <= rCount + std_logic_vector( to_unsigned(G_DATA_WIDTH/32, 4) );
				END IF;
				IF (rCount >= rLen) THEN
					rState <= "10";
				END IF;

			WHEN "10" => -- Prepare for TX
				rCount <= std_logic_vector( to_unsigned(G_DATA_WIDTH/32, 32) );
				rState <= "11";

			WHEN "11" => -- Start TX with save length and data value
				IF (CHNL_TX_DATA_REN = '1' AND CHNL_TX_DATA_VALID_int = '1') THEN
					rData <= rCount_ext(rData'HIGH downto 0);
					rCount <= rCount + std_logic_vector( to_unsigned(G_DATA_WIDTH/32, 4) );
					IF (rCount >= rLen) THEN
						rState <= "00";
					END IF;
				END IF;
			when others => 
				rState <= "00";
		END CASE;
	END IF;
	END PROCESS;
	rCount_ext <= (rCount + "100") & (rCount + "11") & (rCount + "10") & (rCount + "1");
   
   
END trans;




