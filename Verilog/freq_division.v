// Question: Frequency division circuit (division by 64)

module freq_division(input clk, output divided_clk);
    // Declare a 6-bit register to act as a counter
    reg [5:0] cnt;

    // Initial block to initialize the counter to 0 at the start of simulation
    initial begin
        cnt = 0;
    end

    // Always block triggered on the positive edge of the input clock
    always @ (posedge clk) begin
        // Check if the counter has reached 63
        if (cnt == 63)
            // Reset the counter to 0 if it has reached 63
            cnt = 0;
        else
            // Increment the counter by 1
            cnt = cnt + 1;
    end

    // Assign the most significant bit of the counter to the output
    // This divides the clock frequency by 64
    assign divided_clk = cnt[5];
endmodule

