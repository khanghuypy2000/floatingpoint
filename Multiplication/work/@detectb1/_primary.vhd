library verilog;
use verilog.vl_types.all;
entity Detectb1 is
    port(
        a               : in     vl_logic_vector(23 downto 0);
        b               : out    vl_logic_vector(23 downto 0)
    );
end Detectb1;
