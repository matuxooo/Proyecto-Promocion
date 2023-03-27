library IEEE;
use IEEE.std_logic_1164.all;
use work.ffd_pkg.all;
use IEEE.numeric_std.all;

entity gen_desplazamiento is
    port(
        sync_v              :in     std_logic;
        clk                 :in     std_logic;
        rst                 :in     std_logic;
        desplazamiento      :out    std_logic_vector(3 downto 0)
    );
end gen_desplazamiento;

architecture solucion of gen_desplazamiento is
    signal  cont_desp,cont_desp_sig : std_logic_vector(3 downto 0);--="0000";
    signal  div_60, div_60_sig :std_logic_vector(5 downto 0);
    signal  r_sync_v,r_sync_v_sig : std_logic_vector(0 downto 0);
    signal hab_conteo,hab_cont_desp : std_logic;
    begin

    reg_cont_desp: ffd
    generic map (N=> cont_desp'length)
        port map (rst=>rst,
                clk=> clk,
                Q => cont_desp,
                D => cont_desp_sig 
    );
    reg_div_60: ffd
    generic map (N=>div_60'length)
        port map (rst=>rst,
                clk=> clk,
                Q => div_60,
                D => div_60_sig 
    );
    reg_det_f: ffd
    generic map (N=>r_sync_v'length)
        port map (rst=>rst,
                clk=> clk,
                Q => r_sync_v,
                D => r_sync_v_sig 
    );


    r_sync_v_sig <= (0=>sync_v);
    hab_conteo <= r_sync_v(0) and not r_sync_v_sig(0);

    div_60_sig <= div_60 when hab_conteo = '0' else
                  6x"00" when unsigned(div_60) >= 30 else 
                  std_logic_vector(unsigned(div_60)+1);
    hab_cont_desp <= '1' when hab_conteo = '1' and unsigned(div_60) = 0 else '0';   
    cont_desp_sig <= cont_desp when hab_cont_desp = '0' else
                std_logic_vector(unsigned(cont_desp)+1);
    
    desplazamiento <= cont_desp;
     

    end solucion;
