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

--señales generador de caract
    signal fila_z         : in        std_logic_vector    (2 downto 0);
    signal columna_z      : in        std_logic_vector    (2 downto 0);
    signal char           : in        std_logic_vector    (63 downto 0);
    signal muestra        : in std_logic;
    signal px_visible     : out       std_logic

 --señales posicion_texto
    signal fila            : in    std_logic_vector    (9 downto 0);
    signal columna         : in    std_logic_vector    (9 downto 0);  
    signal  muestra        : in    std_logic;      
    signal fila_z          : out    std_logic_vector    (2 downto 0);
    signal columna_Z       : out    std_logic_vector    (2 downto 0);  
    signal n_zona          : out   std_logic_vector    (4 downto 0);
    signal codigo_char     : out std_logic_vector (6 downto 0);
    signal char            : in std_logic_vector (63 downto 0);
    signal valido          : out   std_logic

--señales tabla decaract
    signalcodigo_char     : in std_logic_vector (6 downto 0);
    char                  : out std_logic_vector (63 downto 0)

--señales sync
    signal rst     :in std_logic;
    signal clk     :in std_logic;

    signal sync_v   :out std_logic;
    signal sync_h   :out std_logic;
    signal muestra :out std_logic;
    signal fila    :out std_logic_vector(9 downto 0);
    signal columna :out std_logic_vector(9 downto 0)
--
--    signal cont_act_h   : std_logic_vector(9 downto 0);
--    signal cont_h       : std_logic_vector(9 downto 0);
--    signal cont_v       : std_logic_vector(9 downto 0);
--    signal cont_act_v   : std_logic_vector(9 downto 0);


begin

    sincro: sync
    port map(
        rst     =>  rst    ,
        clk     =>  clk    ,
        sync_v  =>  sync_v ,
        sync_h  =>  sync_h ,
        muestra =>  muestra,
        fila    =>  fila   ,
        columna =>  columna
    );

    gen: generador
    port map(
        fila_z    =>fila_z    ,
        columna_z =>columna_z ,
        char      =>char      ,
        muestra   =>muestra   ,
        px_visible=>px_visible
    );

    pos_txt: posicion_texto
    port map(
        fila       =>fila       ,
        columna    =>columna    ,
        muestra    =>muestra    ,
        fila_z     =>fila_z     ,
        columna_Z  =>columna_Z  ,
        n_zona     =>n_zona     ,
        codigo_char=>codigo_char,
        char       =>char       ,
        valido     =>valido     
    );

    tabla_char: tabla_caract
    port map(
        codigo_char => codigo_char,
        char        => char       
    );

end arch;