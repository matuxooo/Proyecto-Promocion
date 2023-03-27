library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ffd_pkg.all;


entity top is
    port(
        clk         : in  std_logic; -- pin #94  (12 MHz)
        salida_vid  : out std_logic; -- pin #7
        sync_h      : out std_logic; -- pin #8
        sync_v      : out std_logic; -- pin #9
        led_1       : out std_logic  -- pin #1
    );
end top;

architecture arch of top is
    component sync is
    
        port(
            clk       : in std_logic;
            rst       : in std_logic;
            sync_h    : out std_logic;
            sync_v    : out std_logic;
            muestra   : out std_logic; 
            fila      : out std_logic_vector(9 downto 0);
            columna   : out std_logic_vector(9 downto 0)
        );
    end component;

     
    component clock_video_pll
        port(
            REFERENCECLK:   in  std_logic;
            PLLOUTCORE  :   out std_logic;
            PLLOUTGLOBAL:   out std_logic;
            RESET       :   in  std_logic
        );
        end component;
    component generador is
        port (
        fila_z          : in        std_logic_vector    (2 downto 0);
        columna_z       : in        std_logic_vector    (2 downto 0);
        char            : in        std_logic_vector    (63 downto 0);
        muestra         : in        std_logic;
        px_visible      : out       std_logic
        );
    end  component;

    component gen_desplazamiento is
        port(
            sync_v              :in     std_logic;
            clk                 :in     std_logic;
            rst                 :in     std_logic;
            desplazamiento      :out    std_logic_vector(3 downto 0)

    );
    end component;

    component posicion_texto is
        port (
            fila           : in    std_logic_vector     (9 downto 0);
            columna        : in    std_logic_vector     (9 downto 0);  
            muestra        : in    std_logic;      
            fila_z         : out   std_logic_vector     (2 downto 0);
            columna_Z      : out   std_logic_vector     (2 downto 0);  
            n_zona         : out   std_logic_vector     (4 downto 0);
            codigo_char    : out   std_logic_vector     (6 downto 0);
            char           : in    std_logic_vector     (63 downto 0);
            valido         : out   std_logic;
            desplazamiento : in std_logic_vector (3 downto 0)
        );
    end component;

    component tabla_caract is 
        port (  
            codigo_char     : in    std_logic_vector (6 downto 0);
            char            : out   std_logic_vector (63 downto 0)
        );
    end component;

--señales generador de caract
    signal char           :      std_logic_vector    (63 downto 0);
    signal muestra        :      std_logic;

 --señales posicion_texto
    signal fila            :    std_logic_vector    (9 downto 0);
    signal columna         :    std_logic_vector    (9 downto 0);  
    signal fila_z          :    std_logic_vector    (2 downto 0);
    signal columna_Z       :    std_logic_vector    (2 downto 0);  
    signal n_zona          :    std_logic_vector    (4 downto 0);
    signal valido          :    std_logic;
    signal desplaz  :    std_logic_vector    (3 downto 0);

--señales tabla decaract
    signal codigo_char     : std_logic_vector (6 downto 0);
    
--señales sync
    signal rst          : std_logic;
    signal clock        : std_logic;

    signal s_sync_v : std_logic;
  


begin

rst<='0';
pll: clock_video_pll
port map(
    REFERENCECLK    =>clk,   
    PLLOUTGLOBAL=> clock,
    RESET =>'1'

);

    gen_desplazamiento_1: gen_desplazamiento
    port map(
        sync_v=>s_sync_v,
        rst=>rst,
        clk=>clock,
        desplazamiento=>desplaz
    );
    led_1 <= desplaz(0);
    sincro: sync
    port map(
        rst     =>  rst    ,
        clk     =>  clock  ,
        sync_v  =>  s_sync_v ,
        sync_h  =>  sync_h ,
        muestra =>  muestra,
        fila    =>  fila   ,
        columna =>  columna
    );
    sync_v <= s_sync_v;
    gen: generador
    port map(
        fila_z      =>  fila_z    ,
        columna_z   =>  columna_z ,
        char        =>  char      ,
        muestra     =>  muestra   ,
        px_visible  =>  salida_vid
    );
 
    pos_txt: posicion_texto
    port map(
        fila        =>   fila       ,
        columna     =>   columna    ,
        muestra     =>   muestra    ,
        fila_z      =>   fila_z     ,
        columna_Z   =>   columna_Z  ,
        n_zona      =>   n_zona     ,
        codigo_char =>   codigo_char,
        char        =>   char       ,
        valido      =>   valido,
        desplazamiento =>desplaz
    );

    tabla_char: tabla_caract
    port map(
        codigo_char => codigo_char,
        char        => char       
    );



end arch;