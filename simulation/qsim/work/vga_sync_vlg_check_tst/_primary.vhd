library verilog;
use verilog.vl_types.all;
entity vga_sync_vlg_check_tst is
    port(
        CLK             : in     vl_logic;
        hsync           : in     vl_logic;
        video_on        : in     vl_logic;
        vsync           : in     vl_logic;
        x               : in     vl_logic_vector(9 downto 0);
        y               : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end vga_sync_vlg_check_tst;
