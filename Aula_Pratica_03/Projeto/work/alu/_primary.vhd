library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        OPR             : in     vl_logic_vector(2 downto 0);
        R               : out    vl_logic_vector(7 downto 0);
        Co              : out    vl_logic
    );
end alu;
