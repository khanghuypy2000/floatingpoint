library verilog;
use verilog.vl_types.all;
entity add5b is
    port(
        a2              : in     vl_logic_vector(4 downto 0);
        b2              : in     vl_logic_vector(4 downto 0);
        ci2             : in     vl_logic;
        s2              : out    vl_logic_vector(4 downto 0);
        cout2           : out    vl_logic
    );
end add5b;
