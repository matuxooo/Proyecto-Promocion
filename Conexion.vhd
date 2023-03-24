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
    )