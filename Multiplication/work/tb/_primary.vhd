library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        DATA_WIDTH      : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end tb;
