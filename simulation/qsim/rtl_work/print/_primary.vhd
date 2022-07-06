library verilog;
use verilog.vl_types.all;
entity print is
    generic(
        Frame           : vl_logic_vector(0 to 18) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        RST             : in     vl_logic;
        R_out           : out    vl_logic_vector(7 downto 0);
        B_out           : out    vl_logic_vector(7 downto 0);
        G_out           : out    vl_logic_vector(7 downto 0);
        HS              : out    vl_logic;
        VS              : out    vl_logic;
        F25MHZ          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Frame : constant is 1;
end print;
