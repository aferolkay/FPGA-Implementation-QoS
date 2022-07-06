library verilog;
use verilog.vl_types.all;
entity F_25MHz is
    port(
        clk             : in     vl_logic;
        \CLK\           : out    vl_logic
    );
end F_25MHz;
