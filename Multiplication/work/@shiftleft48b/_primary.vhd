library verilog;
use verilog.vl_types.all;
entity Shiftleft48b is
    port(
        a               : in     vl_logic_vector(47 downto 0);
        b               : out    vl_logic_vector(47 downto 0);
        num             : in     vl_logic_vector(4 downto 0)
    );
end Shiftleft48b;
