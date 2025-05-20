
----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MORATUWA /CSE
-- Engineer: D.R.K.W.M.V.V.DEWDUNIKA
-- 
-- Create Date: 05/09/2025 07:06:07 PM
-- Design Name: 
-- Module Name: MUX_2way_4bit - Behavioral
-- Project Name: nanoprocessor design competition
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

entity MUX_2way_4bit is
    Port ( A0  : in STD_LOGIC_VECTOR(7 downto 0);
           A1  : in STD_LOGIC_VECTOR(7 downto 0);
           Sel : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR(7 downto 0) );
end MUX_2way_4bit;

architecture Behavioral of MUX_2way_4bit is

begin

Q <= A0 when(Sel = '0')
            else A1 ;


end Behavioral;
