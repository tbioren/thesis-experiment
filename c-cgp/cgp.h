#include <stdint.h>

#define YOSYS_COMMAND { "yosys","-p","read_verilog -; hierarchy -top cgp_module; write_json -;",NULL};
#define NEXTPNR_COMMAND "nextpnr-ice40 --up5k --json design.json --asc out.asc"

#define GENES_PER_INDIVIDUAL 100
#define BUFFER_SIZE (1 << 16)

const int RAM_COLUMNS[2] = {6, 19};

typedef struct {
    uint16_t lut;
    int8_t input0_x;
    int8_t input0_y;
    int8_t input1_x;
    int8_t input1_y;
    int8_t input2_x;
    int8_t input2_y;
    int8_t input3_x;
    int8_t input3_y;
} gene;