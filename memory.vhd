----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2018 09:21:41 PM
-- Design Name: 
-- Module Name: memory - Behavioral
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

entity memory is
generic ( RAM_SIZE : integer := 256 );
Port ( 
    address: in std_logic_vector(7 downto 0);
    dataout: in std_logic_vector(7 downto 0);
    datain: out std_logic_vector(7 downto 0);
    readwrite: in std_logic;
    clk: in std_logic;
    --res001: out std_logic_vector(7 downto 0);  
    addressout: out std_logic_vector(7 downto 0);
    rst: in std_logic
);
end memory;

architecture Behavioral of memory is	
signal data_to_deliver, to_store : std_logic_vector(7 downto 0);
type ram_type is array( RAM_SIZE - 1 downto 0 ) of std_logic_vector(7 downto 0);	
signal ram : ram_type;	
-- signal read_addr : std_logic_vector(7 downto 0);	

begin	
-- data_to_deliver <= ram(to_integer(unsigned(address)));
process(clk,rst)
begin	

 if ( rst = '1' ) then

	if rising_edge(clk) then 	
			datain <= ram(0);
	end if;
 else
 
	if rising_edge(clk) then 	
     if ( readwrite = '1' ) then                            -- In this process writing the input data into ram 
         ram(to_integer(unsigned(address))) <= dataout;
     elsif ( readwrite = '0' ) then
--             datain <= ram(to_integer(unsigned(read_addr)));
         datain <= ram(to_integer(unsigned(address)));
     end if;    
 end if;

end if;

end process;	
--res001 <= ram(64);
addressout<=address;
end Behavioral;	