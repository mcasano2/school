-- VHDL Entity ece411.Stage_id.interface
--
-- Created:
--          by - mcasano2.ews (gelib-057-26.ews.illinois.edu)
--          at - 02:04:46 04/11/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_id IS
   PORT( 
      CLK             : IN     STD_LOGIC;
      RESET_L         : IN     STD_LOGIC;
      id_IR_in        : IN     LC3B_WORD;
      id_PC_in        : IN     LC3B_WORD;
      wb_DR           : IN     LC3B_REG;
      wb_DRMUXSel_out : IN     std_logic;
      wb_RegIn        : IN     LC3B_WORD;
      wb_regWrite     : IN     std_logic;
      id_ADJ6_out     : OUT    LC3B_WORD;
      id_DR_out       : OUT    LC3B_REG;
      id_PCadj_out    : OUT    LC3B_WORD;
      id_REGaNum_out  : OUT    LC3B_REG;
      id_REGa_out     : OUT    LC3B_WORD;
      id_REGbNum_out  : OUT    LC3B_REG;
      id_REGb_out     : OUT    LC3B_WORD;
      id_SEXT5_out    : OUT    LC3B_WORD;
      id_SEXT6_out    : OUT    LC3B_WORD;
      id_ZEXT8_out    : OUT    LC3B_WORD;
      id_controls_out : OUT    CONTROL_WORD
   );

-- Declarations

END Stage_id ;

--
-- VHDL Architecture ece411.Stage_id.struct
--
-- Created:
--          by - mcasano2.ews (gelib-057-26.ews.illinois.edu)
--          at - 02:04:46 04/11/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Stage_id IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADJ9out     : LC3b_word;
   SIGNAL B           : std_logic;
   SIGNAL DR          : lc3b_reg;
   SIGNAL DRIn        : LC3b_reg;
   SIGNAL IDPCMUXSel  : std_logic;
   SIGNAL OpCode      : lc3b_opcode;
   SIGNAL PCADDMuxOUT : LC3b_word;
   SIGNAL PCAddMUXSel : std_logic;
   SIGNAL PCPlus      : LC3b_word;
   SIGNAL RESET_L1    : STD_LOGIC;
   SIGNAL SEXT11out   : LC3b_word;
   SIGNAL SR1_BR      : lc3b_reg;
   SIGNAL SR2         : lc3b_reg;
   SIGNAL SRAMUXSel   : std_logic;
   SIGNAL SRBMuxSel   : std_logic;
   SIGNAL WrIn        : std_logic;
   SIGNAL imm5        : lc3b_imm5;
   SIGNAL off11       : lc3b_offset11;
   SIGNAL off6        : lc3b_offset6;
   SIGNAL off9        : lc3b_offset9;
   SIGNAL r7_const    : LC3b_reg;
   SIGNAL trap8       : lc3b_trapvect8;

   -- Implicit buffer signal declarations
   SIGNAL id_REGaNum_out_internal  : LC3B_REG;
   SIGNAL id_REGa_out_internal     : LC3B_WORD;
   SIGNAL id_REGbNum_out_internal  : LC3B_REG;
   SIGNAL id_controls_out_internal : CONTROL_WORD;


   -- Component Declarations
   COMPONENT ADJ6
   PORT (
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ControlRom
   PORT (
      RESET_L         : IN     STD_LOGIC;
      id_IR_in        : IN     LC3B_WORD;
      id_controls_out : OUT    CONTROL_WORD
   );
   END COMPONENT;
   COMPONENT ID_ControlSplit
   PORT (
      id_controls_out : IN     CONTROL_WORD;
      DRMUXSel        : OUT    std_logic;
      IDPCMUXSel      : OUT    std_logic;
      PCAddMUXSel     : OUT    std_logic;
      SRAMUXSel       : OUT    std_logic;
      SRBMuxSel       : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT IR_SPlit
   PORT (
      id_IR_in : IN     LC3B_WORD;
      DR       : OUT    lc3b_reg;
      OpCode   : OUT    lc3b_opcode;
      SR1_BR   : OUT    lc3b_reg;
      SR2      : OUT    lc3b_reg;
      imm5     : OUT    lc3b_imm5;
      off11    : OUT    lc3b_offset11;
      off6     : OUT    lc3b_offset6;
      off9     : OUT    lc3b_offset9;
      trap8    : OUT    lc3b_trapvect8
   );
   END COMPONENT;
   COMPONENT PCAdder
   PORT (
      PCADDMuxOUT : IN     LC3b_word;
      id_PC_in    : IN     LC3B_WORD;
      PCPlus      : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT RegFile1
   PORT (
      CLK     : IN     STD_LOGIC;
      DR      : IN     lc3b_reg;
      Data    : IN     LC3b_word;
      RESET_l : IN     std_logic;
      SrcA    : IN     LC3b_reg;
      SrcB    : IN     LC3b_reg;
      Write   : IN     std_logic;
      RegAout : OUT    LC3b_word;
      RegBout : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT RegMux
   PORT (
      A   : IN     LC3b_reg;
      B   : IN     LC3b_reg;
      Sel : IN     std_logic;
      F   : OUT    LC3b_reg
   );
   END COMPONENT;
   COMPONENT RenameDR
   PORT (
      CLK       : IN     STD_LOGIC ;
      DR        : IN     lc3b_reg ;
      id_DR_out : OUT    LC3B_REG 
   );
   END COMPONENT;
   COMPONENT SEXT11
   PORT (
      offset11  : IN     LC3b_offset11;
      SEXT11out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      index6   : IN     LC3b_index6;
      SEXT6out : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT SIMM5
   PORT (
      imm5in  : IN     LC3b_imm5;
      IMM5out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WrDelay
   PORT (
      CLK         : IN     STD_LOGIC ;
      wb_regWrite : IN     std_logic ;
      B           : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ZEXTADJ
   PORT (
      TRAPVect8 : IN     LC3b_TRAPVECT8;
      TRAPout   : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT resetDel
   PORT (
      CLK      : IN     STD_LOGIC ;
      RESET_L  : IN     STD_LOGIC ;
      RESET_L1 : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : ControlRom USE ENTITY ece411.ControlRom;
   FOR ALL : ID_ControlSplit USE ENTITY ece411.ID_ControlSplit;
   FOR ALL : IR_SPlit USE ENTITY ece411.IR_SPlit;
   FOR ALL : PCAdder USE ENTITY ece411.PCAdder;
   FOR ALL : RegFile1 USE ENTITY ece411.RegFile1;
   FOR ALL : RegMux USE ENTITY ece411.RegMux;
   FOR ALL : RenameDR USE ENTITY ece411.RenameDR;
   FOR ALL : SEXT11 USE ENTITY ece411.SEXT11;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : SIMM5 USE ENTITY ece411.SIMM5;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WrDelay USE ENTITY ece411.WrDelay;
   FOR ALL : ZEXTADJ USE ENTITY ece411.ZEXTADJ;
   FOR ALL : resetDel USE ENTITY ece411.resetDel;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   r7_const <= "111";      


   -- Instance port mappings.
   U_8 : ADJ6
      PORT MAP (
         index6  => off6,
         ADJ6out => id_ADJ6_out
      );
   U_2 : ADJ9
      PORT MAP (
         offset9 => off9,
         ADJ9out => ADJ9out
      );
   U_3 : AND2
      PORT MAP (
         A => CLK,
         B => B,
         F => WrIn
      );
   aControlRom : ControlRom
      PORT MAP (
         id_controls_out => id_controls_out_internal,
         RESET_L         => RESET_L1,
         id_IR_in        => id_IR_in
      );
   U_4 : ID_ControlSplit
      PORT MAP (
         id_controls_out => id_controls_out_internal,
         PCAddMUXSel     => PCAddMUXSel,
         IDPCMUXSel      => IDPCMUXSel,
         DRMUXSel        => OPEN,
         SRAMUXSel       => SRAMUXSel,
         SRBMuxSel       => SRBMuxSel
      );
   U_0 : IR_SPlit
      PORT MAP (
         id_IR_in => id_IR_in,
         DR       => DR,
         OpCode   => OpCode,
         SR1_BR   => SR1_BR,
         SR2      => SR2,
         imm5     => imm5,
         off11    => off11,
         off6     => off6,
         off9     => off9,
         trap8    => trap8
      );
   U_1 : PCAdder
      PORT MAP (
         PCADDMuxOUT => PCADDMuxOUT,
         id_PC_in    => id_PC_in,
         PCPlus      => PCPlus
      );
   aRegFile : RegFile1
      PORT MAP (
         RESET_l => RESET_L,
         Data    => wb_RegIn,
         Write   => WrIn,
         SrcB    => id_REGbNum_out_internal,
         SrcA    => id_REGaNum_out_internal,
         CLK     => CLK,
         DR      => DRIn,
         RegAout => id_REGa_out_internal,
         RegBout => id_REGb_out
      );
   SrcBMux : RegMux
      PORT MAP (
         A   => SR2,
         Sel => SRBMuxSel,
         B   => DR,
         F   => id_REGbNum_out_internal
      );
   U_5 : RegMux
      PORT MAP (
         A   => wb_DR,
         Sel => wb_DRMUXSel_out,
         B   => r7_const,
         F   => DRIn
      );
   aStoreMux : RegMux
      PORT MAP (
         A   => SR1_BR,
         Sel => SRAMUXSel,
         B   => DR,
         F   => id_REGaNum_out_internal
      );
   U_14 : RenameDR
      PORT MAP (
         CLK       => CLK,
         DR        => DR,
         id_DR_out => id_DR_out
      );
   aSEXT11 : SEXT11
      PORT MAP (
         offset11  => off11,
         SEXT11out => SEXT11out
      );
   U_10 : SEXT6
      PORT MAP (
         index6   => off6,
         SEXT6out => id_SEXT6_out
      );
   U_9 : SIMM5
      PORT MAP (
         imm5in  => imm5,
         IMM5out => id_SEXT5_out
      );
   IDPCMUX : WordMux2
      PORT MAP (
         A   => PCPlus,
         B   => id_REGa_out_internal,
         Sel => IDPCMUXSel,
         F   => id_PCadj_out
      );
   PCADDMUX : WordMux2
      PORT MAP (
         A   => ADJ9out,
         B   => SEXT11out,
         Sel => PCAddMUXSel,
         F   => PCADDMuxOUT
      );
   U_13 : WrDelay
      PORT MAP (
         CLK         => CLK,
         wb_regWrite => wb_regWrite,
         B           => B
      );
   U_11 : ZEXTADJ
      PORT MAP (
         TRAPVect8 => trap8,
         TRAPout   => id_ZEXT8_out
      );
   U_12 : resetDel
      PORT MAP (
         CLK      => CLK,
         RESET_L  => RESET_L,
         RESET_L1 => RESET_L1
      );

   -- Implicit buffered output assignments
   id_REGaNum_out  <= id_REGaNum_out_internal;
   id_REGa_out     <= id_REGa_out_internal;
   id_REGbNum_out  <= id_REGbNum_out_internal;
   id_controls_out <= id_controls_out_internal;

END struct;
