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
        valido          : out   std_logic;
        desplazamiento : in std_logic_vector (3 downto 0)
    );
end posicion_texto;

architecture solucion of posicion_texto is
    type tipo_tabla is array (0 to 15) of std_logic_vector(6 downto 0);
    constant tabla_texto : tipo_tabla := (
            0 => 7x"48",
            1 => 7x"4F",
            2 => 7x"4C",
            3 => 7x"41",
            4 => 7x"00",
            5 => 7x"43",
            6 => 7x"41",
            7 => 7x"52",
            8 => 7x"4F",
            9 => 7x"21",
            others => 0);
    signal alinea : std_logic_vector (9 downto 0);

begin

    columna_z       <= columna (6 downto 4);

    alinea          <= std_logic_vector( unsigned (fila) - 211);
    
    fila_z         <=  alinea (6 downto 4);

    valido          <=  muestra; 

    --las columnas van desde el numero de bit 8 que se llama 7 
    codigo_char <=  tabla_texto(to_integer(unsigned('0'&columna (9 downto 7))+unsigned(desplazamiento)));

end solucion;
