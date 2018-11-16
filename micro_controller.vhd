----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2018 10:10:47 PM
-- Design Name: 
-- Module Name: micro_controller - Behavioral
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

entity micro_controller is
  Port ( 
    clock, reset: in std_logic;
    mode: in std_logic; -- mode of operation 0 means Normal, 1 means Flashing memory
    zero0, neg : out std_logic;
    addr_in,data_in : in std_logic_vector(7 downto 0);      
    res007: out std_logic_vector(7 downto 0);
    stg,phase0,reg_to: out std_logic_vector (2 downto 1);
    ir, prog_counter, im_data : out std_logic_vector(7 downto 0);
    adsl: out std_logic_vector(1 downto 0);
    r0,r1,r2,r3,ALU_out,Memory_out,addr_bus,db,sb,dv,addressout : out std_logic_vector(7 downto 0);
    alu_op: out std_logic_vector(1 downto 0)
  );
end micro_controller;

architecture Behavioral of micro_controller is
signal clk : std_logic; -- system Clock
signal rst : std_logic; -- system reset signal
signal stage,phase: std_logic_vector(1 downto 0); -- stage count
signal dbus,sbus,result : std_logic_vector(7 downto 0);
signal aluop : std_logic_vector(1 downto 0);

signal instruction:  std_logic_vector(7 downto 0); --instruction input from IR
signal zero :  std_logic; --zero line from Register File
signal negative:  std_logic; --negative from Register file
signal addrsel :  std_logic_vector(1 downto 0); 
signal irload :  std_logic; 
signal imload :  std_logic; 
signal regsel:  std_logic_vector(1 downto 0); 
signal dwrite:  std_logic;
signal readwrite:  std_logic;  
signal pcsel:  std_logic;  
signal pcload:  std_logic;
signal sregsel:  std_logic_vector(1 downto 0);
signal dregsel:  std_logic_vector(1 downto 0);
signal mode_of_op: std_logic;

signal dval: std_logic_vector(7 downto 0);
signal reg0,reg1,reg2,reg3:  std_logic_vector(7 downto 0);

signal address,addressout0:  std_logic_vector(7 downto 0);
signal dataout:  std_logic_vector(7 downto 0);
signal datain:  std_logic_vector(7 downto 0);

signal addrbus : std_logic_vector(7 downto 0);
signal pc,immed,next_pc : std_logic_vector(7 downto 0);

signal res001: std_logic_vector(7downto 0);
begin
p0: entity work.stage_counter(Behavioral) port map (clk=>clk,reset=>rst,stage=>stage,phase=>phase);
p1: entity work.ALU(Behavioral) port map (A=>dbus, B=>sbus, aluop=>aluop,result=>result);
p2: entity work.decode_logic(Behavioral) 
        port map (instruction=>instruction,
                    zero=>zero,
                    negative=>negative,
                    stage=>stage,
                    phase=>phase,
                    reset=>rst,
                    addrsel=>addrsel,
                    irload=>irload,
                    imload=>imload,
                    regsel=>regsel,
                    dwrite=>dwrite,
                    aluop=>aluop,
                    readwrite=>readwrite,
                    pcsel=>pcsel,
                    pcload=>pcload,
                    sregsel=>sregsel,
                    dregsel=>dregsel,
                    mode=>mode_of_op);
                    
p3: entity work.reg_file(Behavioral) 
        port map (dwrite=>dwrite,
                dval=>dval,
                clk=>clk,
                dregsel=>dregsel,
                sregsel=>sregsel,
                dbus=>dbus,
                sbus=>sbus,
                negative=>negative,
                r0=>reg0,
                r1=>reg1,
                r2=>reg2,
                r3=>reg3,
                zero=>zero); 
p4: entity work.memory(Behavioral) 
            generic map (RAM_SIZE=>256)
           port map (
                        address => address,
                        dataout => dataout,
                        datain => datain,
                        readwrite => readwrite,
                        clk => clk,
                        rst => rst);
                    
clk <= clock;
rst <= reset;
zero0 <= zero;
neg <= negative;
r0 <= reg0;
r1 <= reg1;
r2 <= reg2;
r3 <= reg3;
addr_bus<=address;
ALU_out <= result;
prog_counter <= pc;
ir<=instruction;
Memory_out <= datain;
mode_of_op<=mode;
phase0<=phase;
next_pc<=std_logic_vector(unsigned(pc) + 1);
db<= dbus;
sb<=sbus;
dv<=dval;
adsl<=addrsel;
alu_op<= aluop;
addressout<=addressout0;

process (clk)
begin
    if (rst = '1') then
        address<="00000000";        
    elsif(clk'event and clk = '1') then
        case mode is
            when '1' => address <= addr_in;
            when others => address <= addrbus; -- to flash memory with s/w
        end case;
        case mode is
            when '1' => dataout <= data_in;
            when others => dataout <= dbus;   -- to flash memory with s/w
        end case;        
    end if;
end process;

process (clk)
begin 
    if (clk'event and clk = '1') then 
        case regsel is 
            when "00" => dval <= immed;
            when "01" => dval <= sbus;
            when "10" => dval <= datain;
            when others => dval <= result;
        end case;
    end if;
end process;


process (clk)
begin 
    if (clk'event and clk = '0') then -- falling edge
        case addrsel is
            when "00" => addrbus <= pc;
            when "01" => addrbus <= immed;
            when "10" => addrbus <= sbus;
            when others => addrbus <= dbus;
        end case;
        
    end if;
end process;

process (clk,pcload,reset)
begin 
    if (reset = '1') then 
        pc <= "00000000";
    elsif (clk'event and clk = '1') then -- 
        if (pcload = '1') then
            case pcsel is
                when '0' => pc <= immed;
                when others => pc <= next_pc;
            end case;
        end if;
    end if;
end process;

process (clk,imload)
begin 
    if (clk'event and clk = '1') then 
        if (imload = '1') then
            immed <= datain;
        end if;
    end if;
end process;

process (clk,irload)
begin 
    if (clk'event and clk = '1') then 
        if (irload = '1') then
            instruction <= datain;
        end if;
    end if;
end process;
res007 <= res001;
reg_to<=dregsel;
im_data<= immed;
stg <= stage;
end Behavioral;
