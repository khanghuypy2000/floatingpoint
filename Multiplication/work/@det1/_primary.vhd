library verilog;
use verilog.vl_types.all;
entity Det1 is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : out    vl_logic;
        t               : out    vl_logic
    );
end Det1;
