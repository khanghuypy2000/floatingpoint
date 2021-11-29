library verilog;
use verilog.vl_types.all;
entity add48b is
    port(
        X               : in     vl_logic_vector(47 downto 0);
        Y               : in     vl_logic_vector(47 downto 0);
        C               : in     vl_logic;
        S               : out    vl_logic_vector(48 downto 0)
    );
end add48b;
