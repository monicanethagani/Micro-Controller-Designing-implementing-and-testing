----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:17:06 PM
-- Design Name: 
-- Module Name: StageSim - Behavioral
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

entity StageSim is
--  Port ( );
end StageSim;

architecture Behavioral of StageSim is
signal clk :  STD_LOGIC;
signal reset :  STD_LOGIC;
signal stage, phase :  STD_LOGIC_VECTOR(1 downto 0);
begin
s1: entity work.stage_counter(Behavioral) port map (clk=>clk, reset=>reset, stage=>stage, phase=>phase);

process
begin
    wait for 20 ns;
    clk <= '0';
    reset <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    reset <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    reset <= '1';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    reset <= '0';

    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;     clk <= '1';     wait for 20 ns;     clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
    wait for 20 ns;
    clk <= '0';
    wait for 20 ns;
    clk <= '1';
end process;

end Behavioral;
