----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:05:17 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
    port( clock : in std_logic;
          btn : in std_logic_vector(3 downto 0);
          sw : in std_logic_vector(3 downto 0);
          led : out std_logic_vector(3 downto 0));
end counter_top;

architecture structure of counter_top is

component debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;
component clock_divider is
    Port (clockout : out STD_LOGIC;
          clockin : in STD_LOGIC);
end component;

component fancy_counter
Port ( clk : in STD_LOGIC;
       clk_en : in STD_LOGIC;
       dir : in STD_LOGIC;
       en : in STD_LOGIC;
       ld : in STD_LOGIC;
       rst : in STD_LOGIC;
       updn : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR (3 downto 0);
       cnt : out STD_LOGIC_VECTOR (3 downto 0));
end component;
    signal div: std_logic;
    signal dbnc_sig1: std_logic; 
    signal dbnc_sig2: std_logic; 
    signal dbnc_sig3: std_logic;
    signal dbnc_sig4: std_logic;

begin
    dbnc1: debounce
    port map(clk => clock,
             dbnc => dbnc_sig1,
             btn => btn(0));

    dbnc2: debounce
    port map(clk => clock,
             dbnc => dbnc_sig2,
             btn => btn(1));

    dbnc3: debounce
    port map(clk => clock,
             dbnc => dbnc_sig3,
             btn => btn(2));

    dbnc4: debounce
    port map(clk => clock,
             dbnc => dbnc_sig4,
             btn => btn(3));

    clk_div: clock_divider
    port map(clockin => clock,
            clockout => div);
    
    counter: fancy_counter
    port map(clk => clock,
             clk_en => div,
             dir => sw(0),
             en => dbnc_sig2,
             ld => dbnc_sig4,
             rst => dbnc_sig1,
             updn => dbnc_sig3,
             val => sw,
             cnt => led);
end structure;