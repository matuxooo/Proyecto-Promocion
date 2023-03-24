library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ffd_pkg.all;


entity top is
    port(
        clk         : in  std_logic; -- pin #94  (12 MHz)
        salida_vid  : out std_logic; -- pin #7
        sinc_h      : out std_logic; -- pin #8
        sinc_v      : out std_logic; -- pin #9
        led_1       : out std_logic  -- pin #1
    );
end top;

architecture arch of top is
    component sync is
    
        port(
            clk       : in std_logic;
            rst       : in std_logic;
            
                             
            sinc_h    : out std_logic;
            sinc_v    : out std_logic;
            muestra   : out std_logic; 
            fila      : out std_logic_vector(9 downto 0);
            columna   : out std_logic_vector(9 downto 0)
        );
    end component;

    component generador is
        port (
        fila_z          : in        std_logic_vector    (2 downto 0);
        columna_z       : in        std_logic_vector    (2 downto 0);
        char            : in        std_logic_vector    (63 downto 0);
        muestra         : in std_logic;
        --n_zona      : in std_logic_vector (4 downto 0);
        px_visible      : out       std_logic
        );
    end  component;

    component posicion_texto is
        port (
            fila           : in    std_logic_vector    (9 downto 0);
            columna        : in    std_logic_vector    (9 downto 0);  
            muestra        : in    std_logic;      
            fila_z         : out    std_logic_vector    (2 downto 0);
            columna_Z      : out    std_logic_vector    (2 downto 0);  
            n_zona         : out   std_logic_vector    (4 downto 0);
            codigo_char    : out std_logic_vector (6 downto 0);
            char           : in std_logic_vector (63 downto 0);
            valido         : out   std_logic
        );
    end component;

    component tabla_caract is 
        port (  
            codigo_char     : in std_logic_vector (6 downto 0);
            char            : out std_logic_vector (63 downto 0)
        );
    end component;


    signal
