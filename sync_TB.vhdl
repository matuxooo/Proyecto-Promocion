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

            syncv   :out std_logic;
            synch   :out std_logic;
            fila    :out std_logic_vector(9 downto 0);
            columna :out std_logic_vector(9 downto 0);
            muestra :out std_logic;

          );
    end component;

    
begin

        