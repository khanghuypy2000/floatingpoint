library verilog;
use verilog.vl_types.all;
entity Rounding is
    port(
        X               : in     vl_logic_vector(22 downto 0);
        exp             : in     vl_logic_vector(7 downto 0);
        Y               : out    vl_logic_vector(22 downto 0);
        expo            : out    vl_logic_vector(7 downto 0)
    );
end Rounding;
