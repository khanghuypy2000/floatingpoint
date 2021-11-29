library verilog;
use verilog.vl_types.all;
entity log2detc is
    port(
        A               : in     vl_logic_vector(23 downto 0);
        Z               : out    vl_logic_vector(4 downto 0)
    );
end log2detc;
