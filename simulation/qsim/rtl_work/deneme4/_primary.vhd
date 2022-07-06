library verilog;
use verilog.vl_types.all;
entity deneme4 is
    generic(
        DATA_WIDTH      : integer := 8;
        ADDR_WIDTH      : integer := 20;
        DEPTH           : integer := 76800
    );
    port(
        addr            : in     vl_logic_vector;
        CLOCK_50        : in     vl_logic;
        data_in         : in     vl_logic_vector;
        write           : in     vl_logic;
        ENABLE          : in     vl_logic;
        out_data        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end deneme4;
