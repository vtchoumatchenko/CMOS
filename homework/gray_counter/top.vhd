library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is 
	port(clock, reset : in std_logic;
	gray: out unsigned (3 downto 0));
end top;

architecture structural of top is
    
begin
    u1: entity work.gray_counter(v1)
        generic map(N => 4)
        port map ( clock => clock, reset => reset, gray => gray);
end;