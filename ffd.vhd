library IEEE;
use IEEE.std_logic_1164.all;

package ffd_pkg is
    component ffd is
        generic(
            constant N : natural := 1);
        port(
            rst : in std_logic;
            D   : in std_logic_vector (N-1 downto 0);
            clk : in std_logic;
            Q   : out std_logic_vector (N-1 downto 0));
    end component;
end package;

library IEEE;
use IEEE.std_logic_1164.all;

entity ffd is
    generic(
        constant N : natural := 1);
    port(
        rst : in std_logic;
        D   : in std_logic_vector (N-1 downto 0);
        
        clk : in std_logic;
        Q   : out std_logic_vector (N-1 downto 0));
end ffd;


architecture solucion of ffd is
begin
    flipflop : process (clk, rst)
    begin
    -- completar
    if (rst = '1') then
        Q <= (N-1 downto 0 =>'0');   
    elsif (clk'event and clk ='1')then
         Q <= D;
        end if; 
    end process;
end solucion;