library verilog;
use verilog.vl_types.all;
entity fadder is
    port(
        xi              : in     vl_logic;
        yi              : in     vl_logic;
        cin             : in     vl_logic;
        s               : out    vl_logic;
        cout            : out    vl_logic
    );
end fadder;
