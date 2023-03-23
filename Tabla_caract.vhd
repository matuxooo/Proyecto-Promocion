library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tabla_caract is 
port (
    codigo_char     : in std_logic_vector (3 downto 0);
    char            : out std_logic_vector (63 downto 0)
);
end tabla_caract;
architecture solucion of tabla_caract is

    begin 
    with codigo_char select
    char <= x"00007e66667e7e666666" when "01100001",
            x"00000000000000000000" when others;
    

end solucion;