
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: D.R.K.W.M.V.V.DEWDUNIKA
-- 
-- Create Date: 05/16/2025 02:24:05 AM
-- Design Name: 
-- Module Name: Register_4_bit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_4_bit is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           Res : in STD_LOGIC;
           EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Register_4_bit;

architecture Behavioral of Register_4_bit is


begin

    process (Clk,Res) begin
        
            if Res ='1' then
                Q <= "00000000";
              
            elsif (rising_edge(Clk)) then
            
                if EN='1' then  
                    Q <= D;
                end if;
            end if;
            
        
   end process;


end Behavioral;
