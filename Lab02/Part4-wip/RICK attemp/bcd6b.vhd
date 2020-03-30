library ieee;
use ieee.std_logic_1164.all;

entity bcd6b is
generic ( dw : positive := 5 );  -- data width
  port ( b : in std_logic_vector (6 downto 0);
         dec : out std_logic_vector (7 downto 0));
end bcd6b;

architecture behavior of bcd6b is

component LUT is
port (x :in std_logic_vector(3 downto 0);
      u: out std_logic_vector (3 downto 0));
      end component;
    signal uscita : std_logic_vector(3 downto 0);
begin

dec(dw+1)<='0';
dec(0) <= b(0);
a: for i in 0 to 2 generate
  
operation :  LUT port  map (x(3) => b(dw-i+1),x(2) => b(dw-i),x(1) => b(dw-i-1),x(0) => b(dw-i-2),u=> uscita);
dec(dw-i)<=uscita(3);
end generate;

end behavior;