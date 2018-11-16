----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2018 15:53:43
-- Design Name: 
-- Module Name: stage_counter - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity stage_counter is
Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    stage : out STD_LOGIC_VECTOR(1 downto 0);
    phase : out  STD_LOGIC_VECTOR(1 downto 0)
);
end stage_counter;

architecture Behavioral of stage_counter is
signal m,n: std_logic_vector(1 downto 0) := "00";
begin
process(clk,reset)
    begin
        if ( reset='1') then
            m <= "00";
            n <= "00";
        elsif (clk'event and clk = '1') then
            if (m = "10" and n = "11") then
                m<="00";
                n<="00";
            elsif (n = "10" and (m = "00" or m = "01")) then
                n<="00";
                m <= std_logic_vector(unsigned(m)+1);
            else
                n <= std_logic_vector(unsigned(n)+1);
            end if;
       end if;
            
    end process;
    phase<=n;
    stage <= m;
end Behavioral;
