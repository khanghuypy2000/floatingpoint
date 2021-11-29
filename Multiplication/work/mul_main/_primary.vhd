library verilog;
use verilog.vl_types.all;
entity mul_main is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        m               : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic;
        underflow       : out    vl_logic
    );
end mul_main;
