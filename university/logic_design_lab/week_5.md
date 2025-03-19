# 🎨 **Week 5 Logic Design Notes** ✨

---

## 🏗 **Understanding Components in Verilog**

### 🔍 What is a Component?

In Verilog, components help **modularize** complex circuits, making them reusable and easier to manage. Instead of rewriting the same logic repeatedly, we can create **components** for:

✅ **Multiplexers (MUX)**
✅ **Decoders**
✅ **Demultiplexers (DEMUX)**
✅ **Counters**
✅ **Shift Registers**
✅ **Full Adders & Half Adders**

This modular approach makes our **circuit designs cleaner, efficient, and scalable!** 🚀

---

## 🛠 **Component Mapping Techniques**

When using components, we need to define how they are connected. **Verilog supports two mapping styles:**

### 🏷 **1️⃣ Mapping by Name (Recommended 👍)**

- Uses explicit names for input/output connections.
- **Advantage:** More readable and prevents mix-ups.
- **Syntax Example:**

  ```verilog
  bottom1(.x(X), .a(A), .b(B));
  bottom2(.a(A), .b(B), .y(Y));
  ```

### 📍 **2️⃣ Mapping by Position (Tricky! 🤔)**

- Connects signals based on their position in the module declaration.
- **Disadvantage:** Easy to mess up if the order changes.
- **Syntax Example:**

  ```verilog
  bottom1 b1(A, B, X);
  bottom2 b2(A, B, Y);
  ```

---

## 🔬 **Example 1: Basic Component Mapping**

```verilog
module example(input A, B, output X, Y);
    bottom1(.x(X), .a(A), .b(B));
    bottom2(.a(A), .b(B), .y(Y));
endmodule

module bottom1(input a, b, output x);
    assign x = a & b;
endmodule

module bottom2(input a, b, output y);
    assign y = a | b;
endmodule
```

📝 **Explanation:**

- `bottom1` performs **AND** operation: `X = A & B`
- `bottom2` performs **OR** operation: `Y = A | B`
- These components are instantiated in the `example` module!

---

## 🔬 **Example 2: Using Components for Logic Operations**

```verilog
// Bottom module 1: AND logic
tmodule bottom1(i, j, f);
input i, j;
output f;
assign f = i & j;
endmodule

// Bottom module 2: OR logic
module bottom2(m, n, o);
input m, n;
output o;
assign o = m | n;
endmodule

// Main module connecting components
module main(a, b, x, y);
input a, b;
output x, y;
bottom1 b1(.i(a), .j(b), .f(x)); // AND operation
bottom2 b2(.m(a), .n(b), .o(y)); // OR operation
endmodule
```

🚀 **Key Takeaways:**

- `bottom1` and `bottom2` perform **AND** and **OR** operations, respectively.
- The `main` module instantiates both and connects the inputs/outputs.

---

## ➕ **Example 3: Full Adder Using Half Adders** 🧮

```verilog
module HalfAdder(input A, B, output S, C);
    assign S = A ^ B;  // Sum
    assign C = A & B;  // Carry
endmodule

module FullAdder(input X, Y, Z, output Sum, Carry);
    wire S1, C1, C2;

    // First Half Adder
    HalfAdder HA1(.A(X), .B(Y), .S(S1), .C(C1));

    // Second Half Adder
    HalfAdder HA2(.A(S1), .B(Z), .S(Sum), .C(C2));

    // Final Carry Output
    assign Carry = C1 | C2;
endmodule
```

🎯 **What's Happening Here?**
1️⃣ First **Half Adder (HA1)** computes `S1 = X ⊕ Y` and `C1 = X & Y`.
2️⃣ Second **Half Adder (HA2)** computes final `Sum = S1 ⊕ Z` and `C2 = S1 & Z`.
3️⃣ Carry is calculated as `Carry = C1 | C2`.

✅ **This modular approach makes designing adders simple and reusable!**
