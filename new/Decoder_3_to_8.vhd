----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 02:34:26 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
COMPONENT Decoder_2_TO_4
PORT ( I : in STD_LOGIC_VECTOR (1 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
SIGNAL I0,I1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL Y0,Y1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL en0,en1,I2 : STD_LOGIC;

     

begin
decoder_2_to_4_0 : Decoder_2_to_4
 port map(
 I => I0,
 EN => en0,
 Y => Y0 );
 decoder_2_to_4_1 : Decoder_2_to_4
 port map(
 I => I1,
 EN => en1,
 Y => Y1 );
 
 en0 <= EN AND NOT(I(2));
 en1 <= EN AND I(2);
 I0 <= I(1 downto 0);
 I1 <= I(1 downto 0);
 I2 <= I(2);
 
 Y(3 downto 0) <= Y0;
 Y(7 downto 4) <= Y1;


end Behavioral;
