----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MORATUWA /CSE
-- Engineer: D.R.K.W.M.V.V.DEWDUNIKA / K Rakeshan
-- 
-- Create Date: 05/03/2025 01:11:52 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port (  D : in STD_LOGIC_VECTOR (2 downto 0);
            clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           memory_select : out STD_LOGIC_VECTOR (2 downto 0));
end counter;

architecture Behavioral of counter is




begin


    process(clk,reset)
        begin
            if reset = '1' then
                memory_select <="000";
            elsif rising_edge(clk) then
                memory_select <=D;
            end if;
        end process;





end Behavioral;