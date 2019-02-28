----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:29:49 PM
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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
]library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce_tb is
end debounce_tb;

architecture testbench of debounce_tb is

Component debounce
port(clk :in std_logic;
    btn :in std_logic;
    dbnc :out std_logic);
end Component;

signal clk_tb : std_logic := '0';
signal btn_tb : std_logic;
signal dbnc_tb : std_logic;
constant clk_period : time := 8 ns;
begin
    uut: debounce PORT MAP (
    clk => clk_tb,
    btn => btn_tb,
    dbnc => dbnc_tb);
clk_process :process
    begin
    clk_tb <= '0';
    wait for 4 ns;
    clk_tb <= '1';
    wait for 4 ns;
end process
    
sim_proc: process
    begin
        wait for 8 ns;
        btn_tb <= '1';
        wait for 1 ms;
        btn_tb <= '0';
        wait for 1 ms;
        btn_tb <= '1';
        wait for 12 ms;
        btn_tb <= '0';
        wait for 40 ms;
    end process;
end process;
    
    dbnc: debounce
        port map(clk => clk_tb,
                 btn => btn_tb,
                 dbnc => dbnc_tb);
end testbench;