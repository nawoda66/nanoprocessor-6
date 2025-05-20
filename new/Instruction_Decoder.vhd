
----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MORATUWA /CSE
-- Engineer: 
-- 
-- Create Date: 05/02/2025 03:16:12 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction_bus : in STD_LOGIC_VECTOR (15 downto 0);
           Check : in STD_LOGIC_VECTOR (7 downto 0);
           clk_in:in STD_LOGIC;
           reset:in STD_LOGIC;
           add_sub_select:out STD_LOGIC;
           add_enable : out STD_LOGIC ;
           mov_enable : out STD_LOGIC ;
           neg_enable : out STD_LOGIC ;
           jzr_enable : out STD_LOGIC ;
           register_enable:out STD_LOGIC_VECTOR(2 downto 0);
           load_select:out STD_LOGIC ;
           jzr_flag:out STD_LOGIC := '0';
           jzr_address:out STD_LOGIC_VECTOR (2 downto 0);
           
           register1 : out STD_LOGIC_VECTOR (2 downto 0);
           register2 : out STD_LOGIC_VECTOR (2 downto 0);
           value : out STD_LOGIC_VECTOR (7 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal opcode :std_logic_vector(1 downto 0);
 
begin
opcode <= Instruction_bus(15 downto 14);


process(clk_in,reset)
    begin
        if reset='1' then
            add_enable <= '0';
            mov_enable <= '0';
            neg_enable <='0';
            jzr_enable <= '0';
            add_sub_select <='0';
            register_enable <= (others => '0');
            load_select     <= '0';
            jzr_flag        <= '0';
            jzr_address     <= (others => '0');
            register1       <= (others => '0');
            register2       <= (others => '0');
            value           <= (others => '0');

        elsif rising_edge(clk_in) then
            -- Default values to prevent latching
        jzr_flag        <= '0';
        add_enable      <= '0';
        mov_enable      <= '0';
        neg_enable      <= '0';
        jzr_enable      <= '0';
        add_sub_select  <= '0';
        load_select     <= '0';
        register_enable <= (others => '0');
        register1       <= (others => '0');
        register2       <= (others => '0');
        value           <= (others => '0');
        jzr_address     <= (others => '0');
         
             case opcode is
                when "00" =>
                    add_enable <='1';
                    mov_enable <='0';
                    neg_enable <='0';
                    jzr_enable <='0';
                    register_enable <= Instruction_bus(13 downto 11);
                    add_sub_select<='0';
                    load_select <= '0';
                    register1 <= Instruction_bus(13 downto 11);
                    register2 <= Instruction_bus (10 downto 8);
                    value<="00000000";
                    

               when "10" =>
                    mov_enable <='1';
                    neg_enable <='0';
                    jzr_enable <='0';
                    add_enable <='0';
                    register_enable <= Instruction_bus(13 downto 11);
                    load_select <= '1';
                    register1 <= "000";
                    register2 <= "000";
                    value <= Instruction_bus (7 downto 0);
                    add_sub_select<='0';
                   

                    
                    
               when "01" =>
                    neg_enable <='1';
                    jzr_enable <='0';
                    add_enable <='0';
                    mov_enable <='0';
                    register_enable <= Instruction_bus(13 downto 11);
                    register2 <= Instruction_bus(13 downto 11);
                    register1 <="000";
                    add_sub_select <='1';
                    load_select <= '0';
                    
                    value<="00000000";
                     
                    
               when "11" =>
                    jzr_enable <= '1';
                    mov_enable <='0';
                    add_enable <='0';
                    neg_enable <='0';
                    add_sub_select<='0';
                    value<="00000000";
                    register_enable <= (others => '0');
                    register1 <= Instruction_bus(13 downto 11);
                    register2<="000";
                   
                    if Check="00000000" then
                       jzr_flag <= '1';
                       jzr_address <=Instruction_bus(2 downto 0);
                   end if;

                    
                    
               when others =>
                    NULL;
             end case;
             
             
         end if;



         
         
end process;
        




end Behavioral;
