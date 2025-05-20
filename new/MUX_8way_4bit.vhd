
----------------------------------------------------------------------------------
-- Company: UOM/FOE/CSE
-- Engineer: K Rakeshan
-- 
-- Create Date: 03.05.2025 22:52:40
-- Module Name: MUX_8way_to_4bit - Behavioral
-- Project Name: nano-processor
-- Description: multiplexer for 8 to 1 with 3bit data
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

entity MUX_8way_4bit is
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
end MUX_8way_4bit;

architecture Behavioral of MUX_8way_4bit is

begin

    process (A0,A1,A2,A3,A4,A5,A6,A7, Sel)
    begin
    
    case Sel is
    when "000" => Q <= A0;
    when "001" => Q <= A1;
    when "010" => Q <= A2;
    when "011" => Q <= A3;
    when "100" => Q <= A4;
    when "101" => Q <= A5;
    when "110" => Q <= A6;
    when "111" => Q <= A7;
    when others => NULL;
    end case;
    
    end process;

end Behavioral;
