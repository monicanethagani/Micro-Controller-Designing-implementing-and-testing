----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2018 03:20:28 PM
-- Design Name: 
-- Module Name: Debugging - Behavioral
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

entity Debugging is
--  Port ( );
end Debugging;

architecture Behavioral of Debugging is


signal clock, reset:  std_logic;
signal mode:  std_logic; -- mode of operation 0 means Normal, 1 means Flashing memory
signal zero0, neg :  std_logic;
signal addr_in,data_in,addr_bus :  std_logic_vector(7 downto 0);
signal r0,r1,r2,r3,ALU_out,Memory_out :  std_logic_vector(7 downto 0);
signal reg_to, stg,phase: std_logic_vector(1 downto 0);
signal res007,pc,ir,im_data : std_logic_vector(7 downto 0);

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
            ALU_out=>ALU_out, res007=>res007,   stg=>stg,phase0=>phase, reg_to=>reg_to, prog_counter=>pc, im_data=>im_data,
            Memory_out=>Memory_out);
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
    data_in <= "11100100"; -- r1
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    addr_in <= "00000001";
    data_in <= "01000000"; -- 0x40
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    addr_in <= "00000010";
    data_in <= "11110000"; -- f0
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    addr_in <= "00000011";
    data_in <= "00000000"; -- 0
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    addr_in <= "00000100";
    data_in <= "11110000"; -- f0
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';    
    addr_in <= "00000101";
    data_in <= "00000000"; -- 0


--    addr_in <= "00000000";
--    data_in <= "11100001"; -- r0 = 01
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    addr_in <= "00000001";
--    data_in <= "11100110"; -- r1 = 10
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    addr_in <= "00000010";
--    data_in <= "11101011"; -- r2 = 11
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    addr_in <= "00000011";
--    data_in <= "11101100"; -- r3 = 00
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    mode <= '0';
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    reset <='1';
--    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
--    reset <='0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    number := 6;
    for I in 6 to 255 loop
        
        wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
        addr_in <= std_logic_vector(to_unsigned(number,8));
        data_in <= std_logic_vector(to_unsigned(number,8));
        number := number + 1;
        
    end loop;
    
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    mode <= '0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    reset <='1';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    reset <='0';
    wait for 20 ns;     clock <= '1';     wait for 20 ns;     clock <= '0';
    for I in 0 to 255 loop
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
