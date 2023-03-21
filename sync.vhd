library IEEE;
use IEEE.std_logic_1164.all;
use work.ffd_pkg.all;
use IEEE.numeric_std.all;

entity sync is
 port(
            rst     :in std_logic;
            clk     :in std_logic;

            sync_v   :out std_logic;
            sync_h   :out std_logic;
            fila    :out std_logic_vector(9 downto 0);
            columna :out std_logic_vector(9 downto 0);
            muestra :out std_logic

          );
    end sync;

architecture solucion of sync is
signal cont_act, cont_h, cont_v, cont_act_v: std_logic_vector(9 downto 0);
 
begin
  flipflop_h: ffd
  generic map (N => 10)
            port map  (rst => rst, 
                       clk => clk, 
                       Q => cont_act,
                       D => cont_h);


flipflop_v: ffd
  generic map (N => 10)
            port map  (rst => rst, 
                       clk => clk, 
                       Q => cont_act_v,
                       D => cont_v);


    cont_hz: process(clk,rst,cont_act)
    begin   
    cont_h<= cont_act;
    if(rst='1') then
        cont_h <= (others => '0');
    elsif(clk'event and clk='1')then
        if(cont_act = "1100011111")then
            cont_h <= (others => '0');
        else
            cont_h <= std_logic_vector(unsigned (cont_act)+1);
        end if;
    end if;
    end process;


    cont_vz: process(cont_act,rst,cont_act_v)
    begin   
    cont_v<= cont_act_v;
    if(rst='1') then
        cont_v <= (others => '0');
        elsif(cont_act = "1100011111")then
            cont_v <= std_logic_vector(unsigned (cont_act_v)+1);
            elsif(cont_act_v= "1000001100") then
                cont_v <= (others => '0');
            
        
    end if;
    end process;



    sync_h<='1' when cont_act<="1010111111"else '0';
    sync_v<='1' when cont_act_v <= "1000001010" else '0';
    muestra<='1' when cont_act<="1010111111" and cont_act_v <= "1000001010"else '0';



 -- Generar señal de sincronización horizontal
 --   sincro_h: process(clk)
 --   begin
 --       h_sync <= '0';
 --       wait for 3.81 us;
 --       h_sync <= '1';
 --       wait for 27.96 ms;
 --   end process;
--
 --   -- Generar señal de sincronización vertical
 --   sincro_v: process(clk)
 --   begin
 --       v_sync <= '0';
 --       wait for 0.06 ms;
 --       v_sync <= '1';
 --       wait for 16.62 ns;
 --   end process;


    end solucion;
        