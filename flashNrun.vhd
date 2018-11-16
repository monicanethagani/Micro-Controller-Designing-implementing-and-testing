----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2018 11:47:04 PM
-- Design Name: 
-- Module Name: flashNrun - Behavioral
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

entity flashNrun is
--  Port ( );
end flashNrun;

architecture Behavioral of flashNrun is


signal clock, reset:  std_logic;
signal mode:  std_logic; -- mode of operation 0 means Normal, 1 means Flashing memory
signal zero0, neg :  std_logic;
signal addr_in,data_in,addr_bus :  std_logic_vector(7 downto 0);
signal r0,r1,r2,r3,ALU_out,Memory_out :  std_logic_vector(7 downto 0);
signal alu_op,adsl : std_logic_vector(1 downto 0);
signal reg_to, stg,phase: std_logic_vector(1 downto 0);
signal res007,pc,ir,im_data,db,sb,dv,addressout : std_logic_vector(7 downto 0);

begin
c1: entity work.micro_controller(Behavioral) 
        port map (
            clock=>clock, 
            reset=>reset,
            mode=>mode,
            zero0=>zero0, 
            neg=>neg,
            addr_in=>addr_in,
            addr_bus=>addr_bus,
            data_in=>data_in,
            r0=>r0, r1=>r1, r2=>r2, r3=>r3, ir=>ir,
            ALU_out=>ALU_out, res007=>res007,   stg=>stg,phase0=>phase, reg_to=>reg_to, prog_counter=>pc, im_data=>im_data,alu_op=>alu_op,addressout=>addressout,
            Memory_out=>Memory_out, db=>db, sb=>sb, dv=>dv,adsl=>adsl);
process
variable number : integer :=4;
begin
    
    wait for 100 ns;
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    clock <= '0';
    mode <= '1';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    addr_in <= "00000000";
    data_in <= "11100100"; -- e4
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000001";
    data_in <= "00000000"; --00 -- not 0x11
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000010";
    data_in <= "11100000"; -- e0
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000011";
    data_in <= "10000000"; --80
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000100"; 
    data_in <= "01001000";--48
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000101";
    data_in <= "10001000"; -- 88
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000110";
    data_in <= "00001101";--0d
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00000111";
    data_in <= "00100110";--26
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';                                                                                   
    addr_in <= "00001000";
    data_in <= "11101100";--ec
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001001";
    data_in <= "00000001";--01 -- not 0x12
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001010";
    data_in <= "00100011";--23
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001011";
    data_in <= "11111111";--ff
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001100";
    data_in <= "00000100";--04
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001101";
    data_in <= "11010100";--d4
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001110";
    data_in <= "01000000";--40
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00001111";
    data_in <= "11111111";--ff
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00010000";
    data_in <= "00001111"; --0f
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000000"; -- loading numbers
    data_in <= "00000110";--6
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000001";
    data_in <= "00000101";--5
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000010";
    data_in <= "00000100";--4
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000011";
    data_in <= "00000011";--3
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000100";
    data_in <= "00000010";--2
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000101";
    data_in <= "11100100";--1
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000110";
    data_in <= "00000111"; --7           
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "10000111";
    data_in <= "00000000";                       
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00010001";-- in address 0x11
    data_in <= "00000000";-- put zero as initial sum                       
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';   
    addr_in <= "00010010"; -- in addr 0x12
    data_in <= "00000001"; -- put 1 as the increment of addresses                      
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';                   
--       else
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    mode <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    reset <='1';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    reset <='0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    
        for I in 0 to 33333 loop
        wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    end loop;
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
end process;

end Behavioral;
        