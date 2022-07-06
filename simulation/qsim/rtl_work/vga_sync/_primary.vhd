library verilog;
use verilog.vl_types.all;
entity vga_sync is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        video_on        : out    vl_logic;
        \CLK\           : out    vl_logic;
        x               : out    vl_logic_vector(9 downto 0);
        y               : out    vl_logic_vector(9 downto 0)
    );
end vga_sync;
