----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 01:06:58 AM
-- Design Name: 
-- Module Name: ALU_0 - Behavioral
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

entity ALU_0 is
  generic (
        REGSIZE  : integer := 16;
        NUM_of_OP: integer := 4;
        MULT_OPERAND_SIZE: integer := 8;
        STATUS_SIZE: integer := 8);
  Port ( 
          operand1: in std_logic_vector(REGSIZE-1 downto 0);
          operand2: in std_logic_vector(REGSIZE-1 downto 0);
          operator: in std_logic_vector(NUM_of_OP-1 downto 0);
          result: out std_logic_vector(REGSIZE-1 downto 0);
          --debug: out  std_logic_vector(REGSIZE+1 downto 0);
          status: out std_logic_vector(STATUS_SIZE-1 downto 0)
   );
end ALU_0;

architecture Behavioral of ALU_0 is
signal multiplication_op1 : std_logic_vector (MULT_OPERAND_SIZE downto 0);
signal multiplication_op2 : std_logic_vector (MULT_OPERAND_SIZE downto 0);
signal op1,op2 : std_logic_vector (REGSIZE+1 downto 0);
signal res :  std_logic_vector(REGSIZE+1 downto 0);
signal add_res : std_logic_vector(REGSIZE+3 downto 0);
begin

    --data preparation
    multiplication_op1 <= '0' & operand1(MULT_OPERAND_SIZE-1 downto 0) when signed(operand1(MULT_OPERAND_SIZE-1 downto 0)) >= 0 else
                            '1' & operand1(MULT_OPERAND_SIZE-1 downto 0);
    multiplication_op2 <= '0' & operand2(MULT_OPERAND_SIZE-1 downto 0) when signed(operand2(MULT_OPERAND_SIZE-1 downto 0)) >= 0 else
                          '1' & operand2(MULT_OPERAND_SIZE-1 downto 0);
                          
    op1 <= "00"&operand1;--operand1(Regsize-1)&operand1(Regsize-1)&operand1; I don't want it to be same sign flag as I need the extra bits in my calculations
    op2 <= "00"&operand2;--operand2(Regsize-1)&operand2(Regsize-1)&operand2;
    --op1 <= "00" & operand1 when signed(operand1) >= 0 else
    --    "11"  & operand1;
   -- op2 <= "00" & operand2 when signed(operand2) >= 0 else
   --         "11"  & operand1;
        
    res <= std_logic_vector(signed(op1) + signed(op2)) when operator = "0000" else
                std_logic_vector(signed(op1) - signed(op2)) when operator = "0001" else
                ("00" & operand1) AND ("00" & operand2) when operator = "0101" else
                ("00" & operand1) OR ("00" & operand2) when operator = "0110" else
                
                std_logic_vector(signed(multiplication_op1) * signed(multiplication_op2)) when operator = "0010" else
                std_logic_vector(signed(op1) + 1) when operator = "0011" else
                std_logic_vector(signed(op1) - 1) when operator = "0100" else
                
                ("00" & operand1) XOR ("00" & operand2) when operator = "0111" else
                "11" & NOT operand1 when operator = "1000" else  
                "00" & std_logic_vector(rotate_left(unsigned(operand1),to_integer(unsigned(operand2))))  when operator = "1001" else
                "00" & std_logic_vector(rotate_right(unsigned(operand1),to_integer(unsigned(operand2))))  when operator = "1010" else
                "00" & operand1;
                
    result <= res(REGSIZE-1 downto 0); -- zero flag
    status(0) <= '1' when to_integer(signed(res(REGSIZE-1 downto 0))) = 0 else
                   '0'; --Zero bit
                    
      --with operator select -- carry flag
    --  status(1) <= res(REGSIZE) or res(REGSIZE+1) when operator = "0010" else
    --                res(REGSIZE) when (unsigned(res) > unsigned(res(REGSIZE-1 downto 0)) and operator = "0000") else
    --                res(REGSIZE) when (unsigned(res) > unsigned(res(REGSIZE-1 downto 0)) and operator = "0011") else
    --                '0';
    status(1) <= res(REGSIZE); -- carry flag
     --       status(1) <= res(REGSIZE) or res(REGSIZE+1) when "0000" | "0010" | "0011",
     --                   '0' when others; -- Carry bit
     
    status(2) <= res(REGSIZE-1); -- Sign bit (+/-)
   
    with operator select -- Overflow
            status(3) <= (res(REGSIZE-1) and (op1(MULT_OPERAND_SIZE-1) XNOR op2(MULT_OPERAND_SIZE-1)))      or      ( (NOT res(REGSIZE-1))   and   ( op1(MULT_OPERAND_SIZE-1) XOR op2(MULT_OPERAND_SIZE-1)) ) when "0010",
                        ( res(REGSIZE-1) and  (op1(REGSIZE-1) nor op2(REGSIZE-1)) )    or    ((NOT res(REGSIZE-1)) and op1(REGSIZE-1) and op2(REGSIZE-1)) when "0000" | "0011",
                        '0' when others; -- overflow bit
      status(STATUS_SIZE-1 downto 4) <= (others=>'0');
      
     -- debug <= res;
                          

end Behavioral;
