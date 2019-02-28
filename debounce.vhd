----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 03:21:24 AM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
  Port ( 
        btn: in std_logic;
        clk: in std_logic;
        dbnc: out std_logic  );
end debounce;

architecture my_debounce of debounce is

signal shift_reg: std_logic_vector (1 downto 0);
signal count: std_logic_vector (2 downto 0):=(others=>'0');
signal counter: std_logic_vector (2 downto 0):=(others=>'0');

begin
process (clk)
begin
    if rising_edge(clk) then
        shift_reg(1) <= shift_reg(0);
        shift_reg(0) <= btn;            
            if (unsigned(count) < 2499999) then
                dbnc <= '0';
                if shift_reg(1)= '1' then            
                    counter <= std_logic_vector(unsigned(counter) + 1);
                else
                    counter <= (others => '0');
                end if;
            else
                dbnc <= '1';
                if (unsigned(counter) < 2499999) then                  
                    if shift_reg(1)= '0' then            
                        counter <= std_logic_vector(unsigned(counter) + 1);
                    else
                        counter <= (others => '0');
                    end if;
                else
                    dbnc <= '0';
                    count <= (others => '0');
                    counter <= (others => '0');                   
                end if;
            end if;
            end if;
end process;

end my_debounce;