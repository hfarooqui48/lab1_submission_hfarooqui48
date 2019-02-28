----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2019 08:29:26 PM
-- Design Name: 
-- Module Name: counter_1 - Behavioral
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

entity clock_div is
  Port (clockin: in std_logic;
        clockout: out std_logic);
end clock_div;

architecture Behavioral of clock_div is
signal Count: std_logic;
begin
process (clockin)
begin
      if Count < 125000000/2 then
      Count <= Count + 1;
      clockout <= '0';
      else
        Count <= '0';
        clockout <= '1';
      end if;
end process;

end Behavioral;
