library ieee;
use ieee.std_logic_1164.all;

--NO SIGNAL in the entity section it's a test
entity tb_mux5to1 is
end tb_mux5to1;

architecture behavioural of tb_mux5to1 is
--declare the componenet to be employed in this circuit
component mux5to1 is
  port(  u,v,w,x,y : in std_logic;
          s : in std_logic_vector( 2 DOWNTO 0);
                m  : out std_logic);
 end component;
  --declare the signals to be employed in this circuit
 signal inputstring :std_logic_vector( 2 DOWNTO 0); --a std_vector of 3 bits used in the forced simulation
 signal u_dut,v_dut,w_dut,x_du,y_dut : std_logic;--inputs DEVICE UNDER TEST
 signal u_ref,v_ref,w_ref,x_ref,y_ref : std_logic;-- reference inputs
 signal m_dut : std_logic; --output DEVICE UNDER TEST
 signal m_ref : std_logic; -- reference output
 begin
   --time evolution of three input signals
   inputstring <= "000","001" after 5 ns, "010" after 10 ns,"011" after 15 ns,"100" after 20 ns,"101" after 25 ns,"110" after 30 ns,"111" after 35 ns;
  --port mapping for the test
  DUT: mux5to1 port map (s=> inputstring, m=>m_dut,u=>u_dut,v=>v_dut,w=>w_dut,x=>x_du,y=>y_dut);
--reference process
WITH inputstring SELECT
m_ref<=  u_ref WHEN "000",
        v_ref  WHEN "001",
        w_ref WHEN "010",
        x_ref WHEN "011",
        y_ref WHEN OTHERS ;
end architecture;

        
        