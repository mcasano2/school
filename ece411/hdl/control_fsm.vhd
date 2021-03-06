-- VHDL Entity ece411.Control.interface
--
-- Created:
--          by - baker30.ews (linux5.ews.illinois.edu)
--          at - 23:15:43 02/21/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Control IS
   PORT( 
      CheckN     : IN     std_logic;
      CheckP     : IN     std_logic;
      CheckZ     : IN     std_logic;
      IRout      : IN     LC3b_word;
      MRESP_H    : IN     std_logic;
      Opcode     : IN     LC3b_opcode;
      RESET_l    : IN     std_logic;
      START_H    : IN     std_logic;
      clk        : IN     std_logic;
      n          : IN     std_logic;
      p          : IN     std_logic;
      z          : IN     std_logic;
      ALUMuxSel  : OUT    lc3b_4mux_sel;
      ALUop      : OUT    LC3b_aluop;
      DESMuxSel  : OUT    std_logic;
      LoadIR     : OUT    std_logic;
      LoadMAR    : OUT    std_logic;
      LoadMDR    : OUT    std_logic;
      LoadNZP    : OUT    std_logic;
      LoadPC     : OUT    std_logic;
      MARMuxSel  : OUT    lc3b_4mux_sel;
      MDRMuxSel  : OUT    std_logic;
      MREAD_L    : OUT    std_logic;
      MWRITEH_L  : OUT    std_logic;
      MWRITEL_L  : OUT    std_logic;
      PCAddrSel  : OUT    std_logic;
      PCMuxSel   : OUT    lc3b_4mux_sel;
      RFMuxSel   : OUT    lc3b_4mux_sel;
      RegWrite   : OUT    std_logic;
      StoreSR    : OUT    std_logic;
      ZEXTMuxSel : OUT    std_logic
   );

-- Declarations

END Control ;

--
-- VHDL Architecture ece411.Control.fsm
--
-- Created:
--          by - baker30.ews (linux5.ews.illinois.edu)
--          at - 23:15:43 02/21/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Control IS

   TYPE STATE_TYPE IS (
      Reset,
      Decode,
      L_NOT,
      BR2,
      BR1,
      ADD,
      L_AND,
      IF1,
      IF2,
      IF3,
      CalcADDR,
      ST1,
      LD1,
      ST2,
      LD2,
      JMP,
      LEA,
      JSR,
      JSR2,
      CalcADDR2,
      LDB1,
      STB1,
      STB2,
      LDB2,
      LDI1,
      LDI2,
      STI1,
      STI2,
      TRAP,
      TRAP2,
      TRAP3,
      TRAP4,
      SHFS,
      LSHF,
      RSHFL,
      RSHFA
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= Reset;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      CheckN,
      CheckP,
      CheckZ,
      IRout,
      MRESP_H,
      Opcode,
      START_H,
      current_state,
      n,
      p,
      z
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN Reset => 
            IF (START_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= Reset;
            END IF;
         WHEN Decode => 
            IF (Opcode = op_br) THEN 
               next_state <= BR1;
            ELSIF ((Opcode = op_ldr) OR
                   (Opcode = op_str) OR
                   (Opcode = op_ldi) OR
                   (Opcode = op_sti)) THEN 
               next_state <= CalcADDR;
            ELSIF (Opcode = op_not) THEN 
               next_state <= L_NOT;
            ELSIF (Opcode = op_and) THEN 
               next_state <= L_AND;
            ELSIF (Opcode = op_add) THEN 
               next_state <= ADD;
            ELSIF (Opcode = op_jmp) THEN 
               next_state <= JMP;
            ELSIF (Opcode = op_lea) THEN 
               next_state <= LEA;
            ELSIF (Opcode = op_jsr) THEN 
               next_state <= JSR;
            ELSIF ((Opcode = op_ldb) OR (Opcode = op_stb)) THEN 
               next_state <= CalcADDR2;
            ELSIF (Opcode = op_trap) THEN 
               next_state <= TRAP;
            ELSIF (Opcode = op_shf) THEN 
               next_state <= SHFS;
            ELSE
               next_state <= IF1;
            END IF;
         WHEN L_NOT => 
            next_state <= IF1;
         WHEN BR2 => 
            next_state <= IF1;
         WHEN BR1 => 
            IF (( ( n AND CheckN ) OR
                ( p AND CheckP ) OR
                ( z AND CheckZ ) ) = '1') THEN 
               next_state <= BR2;
            ELSE
               next_state <= IF1;
            END IF;
         WHEN ADD => 
            next_state <= IF1;
         WHEN L_AND => 
            next_state <= IF1;
         WHEN IF1 => 
            next_state <= IF2;
         WHEN IF2 => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF3;
            ELSE
               next_state <= IF2;
            END IF;
         WHEN IF3 => 
            next_state <= Decode;
         WHEN CalcADDR => 
            IF (Opcode = op_str) THEN 
               next_state <= ST1;
            ELSIF (Opcode = op_ldr) THEN 
               next_state <= LD1;
            ELSIF (Opcode = op_ldi) THEN 
               next_state <= LDI1;
            ELSIF (Opcode = op_sti) THEN 
               next_state <= STI1;
            ELSE
               next_state <= CalcADDR;
            END IF;
         WHEN ST1 => 
            next_state <= ST2;
         WHEN LD1 => 
            IF (MRESP_H = '1') THEN 
               next_state <= LD2;
            ELSE
               next_state <= LD1;
            END IF;
         WHEN ST2 => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= ST2;
            END IF;
         WHEN LD2 => 
            next_state <= IF1;
         WHEN JMP => 
            next_state <= IF1;
         WHEN LEA => 
            next_state <= IF1;
         WHEN JSR => 
            IF (IRout(11) = '1') THEN 
               next_state <= JSR2;
            ELSE
               next_state <= JMP;
            END IF;
         WHEN JSR2 => 
            next_state <= IF1;
         WHEN CalcADDR2 => 
            IF (Opcode = op_ldb) THEN 
               next_state <= LDB1;
            ELSIF (Opcode = op_stb) THEN 
               next_state <= STB1;
            ELSE
               next_state <= CalcADDR2;
            END IF;
         WHEN LDB1 => 
            IF (MRESP_H = '1') THEN 
               next_state <= LDB2;
            ELSE
               next_state <= LDB1;
            END IF;
         WHEN STB1 => 
            next_state <= STB2;
         WHEN STB2 => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= STB2;
            END IF;
         WHEN LDB2 => 
            next_state <= IF1;
         WHEN LDI1 => 
            IF (MRESP_H = '1') THEN 
               next_state <= LDI2;
            ELSE
               next_state <= LDI1;
            END IF;
         WHEN LDI2 => 
            next_state <= LD1;
         WHEN STI1 => 
            IF (MRESP_H='1') THEN 
               next_state <= STI2;
            ELSE
               next_state <= STI1;
            END IF;
         WHEN STI2 => 
            next_state <= ST1;
         WHEN TRAP => 
            next_state <= TRAP2;
         WHEN TRAP2 => 
            next_state <= TRAP3;
         WHEN TRAP3 => 
            IF (MRESP_H='1') THEN 
               next_state <= TRAP4;
            ELSE
               next_state <= TRAP3;
            END IF;
         WHEN TRAP4 => 
            next_state <= IF1;
         WHEN SHFS => 
            IF (IRout(4) = '0') THEN 
               next_state <= LSHF;
            ELSIF (IRout(5) = '0') THEN 
               next_state <= RSHFL;
            ELSE
               next_state <= RSHFA;
            END IF;
         WHEN LSHF => 
            next_state <= IF1;
         WHEN RSHFL => 
            next_state <= IF1;
         WHEN RSHFA => 
            next_state <= IF1;
         WHEN OTHERS =>
            next_state <= Reset;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      IRout,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ALUMuxSel <= "00";
      ALUop <= "000";
      DESMuxSel <= '0';
      LoadIR <= '0';
      LoadMAR <= '0';
      LoadMDR <= '0';
      LoadNZP <= '0';
      LoadPC <= '0';
      MARMuxSel <= "00";
      MDRMuxSel <= '0';
      MREAD_L <= '1';
      MWRITEH_L <= '1';
      MWRITEL_L <= '1';
      PCAddrSel <= '0';
      PCMuxSel <= "00";
      RFMuxSel <= "00";
      RegWrite <= '0';
      StoreSR <= '1';
      ZEXTMuxSel <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN L_NOT => 
            ALUop <= alu_not;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
         WHEN BR2 => 
            PCMuxSel <= "01";
            LoadPC <= '1';
         WHEN ADD => 
            ALUop <= alu_add;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= IRout(5) & '0';
         WHEN L_AND => 
            ALUop <= alu_and;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= IRout(5) & '0';
         WHEN IF1 => 
            LoadMAR <= '1';
            LoadPC <= '1';
         WHEN IF2 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6 ns;
         WHEN IF3 => 
            LoadIR <= '1';
         WHEN CalcADDR => 
            ALUMuxSel <= "01";
            ALUop <= alu_add;
            MARMuxSel <= "01";
            LoadMAR <= '1';
         WHEN ST1 => 
            StoreSr <= '0';
            ALUop <= alu_pass;
            LoadMDR <= '1';
            MDRMuxSel <= '1';
         WHEN LD1 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN ST2 => 
            MWRITEL_L <= '0' after 6ns;
            MWRITEH_L <= '0' after 6ns;
         WHEN LD2 => 
            RegWrite <= '1';
            LoadNZP <= '1';
         WHEN JMP => 
            ALUop <= alu_pass;
            PCMuxSel <= "10";
            LoadPC <= '1';
         WHEN LEA => 
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "10";
         WHEN JSR => 
            DESMuxSel <= '1' ;
            RegWrite <= '1' ;
            RFMuxSel <= "11";
         WHEN JSR2 => 
            PCMuxSel <= "01";
            PCAddrSel <= '1';
            LoadPC <= '1';
         WHEN CalcADDR2 => 
            ALUMuxSel <= "11";
            ALUop <= alu_add;
            MARMuxSel <= "01";
            LoadMAR <= '1';
         WHEN LDB1 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN STB1 => 
            StoreSr <= '0';
            ALUop <= alu_pass;
            LoadMDR <= '1';
            MDRMuxSel <= '1';
         WHEN STB2 => 
            MWRITEL_L <= '0' after 6ns;
         WHEN LDB2 => 
            ZEXTMuxSel <= '1';
            RegWrite <= '1' ;
            LoadNZP <= '1' ;
         WHEN LDI1 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN LDI2 => 
            MARMuxSel <= "10";
            LoadMAR <= '1';
         WHEN STI1 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN STI2 => 
            MARMuxSel <= "10";
            LoadMAR <= '1';
         WHEN TRAP => 
            DESMuxSel <= '1' ;
            RegWrite <= '1' ;
            RFMuxSel <= "11";
         WHEN TRAP2 => 
            MARMuxSel <= "11" ;
            LoadMAR <= '1';
         WHEN TRAP3 => 
            LoadMDR <= '1' ;
            MREAD_L <= '0'  after 6ns;
         WHEN TRAP4 => 
            PCMuxSel <= "11" ;
            LoadPC <= '1' ;
         WHEN LSHF => 
            ALUop <= alu_sll;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= "10";
         WHEN RSHFL => 
            ALUop <= alu_srl;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= "10";
         WHEN RSHFA => 
            ALUop <= alu_sra;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= "10";
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
