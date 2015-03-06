--
-- VHDL Architecture ece411.ZEXTADJ.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-11.ews.illinois.edu)
--          at - 22:57:44 02/05/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXTADJ IS
   PORT( 
      TRAPVect8 : IN     LC3b_TRAPVECT8;
      TRAPout   : OUT    lc3b_word
   );

-- Declarations

END ZEXTADJ ;

--
ARCHITECTURE untitled OF ZEXTADJ IS
BEGIN
  TRAPout <= "0000000" & TrapVect8( 7 DOWNTO 0) & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

