library verilog;
use verilog.vl_types.all;
entity normalizeFrac is
    port(
        num             : in     vl_logic_vector(4 downto 0);
        a               : in     vl_logic_vector(23 downto 0);
        b               : out    vl_logic_vector(23 downto 0)
    );
end normalizeFrac;
