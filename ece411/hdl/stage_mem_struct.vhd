-- VHDL Entity ece411.Stage_mem.interface
--
-- Created:
--          by - mcasano2.ews (gelib-057-26.ews.illinois.edu)
--          at - 03:33:29 04/11/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage_mem IS
   PORT( 
      CLK              : IN     STD_LOGIC;
      D_DATAIN         : IN     LC3B_WORD;
      RESET_L          : IN     STD_LOGIC;
      d_mresp_h        : IN     STD_LOGIC;
      mem_ALU_in       : IN     LC3B_WORD;
      mem_REGb_in      : IN     LC3B_WORD;
      mem_ZEXT8_in     : IN     LC3B_WORD;
      mem_controls_in  : IN     CONTROL_WORD;
      D_ADDRESS        : OUT    LC3B_WORD;
      D_DATAOUT        : OUT    LC3B_WORD;
      D_MREAD_L        : OUT    STD_LOGIC;
      D_MWRITEH_L      : OUT    STD_LOGIC;
      D_MWRITEL_L      : OUT    STD_LOGIC;
      mem_DATAIN_out   : OUT    LC3B_WORD;
      mem_RegWrite_out : OUT    STD_LOGIC;
      mem_mresp        : OUT    std_logic;
      state            : OUT    STD_LOGIC
   );

-- Declarations

END Stage_mem ;

--
-- VHDL Architecture ece411.Stage_mem.struct
--
-- Created:
--          by - mcasano2.ews (gelib-057-26.ews.illinois.edu)
--          at - 03:33:29 04/11/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Stage_mem IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CLK1      : STD_LOGIC;
   SIGNAL F         : LC3b_word;
   SIGNAL F1        : LC3b_word;
   SIGNAL LoadMAR   : std_logic;
   SIGNAL MARMUXSel : std_logic;
   SIGNAL STIMuxSel : STD_LOGIC;
   SIGNAL c_read    : STD_LOGIC;
   SIGNAL c_writeH  : STD_LOGIC;
   SIGNAL c_writeL  : STD_LOGIC;
   SIGNAL dout      : STD_LOGIC;
   SIGNAL dout1     : STD_LOGIC;
   SIGNAL dout2     : STD_LOGIC;
   SIGNAL imd       : std_logic;
   SIGNAL ldi       : STD_LOGIC;
   SIGNAL sti       : STD_LOGIC;

   -- Implicit buffer signal declarations
   SIGNAL mem_DATAIN_out_internal : LC3B_WORD;
   SIGNAL state_internal          : STD_LOGIC;


   -- Component Declarations
   COMPONENT DOut_conn
   PORT (
      mem_ALU_in : IN     LC3B_WORD;
      D_DATAOUT  : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT D_Latch
   PORT (
      Data_In  : IN     lc3b_word ;
      Enable   : IN     std_logic ;
      data_out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT Istate
   PORT (
      CLK       : IN     STD_LOGIC ;
      CLK1      : IN     STD_LOGIC ;
      RESET_L   : IN     STD_LOGIC ;
      d_mresp_h : IN     STD_LOGIC ;
      imd       : IN     std_logic ;
      state     : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      F : OUT    std_logic 
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
   COMPONENT mem_controlStrip
   PORT (
      CLK              : IN     std_logic;
      RESET_L          : IN     std_logic;
      mem_controls_in  : IN     CONTROL_WORD;
      D_MWRITEH_L      : OUT    STD_LOGIC;
      D_MWRITEL_L      : OUT    STD_LOGIC;
      LoadMAR          : OUT    std_logic;
      MARMUXSel        : OUT    std_logic;
      d_MREAD_L        : OUT    STD_LOGIC;
      ldi              : OUT    STD_LOGIC;
      mem_RegWrite_out : OUT    STD_LOGIC;
      sti              : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT mem_resp_gen
   PORT (
      CLK       : IN     STD_LOGIC ;
      d_mresp_h : IN     STD_LOGIC ;
      ldi       : IN     STD_LOGIC ;
      state     : IN     STD_LOGIC ;
      sti       : IN     STD_LOGIC ;
      mem_mresp : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : DOut_conn USE ENTITY ece411.DOut_conn;
   FOR ALL : D_Latch USE ENTITY ece411.D_Latch;
   FOR ALL : Istate USE ENTITY ece411.Istate;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : mem_controlStrip USE ENTITY ece411.mem_controlStrip;
   FOR ALL : mem_resp_gen USE ENTITY ece411.mem_resp_gen;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   CLK1 <= CLK after 40ns;


   -- ModuleWare code(v1.9) for instance 'U_8' of 'constval'
   dout <= '1';

   -- ModuleWare code(v1.9) for instance 'U_9' of 'constval'
   dout1 <= '0';

   -- ModuleWare code(v1.9) for instance 'U_10' of 'constval'
   dout2 <= '0';

   -- Instance port mappings.
   U_4 : DOut_conn
      PORT MAP (
         mem_ALU_in => mem_REGb_in,
         D_DATAOUT  => D_DATAOUT
      );
   MAR : D_Latch
      PORT MAP (
         Data_In  => F1,
         Enable   => LoadMAR,
         data_out => D_ADDRESS
      );
   U_12 : D_Latch
      PORT MAP (
         Data_In  => D_DATAIN,
         Enable   => d_mresp_h,
         data_out => mem_DATAIN_out_internal
      );
   U_1 : Istate
      PORT MAP (
         CLK       => CLK,
         CLK1      => CLK1,
         RESET_L   => RESET_L,
         d_mresp_h => d_mresp_h,
         imd       => imd,
         state     => state_internal
      );
   U_3 : OR2
      PORT MAP (
         A => ldi,
         B => sti,
         F => imd
      );
   U_0 : WordMux2
      PORT MAP (
         A   => mem_ALU_in,
         B   => mem_ZEXT8_in,
         Sel => MARMUXSel,
         F   => F
      );
   imdMux : WordMux2
      PORT MAP (
         A   => F,
         B   => mem_DATAIN_out_internal,
         Sel => state_internal,
         F   => F1
      );
   U_2 : mem_controlStrip
      PORT MAP (
         mem_controls_in  => mem_controls_in,
         RESET_L          => RESET_L,
         CLK              => CLK,
         MARMUXSel        => MARMUXSel,
         LoadMAR          => LoadMAR,
         D_MWRITEH_L      => c_writeH,
         D_MWRITEL_L      => c_writeL,
         d_MREAD_L        => c_read,
         ldi              => ldi,
         sti              => sti,
         mem_RegWrite_out => mem_RegWrite_out
      );
   U_13 : mem_resp_gen
      PORT MAP (
         CLK       => CLK,
         d_mresp_h => d_mresp_h,
         ldi       => ldi,
         state     => state_internal,
         sti       => sti,
         mem_mresp => mem_mresp
      );
   U_11 : AND2
      PORT MAP (
         A => state_internal,
         B => sti,
         F => STIMuxSel
      );
   U_5 : MUX2_1
      PORT MAP (
         A   => c_read,
         B   => dout,
         SEL => STIMuxSel,
         F   => D_MREAD_L
      );
   U_6 : MUX2_1
      PORT MAP (
         A   => c_writeL,
         B   => dout1,
         SEL => STIMuxSel,
         F   => D_MWRITEL_L
      );
   U_7 : MUX2_1
      PORT MAP (
         A   => c_writeH,
         B   => dout2,
         SEL => STIMuxSel,
         F   => D_MWRITEH_L
      );

   -- Implicit buffered output assignments
   mem_DATAIN_out <= mem_DATAIN_out_internal;
   state          <= state_internal;

END struct;
