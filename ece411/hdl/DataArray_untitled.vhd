--
-- VHDL Architecture ece411.DataArray.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-21.ews.illinois.edu)
--          at - 02:31:27 02/14/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      Reset_L   : IN     std_logic;
      DataWrite : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      DataIn    : IN     LC3B_OWORD;
      DataOut   : OUT    LC3B_OWORD
   );
-- Declarations
END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS
	TYPE DataArray IS array (7 downto 0) of LC3B_OWORD;
	SIGNAL Data : DataArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromDataArray : PROCESS (Data, Index)
		--------------------------------------------------------------
    
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
				DataOut <= Data(DataIndex) after 20 ns;
		
		END PROCESS ReadFromDataArray;
	
		--------------------------------------------------------------
		WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn)
		-------------------------------------------------------	------	
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Data(0) <= (OTHERS => 'X');
				Data(1) <= (OTHERS => 'X');
				Data(2) <= (OTHERS => 'X');
				Data(3) <= (OTHERS => 'X');
				Data(4) <= (OTHERS => 'X');
				Data(5) <= (OTHERS => 'X');
				Data(6) <= (OTHERS => 'X');
				Data(7) <= (OTHERS => 'X');
			END IF;

			IF (DataWrite = '1') THEN
				Data(DataIndex) <= DataIn;
			END IF;
		
		END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;
