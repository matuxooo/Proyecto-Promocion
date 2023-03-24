library IEEE;
use IEEE.std_logic_1164.all;
use work.ffd_pkg.all;
use IEEE.numeric_std.all;



architecture solucion of conex is
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

    



end;