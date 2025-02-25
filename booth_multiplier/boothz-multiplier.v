module booth_multiplier #(parameter N = 4) (
    input signed [N-1:0] multiplicand,
    input signed [N-1:0] multiplier,
    output reg signed [2*N-1:0] product
);

    reg signed [2*N:0] partial_product;
    integer i;

    always @(*) begin
        // Initialize Booth Register
        partial_product = { {N{multiplicand[N-1]}}, multiplicand, 1'b0 }; 
        
        for (i = 0; i < N; i = i + 1) begin
            case ({multiplier[i], partial_product[0]})
                2'b01: partial_product = partial_product + {multiplicand, {N+1{1'b0}}}; // ✅ Fixed
                2'b10: partial_product = partial_product - {multiplicand, {N+1{1'b0}}}; // ✅ Fixed
            endcase
            partial_product = partial_product >>> 1; // Arithmetic right shift
        end

        // Store Final Output
        product = partial_product[2*N-1:0];
    end
endmodule