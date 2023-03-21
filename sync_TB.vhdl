library IEEE;
use IEEE.std_logic_1164.all;
use std.env.finish;

entity sync_TB is
    end sync_TB;

architecture TB of sync_TB is


    component Sync is
        port(
            rst     :in std_logic;
            clk     :in std_logic;

            sync_v   :out std_logic;
            sync_h   :out std_logic;
            fila    :out std_logic_vector(9 downto 0);
            columna :out std_logic_vector(9 downto 0);
            muestra :out std_logic

          );
    end component;

    signal clk_in:              std_logic;
    signal rst_in:              std_logic;
    signal syncv_out:           std_logic;
    signal synch_out:           std_logic;
    signal fila_out:            std_logic_vector(9 downto 0);
    signal columna_out:         std_logic_vector(9 downto 0);
    signal muestra_out:         std_logic;

begin
    DUT: sync port map(
            rst    =>   rst_in, 
            clk    =>   clk_in,
            sync_v  =>   syncv_out,
            sync_h  =>   synch_out,
            fila   =>   fila_out,
            columna=>   columna_out,
            muestra=>   muestra_out

    );

reloj: process
begin
    clk_in <= '0';
    wait for 20 ns;
    clk_in <= '1';
    wait for 20 ns;
end process;

reset: process
begin
    rst_in <='1';
    wait for 20 ns;
    rst_in <='0';
    wait for 17 ms;
finish;
end process;
end TB;