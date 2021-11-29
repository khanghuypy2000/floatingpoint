library verilog;
use verilog.vl_types.all;
entity normalizeExpo is
    port(
        num             : in     vl_logic_vector(4 downto 0);
        expo            : in     vl_logic_vector(8 downto 0);
        newexp          : out    vl_logic_vector(8 downto 0)
    );
end normalizeExpo;
