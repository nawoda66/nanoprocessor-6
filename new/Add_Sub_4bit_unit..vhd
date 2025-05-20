----------------------------------------------------------------------------------
-- Company: UOM/FOE/CSE
-- Engineer:Andrahennadi N.J.
-- 
-- Create Date: 03.05.2025 19:39:09
-- Module Name: 4bit_Add_Sub_Unit - Behavioral
-- Project Name: nano-processor
-- Description: Design source file for 4bit Add/Sub unit
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add_Sub_4bit_unit is
    Port ( A        : in STD_LOGIC_VECTOR (7 downto 0);
           B        : in STD_LOGIC_VECTOR (7 downto 0);
           Sel      : in STD_LOGIC;
           Alu_sum      : out STD_LOGIC_VECTOR (7 downto 0);
           overflow : out STD_LOGIC;
           ZERO     : out STD_LOGIC );
end Add_Sub_4bit_unit;

architecture Behavioral of Add_Sub_4bit_unit is
Component FA
    Port(
           A        : in STD_LOGIC;
           B        : in STD_LOGIC;
           C        : in STD_LOGIC;
           SUM      : out STD_LOGIC;
           CARRY    : out STD_LOGIC);
end Component;

signal c0,c1,c2,c3,c4,c5,c6,c7: std_logic;
signal SUM :std_logic_vector(7 downto 0);
signal B_comp: std_logic_vector(7 downto 0);

begin
           B_comp <= B when (Sel  = '0') else not B;
           
            FA_0 : FA
            port map(
                      A => A(0),
                      B => B_comp(0),
                      C => Sel,
                      SUM => SUM(0),
                      CARRY => c0 );
            
            FA_1 : FA
            port map(
                      A => A(1),
                      B =>  B_comp(1),
                      C => c0,
                      SUM => SUM(1),
                      CARRY => c1 );
            
            FA_2 : FA
            port map(
                      A => A(2),
                      B =>  B_comp(2),
                      C => c1,
                      SUM => SUM(2),
                      CARRY => c2 );

            FA_3 : FA
            port map(
                      A => A(3),
                      B =>  B_comp(3),
                      C => c2,
                      SUM => SUM(3),
                      CARRY => c3 );
              
          FA_4: FA
              port map(
                        A => A(4),
                        B =>  B_comp(4),
                        C => c3,
                        SUM => SUM(4),
                        CARRY => c4 );
        FA_5 : FA
            port map(
                      A => A(5),
                      B =>  B_comp(5),
                      C => c4,
                      SUM => SUM(5),
                      CARRY => c5 );
            FA_6 : FA
              port map(
                        A => A(6),
                        B =>  B_comp(6),
                        C => c5,
                        SUM => SUM(6),
                        CARRY => c6 );
        FA_7 : FA
            port map(
                      A => A(7),
                      B =>  B_comp(7),
                      C => c6,
                      SUM => SUM(7),
                      CARRY => c7 );

                      
                      
          Alu_sum<=SUM;
          overflow <= c7 XOR c6;          -- need to set an LED
          ZERO <= NOT( SUM(0) or SUM(1) or SUM(2) or SUM(3) or SUM(4) or SUM(5) or SUM(6) or SUM(7) or c7);    -- need to set an LED


end Behavioral;