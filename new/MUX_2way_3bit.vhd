
----------------------------------------------------------------------------------
-- Company: UOM/FOE/CSE
-- Engineer: K Rakeshan
-- 
-- Create Date: 03.05.2025 22:52:40
-- Module Name: MUX_2way_to_3bit - Behavioral
-- Project Name:  nano-processor
-- Description: multiplexer for 2 to 1 with 3bit data
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

entity MUX_2way_3bit is
    Port ( A0  : in STD_LOGIC_VECTOR(2 downto 0);
           A1  : in STD_LOGIC_VECTOR(2 downto 0);
           Sel : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR(2 downto 0) );
end MUX_2way_3bit;

architecture Behavioral of MUX_2way_3bit is

begin

    Q <= A0 when(Sel = '0')
            else A1 ;
            
end Behavioral;
