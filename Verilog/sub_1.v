// Question: Write a three-dimensional subtractor in component mode

// Single-bit subtractor module with borrow-in (bi) and borrow-out (bo)
module sub_1(bi, x, y, d, bo);
    input bi, x, y;  // Inputs: Borrow-in (bi), Minuend (x), Subtrahend (y)
    output d, bo;    // Outputs: Difference (d), Borrow-out (bo)

    // Difference calculation
    assign d = x ^ y ^ bi;
    
    // Borrow-out calculation
    assign bo = (~x & (y | bi)) | (y & bi);
endmodule

// 3-bit subtractor module using the single-bit subtractor module
module full_sub_3(A, B, S, Bout);
    input [2:0] A, B;  // 3-bit inputs: A, B
    output [2:0] S;    // 3-bit output: Difference (S)
    output Bout;       // Output: Borrow-out of the most significant bit
    wire d1, d2;       // Intermediate borrow wires

    // Instantiate the first single-bit subtractor with borrow-in set to 0
    sub_1 s1(1'b0, A[0], B[0], S[0], d1);
    
    // Instantiate the second single-bit subtractor with borrow-in from the first subtractor
    sub_1 s2(d1, A[1], B[1], S[1], d2);
    
    // Instantiate the third single-bit subtractor with borrow-in from the second subtractor
    sub_1 s3(d2, A[2], B[2], S[2], Bout);
endmodule

// Testbench for the 3-bit subtractor
module testbench;
    reg [2:0] A, B;     // Test inputs
    wire [2:0] S;       // Test output for difference
    wire Bout;          // Test output for borrow-out

    // Instantiate the 3-bit subtractor
    full_sub_3 FS3(A, B, S, Bout);

    initial begin
        // Test vectors
        A = 3'b000; B = 3'b000; #10;
        A = 3'b001; B = 3'b001; #10;
        A = 3'b010; B = 3'b011; #10;
        A = 3'b100; B = 3'b001; #10;
        A = 3'b111; B = 3'b010; #10;
        A = 3'b011; B = 3'b100; #10;
        A = 3'b101; B = 3'b110; #10;
        $stop;  // Stop the simulation
    end

    initial begin
        $monitor("Time = %0t : A = %b, B = %b -> S = %b, Bout = %b", $time, A, B, S, Bout);
    end
endmodule

