----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 22:33:02
-- Design Name: 
-- Module Name: Nano_processor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nanoprocessor is
    Port ( clk            : in STD_LOGIC;
           reset          : in STD_LOGIC;
           overflow_final : out STD_LOGIC;
           zero_final     : out STD_LOGIC;
           output         : out STD_LOGIC_VECTOR(7 downto 0);
           Reg7_7seg      : out STD_LOGIC_VECTOR (6 downto 0);
           Anode          : out STD_LOGIC_VECTOR (3 downto 0) );
          
end nanoprocessor;

architecture Behavioral of nanoprocessor is
Component Top_Module
   Port (  clk            : in STD_LOGIC;
           reset          : in STD_LOGIC;
           overflow_final : out STD_LOGIC;
           zero_final     : out STD_LOGIC;
           output         : out STD_LOGIC_VECTOR(7 downto 0);
           Reg7_7seg      : out STD_LOGIC_VECTOR (6 downto 0);
           Anode          : out STD_LOGIC_VECTOR (3 downto 0) );
end Component;

Component Slow_clock
    Port ( Clk_in  : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Component;

signal slow_clk_out : std_logic;


begin
slow_clk : Slow_clock
    Port map( Clk_in  => clk,
              Clk_out => slow_clk_out );

top_module_nanoprocessor : Top_Module
   Port map( clk            => slow_clk_out,
             reset          => reset,
             overflow_final => overflow_final,
             zero_final     => zero_final,
             output         => output,
             Reg7_7seg      => Reg7_7seg,
          
             Anode          => Anode );    -- Anode = "1110"     -- to activate the last digit display from 4 7-segment display. 0 = activate display

end Behavioral;