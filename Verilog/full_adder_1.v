// Question: Write a three-dimensional adder in component mode

// Full adder module for single-bit addition with carry-in and carry-out
module full_adder_1(Ci, A, B, Sm, Cy);
    input Ci, A, B;  // Inputs: Carry-in (Ci), Bits to be added (A, B)
    output Sm, Cy;   // Outputs: Sum (Sm), Carry-out (Cy)

    // Sum calculation using XOR gate
    assign Sm = A ^ B ^ Ci;
    
    // Carry-out calculation using AND and OR gates
    assign Cy = (A & B) | (A & Ci) | (B & Ci);
endmodule

// 3-bit full adder module using the single-bit full adder module
module full_adder_2(A, B, S, Cout);
    input [2:0] A, B;  // 3-bit inputs: A, B
    output [2:0] S;    // 3-bit output: Sum (S)
    output Cout;       // Output: Carry-out of the most significant bit
    wire s1, s2;       // Intermediate carry wires

    // Instantiate the first full adder with carry-in set to 0 (1-bit constant)
    full_adder_1 F1(1'b0, A[0], B[0], S[0], s1);
    
    // Instantiate the second full adder with carry-in from the first adder
    full_adder_1 F2(s1, A[1], B[1], S[1], s2);
    
    // Instantiate the third full adder with carry-in from the second adder
    full_adder_1 F3(s2, A[2], B[2], S[2], Cout);
endmodule

// Testbench for the 3-bit full adder
module testbench;
    reg [2:0] A, B;     // Test inputs
    wire [2:0] S;       // Test output for sum
    wire Cout;          // Test output for carry-out

    // Instantiate the 3-bit full adder
    full_adder_2 FA2(A, B, S, Cout);

    initial begin
        // Test vectors
        A = 3'b000; B = 3'b000;
        #10; A = 3'b001; B = 3'b001;
        #10; A = 3'b010; B = 3'b011;
        #10; A = 3'b100; B = 3'b100;
        #10; A = 3'b111; B = 3'b111;
        #10; $stop;  // Stop the simulation
    end

    initial begin
        $monitor("Time = %0t : A = %b, B = %b -> S = %b, Cout = %b", $time, A, B, S, Cout);
    end
endmodule


