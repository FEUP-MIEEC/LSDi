library verilog;
use verilog.vl_types.all;
entity lsdalu is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        OPR             : in     vl_logic_vector(2 downto 0);
        R               : out    vl_logic_vector(7 downto 0);
        FLAGS           : out    vl_logic_vector(3 downto 0)
    );
end lsdalu;
