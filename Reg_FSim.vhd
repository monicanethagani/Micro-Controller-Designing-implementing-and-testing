----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 08:45:29 PM
-- Design Name: 
-- Module Name: Reg_FSim - Behavioral
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

entity Reg_FSim is
--  Port ( );
end Reg_FSim;

architecture Behavioral of Reg_FSim is
signal dwrite:  std_logic;
signal davl: std_logic_vector(7 downto 0);
signal clk: std_logic;
signal dregsel:  std_logic_vector(1 downto 0);
signal sregsel:  std_logic_vector(1 downto 0);
signal dbus:  std_logic_vector(7 downto 0);
signal sbus:  std_logic_vector(7 downto 0);
signal negative:  std_logic;
signal r0,r1,r2,r3:  std_logic_vector(7 downto 0);
signal zero:  std_logic;
begin
s0: entity work.reg_file(Behavioral)
    port map(
        dwrite=>dwrite,
        dval=>davl,
        clk=>clk,
        dregsel=>dregsel,
        sregsel=>sregsel,
        dbus=>dbus,
        sbus=>sbus,
        negative =>negative,
        r0=>r0, r1=>r1, r2=>r2, r3=>r3,
        zero => zero
    );
process
begin
    wait for 20 ns;
    clk<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="00000000";
    dregsel<="00";
    sregsel<="11";
    dwrite<='1';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="00000001";
    dregsel<="01";
    sregsel<="10";
    dwrite<='1';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="00000010";
    dregsel<="10";
    sregsel<="01";
    dwrite<='1';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="00000011";
    dregsel<="11";
    sregsel<="00";
    dwrite<='1';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="10000000";
    dregsel<="00";
    sregsel<="11";
    dwrite<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="10000000";
    dregsel<="01";
    sregsel<="10";
    dwrite<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="10000000";
    dregsel<="10";
    sregsel<="01";
    dwrite<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="10000000";
    dregsel<="11";
    sregsel<="00";
    dwrite<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="10000000";
    dregsel<="00";
    sregsel<="00";
    dwrite<='0';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="11111111";
    dregsel<="00";
    sregsel<="00";
    dwrite<='1';
    wait for 20 ns;
    clk<='1';
    wait for 20 ns;
    clk<='0';
    davl<="00000000";
    dregsel<="00";
    sregsel<="00";
    dwrite<='0';    
    wait for 20 ns;
    clk<='1';

end process;
end Behavioral;
