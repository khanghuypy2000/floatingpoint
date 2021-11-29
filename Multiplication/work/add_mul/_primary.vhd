library verilog;
use verilog.vl_types.all;
entity add_mul is
    port(
        A               : in     vl_logic_vector(23 downto 0);
        B               : in     vl_logic_vector(23 downto 0);
        M               : out    vl_logic_vector(48 downto 0)
    );
end add_mul;
