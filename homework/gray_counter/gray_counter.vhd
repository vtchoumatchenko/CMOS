library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_counter is 
	generic(N: positive);
	port(clock, reset : in std_logic;
	gray : out unsigned (N-1 downto 0));
end gray_counter;
	
architecture v1 of gray_counter is   
begin
    counter: process(clock, reset)       
        variable bin : unsigned(gray'range);        
    begin
        if(reset = '1') then
            bin := (others => '0');
            gray <= (others => '0');            
        elsif rising_edge(clock) then
        
        -- TODO

        end if;  
    end process;
end;