library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ffd_pkg.all;


entity posicion_texto is
    port (
        fila           : in    std_logic_vector    (9 downto 0);
        columna         : in    std_logic_vector    (9 downto 0);  
        muestra         : in    std_logic;      
        fila_z         : out    std_logic_vector    (2 downto 0);
        columna_Z       : out    std_logic_vector    (2 downto 0);  
        n_zona          : out   std_logic_vector    (4 downto 0);
        codigo_char       : out std_logic_vector (6 downto 0);
        char            : in std_logic_vector (63 downto 0);
        valido          : out   std_logic
    );
end posicion_texto;

architecture solucion of posicion_texto is

signal alinea : std_logic_vector (9 downto 0);

begin

    columna_z       <= columna (6 downto 4);



    alinea          <= std_logic_vector( unsigned (fila) - 112);
    
    fila_z         <=  alinea (6 downto 4);


    valido          <=  muestra; 

    --las columnas van desde el numero de bit 8 que se llama 7
    with   columna (9 downto 7) select 
    codigo_char <=  "1001000" when "000",
                    "1001111" when "001",
                    "1001100" when "010",
                    "1000001" when "011",
                    "0100001" when "100",
                "0000000" when others;

end solucion;
