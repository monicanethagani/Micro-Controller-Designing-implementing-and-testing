----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 08:41:11 PM
-- Design Name: 
-- Module Name: memSim - Behavioral
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

entity memSim is
--  Port ( );
end memSim;

architecture Behavioral of memSim is

signal address:  std_logic_vector(7 downto 0);
signal dataout:  std_logic_vector(7 downto 0);
signal datain:  std_logic_vector(7 downto 0);
signal readwrite:  std_logic;
signal clk:  std_logic;
signal rst:  std_logic;

begin
s2: entity work.memory(Behavioral) 
        generic map (RAM_SIZE=>256)
        port map (
            address => address,
            dataout => dataout,
            datain => datain,
            readwrite => readwrite,
            clk => clk,
            rst => rst);
process
begin
    wait for 20 ns;
    clk <= '1';
    rst <= '0';
    readwrite <= '0';
    wait for 20 ns;
    clk <= '0';
    rst <= '1';
    wait for 20 ns;
    clk <= '1';
    rst <= '0';
    wait for 20 ns;
    clk <= '0';
    readwrite <= '1'; -- write
    address <= "00000000";
    dataout <= "10101010";
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    readwrite <= '0'; -- write
    address <= "00000000";
    dataout <= "10001000";    
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';

end process;


end Behavioral;
