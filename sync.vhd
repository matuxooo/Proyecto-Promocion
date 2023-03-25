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
            muestra :out std_logic;
            fila    :out std_logic_vector(9 downto 0);
            columna :out std_logic_vector(9 downto 0)

          );
    end sync;

architecture solucion of sync is
signal cont_act_h, cont_h, cont_v, cont_act_v: std_logic_vector(9 downto 0);
 
begin
  flipflop_h: ffd
  generic map (N => 10)
            port map  (rst => rst, 
                       clk => clk, 
                       Q => cont_act_h,
                       D => cont_h);


flipflop_v: ffd
  generic map (N => 10)
            port map  (rst => rst, 
                       clk => clk, 
                       Q => cont_act_v,
                       D => cont_v);


    cont_hz: process(all)
    begin   
        cont_h <= cont_act_h;
        if (unsigned(cont_act_h) = 799)then
            cont_h <= (others => '0');
            columna <= (others => '0');
        else
            cont_h <= std_logic_vector(unsigned (cont_act_h)+1);
            end if;
            columna <= cont_act_h;
    end process;


    cont_vz: process(all)
    begin   
        cont_v <= cont_act_v;
        if(unsigned(cont_act_v) = 524 ) then
            cont_v <= (others => '0');
            fila <= (others => '0');
        elsif cont_h = "0000000000" then 
            cont_v <= std_logic_vector(unsigned (cont_act_v)+1);
                   
        end if;
        fila <= cont_act_v; 
    end process;

    data_visible: process(all)
    begin
        if((unsigned(cont_act_h) <= 639) and (unsigned(cont_act_v) >= 210) and (unsigned(cont_act_v) <= 338) )then
            muestra <= '1';
            else
                muestra <= '0';
                end if;
    end process;



    sync_h<='1' when ((unsigned(cont_act_h) >= 656) and (unsigned(cont_act_h) <= 751)) else '0';
    sync_v<='1' when ((unsigned(cont_act_v) >= 490) and (unsigned(cont_act_v) <= 491)) else '0';
    --muestra<='1' when(sync_h = '0' and sync_v ='0') else '0';
            

    end solucion;
        
-- columna visible <= 639
-- 111 >= fila visible <= 240 