
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2025 13:09:22
-- Design Name: 
-- Module Name: Slow_clock - Behavioral
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

entity Slow_clock is
    Port ( Clk_in  : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_clock;

architecture Behavioral of Slow_clock is
signal  count : integer :=1 ;
signal  Clk_status : STD_LOGIC :='0' ;

begin

    process (Clk_in)
    begin
    
        if (rising_edge(Clk_in))    then
            count <= count + 1 ;
            --if (count = 5)  then        -- for simulation
           if (count = 50000000)  then        -- for Basys3 board test
                Clk_status <= not (Clk_status);
                Clk_out <= Clk_status;
                count <= 1;
            end if;
        end if;
    
    end process;

end Behavioral;
