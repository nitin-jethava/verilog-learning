# Verilog Notes

## 1. Simple AND Function
```verilog
module simpleAnd(a, b, x);
  input a, b;
  output x;
  assign x = a & b;
endmodule
```

---

## 2. Net and Register Data Types
### **Net Data Types** (Do not store values, only represent connections)
- `wire`, `wor`, `wand`, `tri`, `supply0`, `supply1`

### **Register Data Types** (Hold values until updated)
- `reg` - Widely used
- `integer` - Used for loops or counting
- `real` - Stores floating-point numbers
- `time` - Keeps track of simulation time (not used for synthesis)

*Default type is `x`*

---

## 3. Vectors (Like Arrays)
- Declared using range notation: `[range1:range2]`

### **Example:**
A 32-bit instruction register containing:
- A 6-bit opcode
- Three 5-bit register operands
- An 11-bit offset

```verilog
reg [31:0] IR;
reg [5:0] opcode;
reg [4:0] reg1, reg2, reg3;
reg [10:0] offset;

// Extracting values
opcode = IR[31:26];
reg1 = IR[25:21];
reg2 = IR[20:16];
reg3 = IR[15:11];
offset = IR[10:0];
```

---

## 4. Specifying Constant Values
Constants can be specified in **sized** or **unsized** form.

### **Syntax for Sized Form:**
`<size>'<base><number>`

### **Examples:**
```verilog
4'b0101   // 4-bit binary number: 0101
12'hABC   // 12-bit hexadecimal number: ABC
```

---

## 5. Parameters (Named Constants)
- Improve readability and maintainability
- Cannot explicitly define size (default is 32-bit)

### **Example:**
```verilog
parameter HI = 25, LO = 5;
parameter UP = 2'b00, DOWN = 2'b01, STEADY = 2'b10;
parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
```

---

## 6. Predefined Gates in Verilog
### **Syntax:**
```verilog
and G (out, in1, in2);
```
### **Supported Gates:**
- `and`, `nand`, `or`, `xor`, `xnor`, `not`, `buf`

### **Tristate Control Gates:**
```verilog
bufif1 G (out, in, ctrl);
```
- `bufif1`, `bufif0`, `notif0`, `notif1`

#### **Restrictions:**
- Output must be connected to a net
- Input ports can be nets or registers
- Single output, multiple inputs
- Optional delays for simulation (ignored by synthesis tools)

---

## 7. `timescale` Directive
Used to specify time units and precision for simulation.

### **Syntax:**
```verilog
`timescale <reference_time_unit>/<time_precision>
```

### **Example:**
```verilog
`timescale 10ns/1ns
```
- Reference time unit: **10ns**
- Simulation precision: **1ns**
- `#5` delay means **50ns**
- Time units: `s`, `ms`, `us`, `ns`, `ps`, `fs`

---

## 8. Modeling Types in Verilog
### **1. Behavioral Modeling**
- High-level, algorithmic descriptions
- Uses `always` and procedural statements

### **2. Structural Modeling**
- Represents actual hardware connections using gate primitives and modules

---

## 9. Multiplexers (MUX)
### **Behavioral Modeling - 16:1 MUX**
```verilog
module mux16to1(in, sel, out);
  input [15:0] in;
  input [3:0] sel;
  output out;
  assign out = in[sel];
endmodule
```

### **Testbench:**
```verilog
module muxtest;
  reg [15:0] A;
  reg [3:0] S;
  wire F;
  
  mux16to1 M (.in(A), .sel(S), .out(F));

  initial begin
    $dumpfile("mux16to1.vcd");
    $dumpvars(0, muxtest);
    $monitor($time, " A=%h, S=%h, F=%d", A, S, F);
    #5 A = 16'h3f0a; S = 4'h0;
    #5 S = 4'h1;
    #5 S = 4'h6;
    #5 S = 4'hc;
    #5 $finish;
  end
endmodule
```

### **Structural Modeling - 16:1 MUX Using 4:1 MUX**
```verilog
module mux4to1 (in, sel, out);
  input [3:0] in;
  input [1:0] sel;
  output out;
  assign out = in[sel];
endmodule

module mux16to1(in, sel, out);
  input [15:0] in;
  input [3:0] sel;
  output out;
  wire [3:0] t;
  
  mux4to1 M0 (in[3:0], sel[1:0], t[0]);
  mux4to1 M1 (in[7:4], sel[1:0], t[1]);
  mux4to1 M2 (in[11:8], sel[1:0], t[2]);
  mux4to1 M3 (in[15:12], sel[1:0], t[3]);
  mux4to1 M4 (t, sel[3:2], out);
endmodule
```

---

## 10. Full Adder (Behavioral & Structural)
### **4-Bit Adder (Behavioral Modeling)**
```verilog
module adder4 (S, cout, A, B, cin);
  input [3:0] A, B;
  input cin;
  output [3:0] S;
  output cout;
  assign {cout, S} = A + B + cin;
endmodule
```

### **16-Bit Adder Using 4-Bit Adder**
```verilog
adder4 A0 (Z[3:0], c[1], X[3:0], Y[3:0], 1'b1);
adder4 A1 (Z[7:4], c[2], X[7:4], Y[7:4], c[1]);
adder4 A2 (Z[11:8], c[3], X[11:8], Y[11:8], c[2]);
adder4 A3 (Z[15:12], Carry, X[15:12], Y[15:12], c[3]);
```
