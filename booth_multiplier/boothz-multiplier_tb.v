`timescale 1ns/1ps

module booth_multiplier_tb;
    parameter N = 4;
    reg signed [N-1:0] a, b;
    wire signed [2*N-1:0] p;

    booth_multiplier #(N) uut (a, b, p);

    initial begin
        $dumpfile("wave_booth_multiplier.vcd"); // ✅ Fixed dumpfile
        $dumpvars(0, booth_multiplier_tb);

        $monitor("a = %d, b = %d, product = %d", a, b, p);

        a = -3; b = 5; #10;
        a = 6; b = -3; #10;
        a = 7; b = 3; #10;
        a = -2; b = -2; #10;
        $finish;
    end
endmodule