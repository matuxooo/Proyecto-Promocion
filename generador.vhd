library IEEE;
use IEEE.std_logic_1164.all;
use work.ffd_pkg.all;
use IEEE.numeric_std.all;


entity generador is
    port (
    fila_z          : in        std_logic_vector    (2 downto 0);
    columna_z       : in        std_logic_vector    (2 downto 0);
    char            : in        std_logic_vector    (63 downto 0);
    muestra         : in        std_logic;
    px_visible      : out       std_logic
    );
end  generador;

architecture solucion of generador is

    begin
    px_visible <= char (63-to_integer (unsigned (fila_z)&unsigned(columna_z)) ) and muestra;


    end solucion;