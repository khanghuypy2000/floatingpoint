library verilog;
use verilog.vl_types.all;
entity add9b is
    port(
        a2              : in     vl_logic_vector(8 downto 0);
        b2              : in     vl_logic_vector(8 downto 0);
        ci2             : in     vl_logic;
        s2              : out    vl_logic_vector(8 downto 0);
        cout2           : out    vl_logic
    );
end add9b;
