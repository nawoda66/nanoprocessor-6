
----------------------------------------------------------------------------------
-- Company:UNIVERSITY OF MORATUWA /CSE
-- Engineer: D.R.K.W.M.V.V.DEWDUNIKA
-- 
-- Create Date: 05/09/2025 06:21:57 PM
-- Design Name: 
-- Module Name: Top_Module - Behavioral
-- Project Name:nanoprocessor design competition 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Module is
   Port ( clk : in STD_LOGIC;
          reset:in STD_LOGIC;
          overflow_final : out STD_LOGIC;
           zero_final: out STD_LOGIC;
           output  : out STD_LOGIC_VECTOR(7 downto 0);
           Reg7_7seg:out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0):= "1110"
               
   );
end Top_Module;

architecture Behavioral of Top_Module is


component Counter
    Port (D : in STD_LOGIC_VECTOR (2 downto 0);
       clk : in STD_LOGIC;
       reset : in STD_LOGIC; 
       memory_select : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Adder_3bit
    Port ( A        : in STD_LOGIC_VECTOR (2 downto 0);
       SUM      : out STD_LOGIC_VECTOR (2 downto 0);
       C_OUT    : out STD_LOGIC);
end component;

component MUX_2way_3bit
    Port ( A0  : in STD_LOGIC_VECTOR(2 downto 0);
       A1  : in STD_LOGIC_VECTOR(2 downto 0);
       Sel : in STD_LOGIC;
       Q   : out STD_LOGIC_VECTOR(2 downto 0) );
end component;

component  Instruction_memory
    Port ( clk :in STD_LOGIC;
        reset : in STD_LOGIC;
       address : in STD_LOGIC_VECTOR (2 downto 0);
       instruction : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Instruction_Decoder
    Port ( Instruction_bus : in STD_LOGIC_VECTOR (15 downto 0);
          Check : in STD_LOGIC_VECTOR (7 downto 0);
       clk_in:in STD_LOGIC;
       reset:in STD_LOGIC;
       add_sub_select:out STD_LOGIC;
       add_enable : out STD_LOGIC;
       mov_enable : out STD_LOGIC;
       neg_enable : out STD_LOGIC;
       jzr_enable : out STD_LOGIC;
       register_enable:out STD_LOGIC_VECTOR(2 downto 0);
       load_select:out STD_LOGIC ;
       jzr_flag:out STD_LOGIC ;
       jzr_address:out STD_LOGIC_VECTOR (2 downto 0);
      
       register1 : out STD_LOGIC_VECTOR (2 downto 0);
       register2 : out STD_LOGIC_VECTOR (2 downto 0);
       value : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Register_Memory
    Port ( Write_Data : in STD_LOGIC_VECTOR (7 downto 0);
       reset:in STD_LOGIC;
       Register_Enable : in STD_LOGIC_VECTOR (2 downto 0);
       clk : in STD_LOGIC;


       out0 :  out STD_LOGIC_VECTOR (7 downto 0);
       out1 :  out STD_LOGIC_VECTOR (7 downto 0);
       out2 :  out STD_LOGIC_VECTOR (7 downto 0);
       out3 :  out STD_LOGIC_VECTOR (7 downto 0);
       out4 :  out STD_LOGIC_VECTOR (7 downto 0);
       out5 :  out STD_LOGIC_VECTOR (7 downto 0);
       out6 :  out STD_LOGIC_VECTOR (7 downto 0);
       out7 :  out STD_LOGIC_VECTOR (7 downto 0));

end component;

component MUX_8way_4bit
    Port ( A0  : in STD_LOGIC_VECTOR(7 downto 0);
       A1  : in STD_LOGIC_VECTOR(7 downto 0);
       A2  : in STD_LOGIC_VECTOR(7 downto 0);
       A3  : in STD_LOGIC_VECTOR(7 downto 0);
       A4  : in STD_LOGIC_VECTOR(7 downto 0);
       A5  : in STD_LOGIC_VECTOR(7 downto 0);
       A6  : in STD_LOGIC_VECTOR(7 downto 0);
       A7  : in STD_LOGIC_VECTOR(7 downto 0);
       Sel : in STD_LOGIC_VECTOR(2 downto 0);
       Q   : out STD_LOGIC_VECTOR(7 downto 0) );
end component;

component Add_Sub_4bit_unit
    Port ( A        : in STD_LOGIC_VECTOR (7 downto 0);
       B        : in STD_LOGIC_VECTOR (7 downto 0);
       Sel      : in STD_LOGIC;
       Alu_sum     : out STD_LOGIC_VECTOR (7 downto 0);
       overflow : out STD_LOGIC;
       ZERO     : out STD_LOGIC );
end component;

component MUX_2way_4bit
    Port ( A0  : in STD_LOGIC_VECTOR(7 downto 0);
       A1  : in STD_LOGIC_VECTOR(7 downto 0);
       Sel : in STD_LOGIC;
       Q   : out STD_LOGIC_VECTOR(7 downto 0) );
end component;

component LUT_7Seg
    port(Address : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           Data    : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;



signal  memory_select:STD_LOGIC_VECTOR(2 DOWNTO 0);
signal instruction :  STD_LOGIC_VECTOR (15 downto 0);
signal SUM      :  STD_LOGIC_VECTOR (2 downto 0);
signal jzr_address: STD_LOGIC_VECTOR (2 downto 0);
signal jzr_flag: STD_LOGIC;
signal  register1 : STD_LOGIC_VECTOR (2 downto 0);
signal register2 :  STD_LOGIC_VECTOR (2 downto 0);
signal  out0 :  STD_LOGIC_VECTOR (7 downto 0);
signal out1 :   STD_LOGIC_VECTOR (7 downto 0);
signal out2 :   STD_LOGIC_VECTOR (7 downto 0);
signal out3 :   STD_LOGIC_VECTOR (7 downto 0);
signal out4 :   STD_LOGIC_VECTOR (7 downto 0);
signal out5 :   STD_LOGIC_VECTOR (7 downto 0);
signal out6 :  STD_LOGIC_VECTOR (7 downto 0);
signal out7 :   STD_LOGIC_VECTOR (7 downto 0);
signal A        :  STD_LOGIC_VECTOR (7 downto 0);
signal  B        : STD_LOGIC_VECTOR (7 downto 0);
signal alu_out  :  STD_LOGIC_VECTOR(7 downto 0);
signal Write_Data : STD_LOGIC_VECTOR (7 downto 0);
signal register_enable: STD_LOGIC_VECTOR(2 downto 0);
signal add_sub_select:STD_LOGIC;
signal load_select: STD_LOGIC;
signal value :  STD_LOGIC_VECTOR (7 downto 0);
signal       add_enable : STD_LOGIC;
signal    mov_enable :  STD_LOGIC;
signal    neg_enable :  STD_LOGIC;
signal    jzr_enable :  STD_LOGIC;

signal C_OUT    :  STD_LOGIC;
signal address :  STD_LOGIC_VECTOR (2 downto 0);
signal  overflow : STD_LOGIC;
signal ZERO     :  STD_LOGIC ;
signal Data :STD_LOGIC_VECTOR(6 downto 0);



begin


PC :Counter
    port map(
        D =>address ,
        clk =>clk,
        reset => reset,
        memory_select =>  memory_select
         );


Instruction_memory1 :   Instruction_memory
    port map( 
        clk => clk,
        reset => reset,
        address => memory_select,
        instruction=>instruction
        );
        
Instruction_Decorder1:Instruction_Decoder
    port map(
        reset => reset,
        clk_in=>clk,
        Instruction_bus => instruction,
        add_sub_select =>add_sub_select,
        jzr_address => jzr_address,
        jzr_flag => jzr_flag,
        load_select => load_select,
         register1 =>  register1,
         register2 => register2,
        value  => value ,
        register_enable=> register_enable,
       
        add_enable => add_enable,
        mov_enable => mov_enable,
       neg_enable => neg_enable,
        jzr_enable => jzr_enable,
        check =>A
       
        );
        
Adder_3bit1 :Adder_3bit
    port map (
        A  =>  memory_select,
        SUM => SUM  ,
        C_OUT => C_OUT 
   );
   
 MUX_2way_3bit1 : MUX_2way_3bit
    port map (
        A0 => SUM,
         A1 => jzr_address,
         Sel => jzr_flag,
         Q => address 
         );
         
 MUX_8way_4bit1:MUX_8way_4bit
    port map(
           A0  => out0,
           A1  =>out1,
           A2  =>out2,
           A3   =>out3,
           A4  =>out4,
           A5 =>out5,
           A6 =>out6,
           A7  =>out7,
           Sel =>register1,
           Q   =>A
           );
           
         
   MUX_8way_4bit2:MUX_8way_4bit
      port map(
             A0  => out0,
             A1  =>out1,
             A2  =>out2,
             A3   =>out3,
             A4  =>out4,
             A5 =>out5,
             A6 =>out6,
             A7  =>out7,
             Sel =>register2,
             Q   =>B
             );
             
Register_Memory1 :Register_Memory
    port map(
        clk =>clk,
        reset => reset,
        Register_Enable => register_enable ,
        Write_Data => Write_Data,
       out0 => out0,
       out1  =>out1,
        out2  =>out2,
        out3   =>out3,
        out4 =>out4,
        out5=>out5,
        out6 =>out6,
       out7 =>out7
      
       );
       
Add_Sub_4bit_unit1:Add_Sub_4bit_unit
    port map (
        A => A,
        B => B,
        Sel   => add_sub_select,
        Alu_sum => alu_out,
        overflow =>overflow,
         ZERO =>ZERO
         );
         
 MUX_2way_4bit1 : MUX_2way_4bit
    port map(
        A0 => alu_out,
        A1 =>  value,
        Sel =>load_select,
        Q => Write_Data
        );
        
 LUT_7Seg1:LUT_7Seg
    port map(
        Address => out7(3 downto 0),
        Data =>Data
        );


overflow_final <= overflow;
zero_final<=ZERO;


output <= out7;
 Reg7_7seg<= Data;     
         



end Behavioral;
