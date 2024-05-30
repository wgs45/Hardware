// Question: Please find the incentive table according to the following table (JK Latch).
// Simplified Karnaugh map. Circuit diagram. Program code

// Define the JK flip-flop module for completeness (assuming active high reset and clock)
module JKFF (
    input J,
    input K,
    input clk,
    output reg q
);
    always @(posedge clk) begin
        if (J == 1'b0 && K == 1'b0) begin
            q <= q; // No change
        end else if (J == 1'b0 && K == 1'b1) begin
            q <= 1'b0; // Reset
        end else if (J == 1'b1 && K == 1'b0) begin
            q <= 1'b1; // Set
        end else if (J == 1'b1 && K == 1'b1) begin
            q <= ~q; // Toggle
        end
    end
endmodule

// Define the JK counter module
module jk_counter (
    output A,  // Output bit A
    output B,  // Output bit B
    output C,  // Output bit C
    input clk  // Clock input
);

    // Instantiate the first JK flip-flop for output A
    // The J and K inputs are controlled by (~B) | C and (~B) | (~C) respectively
    JKFF JKFF_A (
        .J((~B) | C),   // J input for JKFF_A
        .K((~B) | (~C)), // K input for JKFF_A
        .clk(clk),      // Clock input for JKFF_A
        .q(A)           // Output A
    );

    // Instantiate the second JK flip-flop for output B
    // The J and K inputs are controlled by C and ~A respectively
    JKFF JKFF_B (
        .J(C),          // J input for JKFF_B
        .K(~A),         // K input for JKFF_B
        .clk(clk),      // Clock input for JKFF_B
        .q(B)           // Output B
    );

    // Instantiate the third JK flip-flop for output C
    // The J and K inputs are controlled by (~A) | B and A | B respectively
    JKFF JKFF_C (
        .J((~A) | B),   // J input for JKFF_C
        .K(A | B),      // K input for JKFF_C
        .clk(clk),      // Clock input for JKFF_C
        .q(C)           // Output C
    );

endmodule

