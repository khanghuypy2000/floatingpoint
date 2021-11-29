library verilog;
use verilog.vl_types.all;
entity checkinf is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(22 downto 0);
        f               : out    vl_logic_vector(1 downto 0)
    );
end checkinf;
