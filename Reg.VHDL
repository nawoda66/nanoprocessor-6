----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 12:23:03 PM
-- Design Name: 
-- Module Name: Reg_bank - Behavioral
-- Project Name: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_bank is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_wrt : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_read : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_bank;

architecture Behavioral of Reg_bank is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

COMPONENT Decoder_3_to_8
 Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL En:std_logic:='1';
signal DY:std_logic_vector(7 downto 0);
signal Reg_Q0,Reg_Q1,Reg_Q2,Reg_Q3,Reg_Q4,Reg_Q5,Reg_Q6,Reg_Q7: std_logic_vector(3 downto 0);
begin


Decoder_3_to_8_0 : Decoder_3_to_8
PORT MAP(
I=>Reg_en,
EN=>En,
Y=>DY
);

Reg_0 : Reg
port map(
D=>"0000",
Res=>Reset,
EN=>DY(0),
Clk=>Clk,
Q=>Reg_Q0
);

Reg_1 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(1),
Clk=>Clk,
Q=>Reg_Q1
);

Reg_2 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(2),
Clk=>Clk,
Q=>Reg_Q2
);

Reg_3 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(3),
Clk=>Clk,
Q=>Reg_Q3
);

Reg_4 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(4),
Clk=>Clk,
Q=>Reg_Q4
);

Reg_5 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(5),
Clk=>Clk,
Q=>Reg_Q5
);

Reg_6 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(6),
Clk=>Clk,
Q=>Reg_Q6
);

Reg_7 : Reg
port map(
D=>Reg_wrt,
Res=>Reset,
EN=>DY(7),
Clk=>Clk,
Q=>Reg_Q7
);

with Reg_en select
    Reg_read <= Reg_Q0 when "000",
                 Reg_Q1 when "001",
                 Reg_Q2 when "010",
                 Reg_Q3 when "011",
                 Reg_Q4 when "100",
                 Reg_Q5 when "101",
                 Reg_Q6 when "110",
                 Reg_Q7 when "111",
                 (others => '0') when others;

end Behavioral;
