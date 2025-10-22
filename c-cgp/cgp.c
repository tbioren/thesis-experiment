#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "cgp.h"
#include <unistd.h>
#include <sys/wait.h>

#define GET_INPUT_INDEX(gene_index, input_x, input_y) (gene_index + (input_y) * (int)sqrt(GENES_PER_INDIVIDUAL) + (input_x))

#define SKIP_RAM_COLUMNS(x) { \
    for(int macro_i = 0; macro_i < sizeof(RAM_COLUMNS)/sizeof(RAM_COLUMNS[0]); macro_i++) { \
        if (RAM_COLUMNS[macro_i] <= x) x++; \
    } \
}

int make_individual(gene** individual) {
    *individual = (gene*)malloc(GENES_PER_INDIVIDUAL * sizeof(gene));
    if (*individual == NULL) {
        return -1; // Memory allocation failed
    }

    for (size_t i = 0; i < GENES_PER_INDIVIDUAL; i++) {
        (*individual)[i].lut = rand() % (1 << 16); // Random LUT value between 0 and 65535
        // Random input connections (for simplicity, using indices here)
        (*individual)[i].input0_x = rand() % 5 - 2; // Example range
        (*individual)[i].input0_y = rand() % 5 - 2;
        (*individual)[i].input1_x = rand() % 5 - 2;
        (*individual)[i].input1_y = rand() % 5 - 2;
        (*individual)[i].input2_x = rand() % 5 - 2;
        (*individual)[i].input2_y = rand() % 5 - 2;
        (*individual)[i].input3_x = rand() % 5 - 2;
        (*individual)[i].input3_y = rand() % 5 - 2;
    }

    return 0; // Success
}

int individual_to_verilog(gene** individual, char* buffer, size_t buffer_size) {
    size_t offset = 0;
    int written;

    written = snprintf(buffer + offset, buffer_size - offset, "module individual (\n");
    if (written < 0 || offset + written >= buffer_size) return -1;
    offset += written;

    written = snprintf(buffer + offset, buffer_size - offset, "    (* keep *) input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9,\n");
    if (written < 0 || offset + written >= buffer_size) return -1;
    offset += written;

    written = snprintf(buffer + offset, buffer_size - offset, "    (* keep *) output out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);\n");
    if (written < 0 || offset + written >= buffer_size) return -1;
    offset += written;

    // Generate wire declarations for all LUT outputs
    const int side_length = (int)sqrt(GENES_PER_INDIVIDUAL);
    for(int i=0; i < GENES_PER_INDIVIDUAL; i++) {
        int y = i / side_length + 1;
        int x = i % side_length + 1;
        SKIP_RAM_COLUMNS(x);
        written = snprintf(buffer + offset, buffer_size - offset, "    wire x%d_y%d;\n", x, y);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;
    }
    
    written = snprintf(buffer + offset, buffer_size - offset, "\n");
    if (written < 0 || offset + written >= buffer_size) return -1;
    offset += written;

    for(int i=0; i < GENES_PER_INDIVIDUAL; i++) {
        // Physical placement on FPGA
        int y = i / side_length + 1;
        int x = i % side_length + 1;
        SKIP_RAM_COLUMNS(x);
        
        written = snprintf(buffer + offset, buffer_size - offset, "    (* keep, dont_touch *)\n");
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "    (* BEL = \"X%d/Y%d/lc%d\" *)\n", x, (y-1)/8 + 1, (y-1)%8);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "    SB_LUT4 #(\n");
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .LUT_INIT(16'b");
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;
        
        for (int j = sizeof((*individual)[i].lut) * 8 - 1; j >= 0; j--) {
            written = snprintf(buffer + offset, buffer_size - offset, "%d", ((*individual)[i].lut >> j) & 1);
            if (written < 0 || offset + written >= buffer_size) return -1;
            offset += written;
        }

        written = snprintf(buffer + offset, buffer_size - offset, ")\n");
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "    ) lut_%d (\n", i);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .O(out_%d),\n", i);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .I0(x%d_y%d),\n", x + (*individual)[i].input0_x, y + (*individual)[i].input0_y);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .I1(x%d_y%d),\n", x + (*individual)[i].input1_x, y + (*individual)[i].input1_y);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .I2(x%d_y%d),\n", x + (*individual)[i].input2_x, y + (*individual)[i].input2_y);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "        .I3(x%d_y%d)\n", x + (*individual)[i].input3_x, y + (*individual)[i].input3_y);
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;

        written = snprintf(buffer + offset, buffer_size - offset, "    );\n");
        if (written < 0 || offset + written >= buffer_size) return -1;
        offset += written;
    }

    written = snprintf(buffer + offset, buffer_size - offset, "endmodule\n");
    if (written < 0 || offset + written >= buffer_size) return -1;
    offset += written;
    
    return 0; // Success
}

int main(int argc, char* argv[]) {
    char print_yosys = 0;
    char print_nextpnr = 0;
    char print_verilog = 0;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--yosys") == 0) {
            print_yosys = 1;
        } else if (strcmp(argv[i], "--nextpnr") == 0) {
            print_nextpnr = 1;
        } else if (strcmp(argv[i], "--verilog") == 0) {
            print_verilog = 1;
        }
    }

    gene* individual = NULL;
    if (make_individual(&individual) != 0) {
        fprintf(stderr, "Failed to create individual\n");
        return 1;
    }

    char buf[BUFFER_SIZE];
    if (individual_to_verilog(&individual, buf, sizeof(buf)) != 0) {
        fprintf(stderr, "Failed to convert individual to Verilog\n");
        free(individual);
        return 1;
    }
    free(individual);

    if( print_verilog) {
        printf("%s", buf);
    }

    // // Yosys

    // int pipe_in[2];   // Parent → Yosys (stdin)
    // int pipe_out[2];  // Yosys → Parent (stdout)

    // if (pipe(pipe_in) == -1 || pipe(pipe_out) == -1) {
    //     perror("pipe");
    //     return 1;
    // }

    // pid_t pid = fork();
    // if (pid == -1) {
    //     perror("fork");
    //     return 1;
    // }

    // if (pid == 0) {
    //     // --- Child process: run Yosys ---
    //     dup2(pipe_in[0], STDIN_FILENO);   // stdin from parent
    //     dup2(pipe_out[1], STDOUT_FILENO); // stdout to parent

    //     // Optional: also capture stderr if desired
    //     dup2(pipe_out[1], STDERR_FILENO);

    //     close(pipe_in[1]);
    //     close(pipe_out[0]);
    //     close(pipe_in[0]);
    //     close(pipe_out[1]);

    //     execvp(argv[0], argv);
    //     perror("execvp");
    //     exit(1);
    // } else {
    //     // --- Parent process ---
    //     close(pipe_in[0]);  // not reading from yosys stdin
    //     close(pipe_out[1]); // not writing to yosys stdout

    //     // Send Verilog to Yosys stdin
    //     write(pipe_in[1], buf, BUFFER_SIZE);
    //     close(pipe_in[1]); // signal EOF

    //     // Read JSON output
    //     ssize_t n;
    //     printf("Yosys JSON output:\n\n");
    //     while ((n = read(pipe_out[0], buf, BUFFER_SIZE)) > 0) {
    //         buf[n] = '\0';
    //         fputs(buf, stdout);
    //     }

    //     close(pipe_out[0]);

    //     int status;
    //     waitpid(pid, &status, 0);
    //     printf("\n\nYosys exited with status %d\n", WEXITSTATUS(status));
    // }
    return 0;
}