----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2018 10:30:33
-- Design Name: 
-- Module Name: reg_file - Behavioral
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

entity reg_file is
Port (
    dwrite: in std_logic;
    dval:in std_logic_vector(7 downto 0);
    clk:in std_logic;
    dregsel: in std_logic_vector(1 downto 0);
    sregsel: in std_logic_vector(1 downto 0);
    dbus: out std_logic_vector(7 downto 0);
    sbus: out std_logic_vector(7 downto 0);
    negative: out std_logic;
    r0,r1,r2,r3: out std_logic_vector(7 downto 0);
    zero: out std_logic
);
end reg_file;

Architecture Behavioral of reg_file is
signal a,b,c,d: std_logic;
signal reg0,reg1,reg2,reg3:  std_logic_vector(7 downto 0);
signal ornot: std_logic;
signal dbus1: std_logic_vector(7 downto 0);


begin

process(dwrite,clk)
begin
    if(clk'event and clk = '1') then
        if (dwrite = '1') then
            if(dregsel="00") then
                reg0 <= dval;
            elsif(dregsel="01") then
                reg1 <= dval;
            elsif(dregsel="10") then
                reg2 <=dval;
            else
                reg3 <= dval;
            end if;
        else
            if(dregsel="00") then
                    dbus1 <=  reg0;
                    dbus <=  reg0;
                elsif(dregsel="01") then
                    dbus1 <=  reg1;
                    dbus <=  reg1;
                elsif(dregsel="10") then
                    dbus1 <=  reg2;
                    dbus <=  reg2;
                else 
                    dbus1 <=  reg3;
                    dbus <=  reg3;
            end if;

            if(sregsel="00") then
                sbus <= reg0;
            elsif(sregsel="01") then
                sbus <= reg1;
            elsif(sregsel="10") then
                sbus <= reg2;
            else
                sbus <= reg3;
            end if;
        end if;
            
    end if;
end process; 

    ornot <= (dbus1(0) or dbus1(1) or dbus1(2) or dbus1(3) or dbus1(4) or dbus1(5) or dbus1(6) or dbus1(7));
    
    zero <= not(ornot);
    negative <= dbus1(7);
    r0 <= reg0;
    r1 <= reg1;
    r2 <= reg2;
    r3 <= reg3;
    


end Behavioral;
