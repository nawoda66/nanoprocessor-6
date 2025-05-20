----------------------------------------------------------------------------------
-- Company: UOM/FOE/CSE
-- Engineer: K Rakeshan
-- 
-- Create Date: 05.05.2025 21:55:55
-- Module Name: RCA_3bit - Behavioral
-- Project Name: nano-processor
-- Description: src file for 3bit adder for counter
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

entity Adder_3bit is
    Port ( A        : in STD_LOGIC_VECTOR (2 downto 0);
           SUM      : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT    : out STD_LOGIC);
end Adder_3bit;

architecture Behavioral of Adder_3bit is
Component FA
    Port(
           A        : in STD_LOGIC;
           B        : in STD_LOGIC;
           C        : in STD_LOGIC;
           SUM      : out STD_LOGIC;
           CARRY    : out STD_LOGIC);
end Component;

signal FA0_CARRY,FA1_CARRY, FA2_CARRY : std_logic;
signal FA0_SUM,FA1_SUM, FA2_SUM : std_logic;
signal b : std_logic_vector(2 downto 0);

begin
    
    b <= "001";

    FA_0 : FA
    port map(
              A => A(0),
              B => b(0),
              C => '0',
              SUM => FA0_SUM,
              CARRY => FA0_CARRY );
            
    FA_1 : FA
    port map(
              A => A(1),
              B => b(1),
              C => FA0_CARRY,
              SUM => FA1_SUM,
              CARRY => FA1_CARRY );
        
    FA_2 : FA
    port map(
              A => A(2),
              B => b(2),
              C => FA1_CARRY,
              SUM => FA2_SUM,
              CARRY => FA2_CARRY );
              
    SUM(0) <= FA0_SUM;
    SUM(1) <= FA1_SUM;
    SUM(2) <= FA2_SUM;
    C_OUT <= FA2_CARRY;

end Behavioral;