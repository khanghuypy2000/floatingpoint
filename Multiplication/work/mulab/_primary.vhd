library verilog;
use verilog.vl_types.all;
entity mulab is
    port(
        x               : in     vl_logic_vector(23 downto 0);
        y               : in     vl_logic;
        fo              : out    vl_logic_vector(47 downto 0)
    );
end mulab;
