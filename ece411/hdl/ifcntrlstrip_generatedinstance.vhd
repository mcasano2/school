-- VHDL Entity ece411.IFCntrlStrip.generatedInstance
--
-- Created:
--          by - baker30.ews (gelib-057-15.ews.illinois.edu)
--          at - 03:11:58 03/13/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IFCntrlStrip IS
   PORT( 
      CLK            : IN     STD_LOGIC;
      ex_controls_in : IN     CONTROL_WORD;
      Sel            : OUT    lc3b_4mux_sel
   );

END IFCntrlStrip ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF IFCntrlStrip IS 
BEGIN


END generatedInstance;
