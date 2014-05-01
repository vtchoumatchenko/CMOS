library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity grey_test_4bit is
end grey_test_4bit;

architecture test of grey_test_4bit is
    constant GRAY_COUNTER_WIDTH: positive := 4;
	constant CLOCK_PERIOD: time := 10 ns;
	signal clock_run: boolean := true;
    
	signal clock: std_logic;
	signal reset: std_logic;
	signal gray: unsigned(GRAY_COUNTER_WIDTH-1 downto 0);
begin 
    uut: entity work.gray_counter(v1)
        generic map (N=>GRAY_COUNTER_WIDTH)
        port map (clock, reset, gray);

    clock_process : process 
    begin 
        if clock_run then
            clock <= '0';
            wait for CLOCK_PERIOD/2;
            clock <= '1';
            wait for CLOCK_PERIOD/2;
        else
            wait;
        end if;	
    end process;

    stim_proc: process
        procedure check(constant expected: in integer; signal actual: in unsigned; signal clock: in std_logic) is
        begin
            wait until rising_edge(clock);
            assert expected = to_integer(actual) report "expected: " & integer'image(expected) & " / actual: " & integer'image(to_integer(actual));
        end;
    begin 
        reset <= '1';
        wait for 100 ns;          
        reset <= '0';
        
        check(0,gray,clock);
        check(1,gray,clock);
        check(3,gray,clock);
        check(2,gray,clock);
        check(6,gray,clock);
        check(7,gray,clock);
        check(5,gray,clock);
        check(4,gray,clock);
        check(12,gray,clock);
        check(13,gray,clock);
        check(15,gray,clock);        
        check(14,gray,clock);        
        check(10,gray,clock);
        check(11,gray,clock);
        check(9,gray,clock);
        check(8,gray,clock);
        
        -- just to produce some nice waveforms for N > 4
        for i in 2**GRAY_COUNTER_WIDTH-1-16 downto 0 loop
            wait until rising_edge(clock);
        end loop;

        clock_run <=false;
        wait;
    end process;
end;