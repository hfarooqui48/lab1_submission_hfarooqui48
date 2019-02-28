----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:24:53 PM
-- Design Name: 
-- Module Name: clock_div_tb - Behavioral
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
use IEEE.STD_LOGIC_unsigned.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div_tb is
end clock_div_tb;

architecture testbench of clock_div_tb is

component clockdivider is
    Port (clockout : out STD_LOGIC;
          clockin : in STD_LOGIC);
    end component;
    signal clock_tb: std_logic:='0';
    signal clock_div: std_logic:='0';

begin
    clock_test_proc: process
    begin
        wait for 4 ns;
        clock_tb <= '1';

        wait for 4 ns;
        clock_tb <= '0';
    end process clock_test_proc;

    clockdiv: clockdivider
    port map( clockin => clock_tb,
             clockout => clock_div);
end testbench;