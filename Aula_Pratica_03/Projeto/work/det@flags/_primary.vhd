library verilog;
use verilog.vl_types.all;
entity detFlags is
    port(
        Co              : in     vl_logic;
        OPR             : in     vl_logic_vector(2 downto 0);
        R               : in     vl_logic_vector(7 downto 0);
        sA              : in     vl_logic;
        sB              : in     vl_logic;
        CARRY           : out    vl_logic;
        OVFL            : out    vl_logic;
        SINAL           : out    vl_logic;
        ZERO            : out    vl_logic
    );
end detFlags;
