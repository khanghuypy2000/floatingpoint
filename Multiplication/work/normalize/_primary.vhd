library verilog;
use verilog.vl_types.all;
entity normalize is
    port(
        X               : in     vl_logic_vector(23 downto 0);
        Y               : out    vl_logic_vector(4 downto 0)
    );
end normalize;
