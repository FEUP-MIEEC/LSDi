library verilog;
use verilog.vl_types.all;
entity addsub4b is
    port(
        add_sub         : in     vl_logic;
        A3              : in     vl_logic;
        A2              : in     vl_logic;
        A1              : in     vl_logic;
        A0              : in     vl_logic;
        B3              : in     vl_logic;
        B2              : in     vl_logic;
        B1              : in     vl_logic;
        B0              : in     vl_logic;
        Co              : out    vl_logic;
        R3              : out    vl_logic;
        R2              : out    vl_logic;
        R1              : out    vl_logic;
        R0              : out    vl_logic
    );
end addsub4b;
