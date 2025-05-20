
----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MORATUWA /CSE
-- Engineer: D.R.K.W.M.V.V.DEWDUNIKA
-- 
-- Create Date: 05/02/2025 08:14:40 PM
-- Design Name: 
-- Module Name: Instruction_memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_memory is
    Port (  clk: in STD_LOGIC;
            reset : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (15 downto 0));
end Instruction_memory;

architecture Behavioral of Instruction_memory is

type memory_array is array (7 downto 0) of STD_LOGIC_VECTOR(15 DOWNTO 0);
signal Imemory:memory_array :=(
            0 => "1011100000000000", -- MOVI R7, 0x00
            1 => "1000100000000001", -- MOVI R1, 0x01
            2 => "0011100100000000", -- ADD R7, R1
            3 => "1000100000000010", -- MOVI R1, 0x02
            4 => "0011100100000000", -- ADD R7, R1
            5 => "1001000000000011", -- MOVI R2, 0x03
            6 => "0011101000000000", -- ADD R7, R2
            7 => "0101000000000000"  -- NEG R2
            --7 => "1100000000000111"  -- JZR R0,7
    );


begin
process(reset,clk)
begin
    if(reset='1') then
        instruction <= (others =>'0');
        
    elsif rising_edge(clk) then
        instruction <= Imemory(to_integer(unsigned(address)));
    end if;
end process;


end Behavioral;
