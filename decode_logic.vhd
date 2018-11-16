----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2018 11:20:23 PM
-- Design Name: 
-- Module Name: decode_logic - Behavioral
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

entity decode_logic is

port(
instruction: in std_logic_vector(7 downto 0); --instruction input from IR
zero : in std_logic; --zero line from Register File
negative: in std_logic; --negative from Register file
stage, phase: in std_logic_vector(1 downto 0); -- Added from my understanding
reset:  in std_logic;
addrsel : out std_logic_vector(1 downto 0); --ok
irload : out std_logic; --ok
imload : out std_logic; --ok
regsel: out std_logic_vector(1 downto 0); --ok
dwrite: out std_logic; --ok
aluop: out std_logic_vector(1 downto 0); --OK
readwrite: out std_logic;  --OK
pcsel: out std_logic;  --
pcload: out std_logic; --OK
sregsel: out std_logic_vector(1 downto 0); -- OK
dregsel: out std_logic_vector(1 downto 0); --OK
mode: in std_logic
);

end decode_logic;

architecture Behavioral of decode_logic is
signal op1, op2, rd, rs : std_logic_vector(1 downto 0);
signal op1op2 : std_logic_vector(3 downto 0);
signal addsel01, regsel01 : std_logic_vector(1 downto 0);
signal dwr01,dwr02, pcld01 : std_logic;
begin
op1 <= instruction(7 downto 6);
op2 <= instruction(5 downto 4);
rd <= instruction(3 downto 2);
rs <= instruction(1 downto 0);
op1op2 <= instruction(7 downto 4);

addrsel <= "00" when reset = '1' else
--            addsel01 when stage = "10" else
            "10" when op1op2 = "0100" and stage = "10" else
            "10" when op1op2 = "0101" and stage = "10" else
            "01" when op1op2 = "1101" and stage = "10" and phase = "00" else
            "01" when op1op2 = "1110" and stage = "10" else
            "00";
--addsel01 <= "10" when op1op2 = "0100" and stage = "10" else
--            "10" when op1op2 = "0101" and stage = "10" else
--            "01" when op1op2 = "1101" and stage = "10" and phase = "00" else
--            "01" when op1op2 = "1110" and stage = "10" else
--            "00";
                        

irload <= '0' when reset = '1' else
        '1' when stage = "00" and phase = "10"  else
        '0' when stage = "01"  else
        '0'; 
        
imload <= '0' when reset = '1' else
          op1(1) when stage = "01" and phase = "10" else
          '0';

regsel <= "00" when reset = '1' else
          regsel01 when stage = "10" and phase = "10" else
          "00";
regsel01 <= "01" when op1op2 = "0110" else
            "10" when op1op2 = "1100" else
            "10" when op1op2 = "0100" else
            "11" when op1op2 = "0000" else
            "11" when op1op2 = "0001" else
            "11" when op1op2 = "0010" else
            "11" when op1op2 = "0011" else
            "00";
            
            
dwrite <= '0' when reset = '1' else
          dwr01 when stage = "10" and (phase = "01" or phase = "10")   else
          dwr02 when stage = "10" and phase = "11" else
          '0';
with op1op2 select dwr01 <=
          '1' when "0110" | "1100" | "1110",
          '0' when others;
with op1op2 select dwr02 <=
                    '1' when "0000" | "0001" | "0010" | "0011" | "0100",
                    '0' when others;

aluop <= "00" when reset = '1' else
         op2;
         
readwrite <= '0' when reset = '1' else
             '1' when mode = '1' else -- flashing mode
             op1(0) and (not op2(1)) and op2(0) when stage = "10" else
             '0';
pcsel <= '0' when reset = '1' else
         '0' when stage = "10" else
         '1';

pcload <= '0' when reset = '1' else
          '1' when stage = "00"  and phase = "00" else
          op1(1) when stage = "01"  and phase = "00" else
          (not op1(0) and op1(1) and pcld01) or (op1(0) and op1(1) and op2(0) and op2(1)) when stage = "10" else
          '0';

with op2 select pcld01 <= 
           zero when "00",
           not zero when "01",
           not zero and not negative when "10",
           negative when "11",
           '0' when others; -- we have 9 values for each input.
           
sregsel <= "00" when reset = '1' else
           rs;

dregsel <= "00" when reset = '1' else
           rd;

end Behavioral;
