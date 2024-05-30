// Question: Please follow the picture below to make a decimal to binary encoder.

module encoder(D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, A);
    // Declare the inputs and outputs
    input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    output reg [3:0] A;
    
    // Always block triggered on changes to any of the inputs
    always @(D0 or D1 or D2 or D3 or D4 or D5 or D6 or D7 or D8 or D9)
    begin
        // Case statement to assign the appropriate binary code to A
        case ({D0, D1, D2, D3, D4, D5, D6, D7, D8, D9})
            10'b1000000000: A = 4'b0000; // D0 is active
            10'b0100000000: A = 4'b0001; // D1 is active
            10'b0010000000: A = 4'b0010; // D2 is active
            10'b0001000000: A = 4'b0011; // D3 is active
            10'b0000100000: A = 4'b0100; // D4 is active
            10'b0000010000: A = 4'b0101; // D5 is active
            10'b0000001000: A = 4'b0110; // D6 is active
            10'b0000000100: A = 4'b0111; // D7 is active
            10'b0000000010: A = 4'b1000; // D8 is active
            10'b0000000001: A = 4'b1001; // D9 is active
            default: A = 4'bxxxx;  // Undefined state for safety
        endcase
    end
endmodule


// Testbench to verify the encoder module
module testbench;
    reg D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    wire [3:0] A;
    
    // Instantiate the encoder module
    encoder uut (
        .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4),
        .D5(D5), .D6(D6), .D7(D7), .D8(D8), .D9(D9),
        .A(A)
    );
    
    initial begin
        // Initialize inputs
        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000000;
        
        // Apply test vectors
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b1000000000; // 0
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0100000000; // 1
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0010000000; // 2
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0001000000; // 3
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000100000; // 4
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000010000; // 5
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000001000; // 6
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000100; // 7
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000010; // 8
        #10 {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000001; // 9
        #10 $finish;
    end
    
    initial begin
        $monitor("At time %t, D = %b%b%b%b%b%b%b%b%b%b -> A = %b", 
                 $time, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, A);
    end
endmodule

