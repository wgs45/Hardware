# 🎨 **Week 4 Logic Design Notes** ✨

---

## **Behavioral Level Modeling in VerilogHDL** 🛠️

Behavioral modeling in Verilog allows designers to describe circuits in an **algorithmic style**, similar to high-level programming languages. It abstracts away hardware details, making it easier to define **sequential logic**.

### **The `always` Block** 🔄

- The `always` block is a key construct in behavioral modeling.
- It is **event-driven**—executing when the specified condition changes.
- It is typically used to model **sequential circuits (flip-flops, registers)** and **combinational logic**.

#### **Key Features of `always` Block**

✅ Assigns values to **reg** variables (Left-hand side must be `reg`, while right-hand side can be `net` or `reg`).  
✅ Events are **separated using "or" or a comma** in the sensitivity list.  
✅ **Triggered by event changes** (e.g., 0 → 1, 1 → 0).  
✅ Supports **edge-triggered conditions** (`posedge` for positive edge and `negedge` for negative edge).

---

## **Flip-Flop Example using `always`**

The following Verilog code demonstrates a **D Flip-Flop**, where output `Q` is assigned `D` at the **rising edge** of the clock.

```verilog
module always_d(input CLK, D, output reg Q);

always @(posedge CLK) // Trigger on positive edge
    Q = D;

endmodule
```

- **CLK** is the clock signal.
- **D** is the data input.
- **Q** is the output, stored as a `reg`.
- When `CLK` **rises from 0 to 1** (`posedge`), `Q` takes the value of `D`.

This simulates a **D-type flip-flop** used in registers and memory circuits.

---

## **Conditional Statements: `if-else`** ❓

Conditional statements (`if-else`) allow decisions based on conditions.

| S   | F   |
| --- | --- |
| 0   | A   |
| 1   | B   |

### **Verilog Code for `if-else`**

```verilog
module if_else(input A, B, S, output reg F);

always @(A or B or S) // Sensitivity list
    if(S) // If select line S is 1
        F = B;
    else // Otherwise
        F = A;

endmodule
```

- If `S = 1`, output `F = B`.
- If `S = 0`, output `F = A`.
- Used in **multiplexers (MUX)** and **decision-based circuits**.

---

## **2-to-4 Decoder** 🔢

A **decoder** converts `n`-bit inputs to `2^n`-bit outputs.  
Example: **2-bit input → 4-bit output** decoder.

| A   | B   | Y[3] | Y[2] | Y[1] | Y[0] |
| --- | --- | ---- | ---- | ---- | ---- |
| 0   | 0   | 1    | 1    | 1    | 0    |
| 0   | 1   | 1    | 1    | 0    | 1    |
| 1   | 0   | 1    | 0    | 1    | 1    |
| 1   | 1   | 0    | 1    | 1    | 1    |

### **Verilog Code for a 2-to-4 Decoder**

```verilog
module decoder2_4 (input A, B, output reg [3:0] Y);

always @(A or B)
begin
    case ({A, B}) // Combine A and B into a 2-bit vector
        2'b00: Y = 4'b1110;
        2'b01: Y = 4'b1101;
        2'b10: Y = 4'b1011;
        default: Y = 4'b0111;
    endcase
end

endmodule
```

- Uses a **`case` statement** for better readability.
- Outputs **one-hot encoding** (Only one bit is LOW at a time).
- `Y` is **4-bit output** determined by input (`A, B`).
- Can be used in **memory addressing, instruction decoding**.

---

## **Exercise 1: Combinational Logic** 📝

| A   | B   | C   | D   |
| --- | --- | --- | --- |
| 0   | 0   | 0   | 0   |
| 0   | 0   | 1   | 0   |
| 0   | 1   | 0   | 1   |
| 0   | 1   | 1   | 0   |
| 1   | 0   | 0   | 0   |
| 1   | 0   | 1   | 0   |
| 1   | 1   | 0   | 1   |
| 1   | 1   | 1   | 0   |

### **Verilog Code**

```verilog
module exercise(input A, B, C, output reg D);

always@*
case({A, B, C})
    3'b010: D = 1;
    3'b110: D = 1;
    default: D = 0;
endcase

endmodule
```

- Checks **combinations of (A, B, C)** using **case statements**.
- **Sets `D = 1` for specific conditions**, else `D = 0`.

---

## **Exercise 2: Two Implementations of a Logic Circuit** 🤔

### **Using `if-else`**

```verilog
module logic_circuit (
    input wire A, B, C,
    output reg F
);
    always @(*) begin
        if ((A & ~C) | (~B & C)) // Logic Condition
            F = 1;
        else
            F = 0;
    end
endmodule
```

- Uses **boolean expressions** inside `if` condition.
- **Readable** and **intuitive** implementation.

### **Using `case` Statement**

```verilog
module logic_circuit (
    input wire A, B, C,
    output reg F
);
    always @(*) begin
        case ({A, B, C})
            3'b001: F = 1;
            3'b100: F = 1;
            3'b101: F = 1;
            3'b110: F = 1;
            default: F = 0;
        endcase
    end
endmodule
```

- Uses **case-based lookup** for different input states.
- More structured when dealing with multiple cases.

---

## **Key Takeaways** ✅

### 🔹 **Behavioral modeling** allows event-driven execution (`always` block)

### 🔹 **`if-else` vs `case`**

- **`if-else`** is intuitive for simple conditions.
- **`case`** is better for large decision structures (e.g., decoders, state machines).

### 🔹 **Edge-triggered behavior (`posedge/negedge`)** is crucial for flip-flops and sequential circuits
