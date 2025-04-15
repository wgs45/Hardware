# 🎨 **Week 6 Logic Design Notes** ✨

---

## 🛠️ Function in Verilog

🧩 **Syntax:**

```verilog
function name;
    // Parameter declaration
    input ...;
    begin
        // Statement block
        name = ... ; // Return value
    end
endfunction
```

🔑 **Key Points:**

1. Functions **must** return a value
2. Must have at least one **input**
3. Return value is given by assigning to the **function name**

---

## ⚡ Example: 8-bit Even Parity Generator using Functions

🎯 Design a function-based generator by calling a 4-bit even parity generator **twice**.

```verilog
module example123 (I, PARITY);
    input [7:0] I;
    output PARITY;
    reg [3:0] HIGH_BYTE, LOW_BYTE;
    reg PARITY;

    always @(I) begin
        LOW_BYTE = I[3:0];
        HIGH_BYTE = I[7:4];
        PARITY = EVEN_4(LOW_BYTE) ^ EVEN_4(HIGH_BYTE);
    end

    function EVEN_4;
        input [3:0] I;
        EVEN_4 = ^I; // XOR for even parity
    endfunction
endmodule
```

---

## ⚙️ Task in Verilog

🧩 **Syntax:**

```verilog
task name;
    // Parameter declaration (input/output)
    input ...;
    output ...;
    begin
        // Statement block
    end
endtask
```

🔑 **Key Points:**

1. Tasks **do not return** a value
2. Can have **0 or more** inputs/outputs
3. Can call other **functions/tasks**

---

## ⚡ Example: 16-bit Even Parity Generator using Tasks

```verilog
module test(I, PARITY);
    input [15:0] I;
    output PARITY;
    reg [7:0] HIGH_BYTE, LOW_BYTE;
    reg HIGH, LOW, PARITY;

    always @(I) begin
        LOW_BYTE = I[7:0];
        HIGH_BYTE = I[15:8];
        EVEN_8(LOW_BYTE, LOW);
        EVEN_8(HIGH_BYTE, HIGH);
        PARITY = HIGH ^ LOW;
    end

    task EVEN_8;
        input [7:0] I;
        output EVEN;
        EVEN = ^I;
    endtask
endmodule
```

---

## 🧮 Comparator Logic Design

### ✅ 1-Bit Comparator Truth Table

| A   | B   | Out[2] (>) | Out[1] (=) | Out[0] (<) |
| --- | --- | ---------- | ---------- | ---------- |
| 0   | 0   | 0          | 1          | 0          |
| 0   | 1   | 0          | 0          | 1          |
| 1   | 0   | 1          | 0          | 0          |
| 1   | 1   | 0          | 1          | 0          |

🔧 Logic Functions:

- Greater: `Out[2] = A & ~B`
- Equal: `Out[1] = ~(A ^ B)`
- Less: `Out[0] = ~A & B`

### ✅ 2-Bit Comparator Design

Inputs: `A[1:0], B[1:0]`

- function version:

```verilog
module 2bitcomparator(input [1:0] A, B, output [2:0] Out);

    assign Out[2] = Great(A[1], B[1]) || (Equal(A[1], B[1]) && Great(A[0], B[0])); // Greater
    assign Out[1] = Equal(A[1], B[1]) && Equal(A[0], B[0]); // Equal
    assign Out[0] = Less(A[1], B[1]) || (Equal(A[1], B[1]) && Less(A[0], B[0]));   // Less

    function Great;
        input a, b;
        begin
            Great = a & ~b;
        end
    endfunction

    function Equal;
        input a, b;
        begin
            Equal = ~(a ^ b);
        end
    endfunction

    function Less;
        input a, b;
        begin
            Less = ~a & b;
        end
    endfunction

endmodule

```

- Clean-up version:

```verilog
module 2bitcomparator(input [1:0] A, B, output [2:0] Out);

    // Out[2] = A > B
    assign Out[2] = (A > B);

    // Out[1] = A == B
    assign Out[1] = (A == B);

    // Out[0] = A < B
    assign Out[0] = (A < B);

endmodule

```

📌 Use XOR and AND/OR logic to build comparator circuits efficiently.

---

## 📦 Common Digital Components

- Comparator
- Encoder
- Decoder
- Multiplexer
- Demultiplexer
- ALU (Arithmetic Logic Unit)
- Counter
- Finite State Machine (FSM)

---

## 🧩 Logic Design Flow

1. 📖 Understand the problem & identify inputs/outputs
2. 📊 Create the truth table
3. 🧮 Write Boolean equations
4. 🛠️ Simplify and draw logic diagram

✨ Keep practicing—logic design becomes much easier with hands-on examples! 💪💡
