import numpy as np

# 0000 00 00 00 00 00 00 00 00
# LUT  0x 0y 1x 1y 2x 2y 3x 3y

class Node:
    """x, y, function, input0x input0y, input1x, input1y, input2x, input2y, input3x, input3y"""
    def __init__(self, width, x, y, function, input0x=None, input0y=None, input1x=None, input1y=None, input2x=None, input2y=None, input3x=None, input3y=None):
        self.width = width
        self.x = x
        self.y = y
        self.function = function
        self.input0x = input0x
        self.input0y = input0y
        self.input1x = input1x
        self.input1y = input1y
        self.input2x = input2x
        self.input2y = input2y
        self.input3x = input3x
        self.input3y = input3y
    
    def to_verilog(self):
        def input_str(x, y):
            if self.x == 0:
                return f"in{y%4}"
            elif x < 0 or x >= self.width or y < 0 or y >= self.width:
                return "1'b0"
            else:
                return f"x{x}_y{y}"
            
        def output_str(x, y):
            if self.x == self.width - 1:
                return f"out{y%4}"
            elif x < 0 or x >= self.width or y < 0 or y >= self.width:
                return "1'b0"
            else:
                return f"x{x}_y{y}"
            
        # Adjust x coordinate based on FPGA physical layout
        adjusted_x = self.x
        if self.x < 5:
            adjusted_x = self.x + 1
        if 5 <= self.x < 18:
            adjusted_x = self.x + 2
        elif self.x >= 18:
            adjusted_x = self.x + 3
        
        return f"""
        (* keep, dont_touch *)
        (* BEL = "X{adjusted_x}/Y{int(self.y/8)+1}/lc{self.y%8}" *)
        SB_LUT4 #(
        .LUT_INIT(16'b{"{0:016b}".format(self.function)})
        ) lut_{output_str(self.x, self.y)} (
        .O({output_str(self.x, self.y)}),
        .I0({input_str(self.input0x, self.input0y)}),
        .I1({input_str(self.input1x, self.input1y)}),
        .I2({input_str(self.input2x, self.input2y)}),
        .I3({input_str(self.input3x, self.input3y)})
        );"""

    def __repr__(self):
        return self.__str__()