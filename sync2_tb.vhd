-- Bibliotecas necesarias
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del banco de pruebas
entity tb_vga_controller is
end entity tb_vga_controller;

-- Arquitectura del banco de pruebas
architecture testbench of tb_vga_controller is
    -- Declaración de señales necesarias
    signal clk : std_logic := '0';
    signal h_sync, v_sync, blank, video_on : std_logic;
    signal red, green, blue : std_logic_vector(3 downto 0);
begin
    -- Instanciar el controlador VGA
    uut: entity work.vga_controller
        port map (
            clk => clk,
            h_sync => h_sync,
            v_sync => v_sync,
            blank => blank,
            video_on => video_on,
            red => red,
            green => green,
            blue => blue
        );

    -- Generar señal de reloj
    clk_process: process
    begin
        while true loop
            clk <= not clk;
            wait for 10 ns;
        end loop;
    end process;

    -- Generar señal de sincronización horizontal
    h_sync_process: process
    begin
        h_sync <= '0';
        wait for 100 ns;
        h_sync <= '1';
        wait for 10 ns;
        h_sync <= '0';
        wait for 100 ns;
    end process;

    -- Generar señal de sincronización vertical
    v_sync_process: process
    begin
        v_sync <= '0';
        wait for 10000 ns;
        v_sync <= '1';
        wait for 2 ns;
        v_sync <= '0';
        wait for 500000 ns;
    end process;

end architecture testbench;
