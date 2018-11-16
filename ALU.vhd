----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2018 06:37:20 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port (
  A: in std_logic_vector(7 downto 0);
  B: in std_logic_vector(7 downto 0);
  aluop: in std_logic_vector(1 downto 0);
  result: out std_logic_vector(7 downto 0)
  );
end ALU;

architecture Behavioral of ALU is
signal operand1:  std_logic_vector(7 downto 0);
signal operand2:  std_logic_vector(7 downto 0);
signal operator:  std_logic_vector(3 downto 0);
signal result0:  std_logic_vector(7 downto 0);
--debug: out  std_logic_vector(REGSIZE+1 downto 0);
signal status:  std_logic_vector(7 downto 0);

begin
p0: entity work.ALU_0(Behavioral)
        generic map(REGSIZE => 8, NUM_of_OP => 4, MULT_OPERAND_SIZE => 4, STATUS_SIZE=> 8)
        port map(operand1=>operand1,operand2=>operand2,operator=>operator,result=>result0,status=>status);
result <= result0;
operand1 <= A;
operand2 <= B;
with aluop select operator <=
            "0101" when "00",
            "0110" when "01",
            "0000" when "10",
            "0001" when "11",
            "1111" when others;


end Behavioral;
