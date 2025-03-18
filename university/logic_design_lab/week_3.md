# 🎨 Week 3 Logic Design Notes ✨

---

## **Basic Architecture in VerilogHDL** 🛠️

### Module Structure

In VerilogHDL, the structure of a basic module consists of the module declaration, pin list, and the body where logic components are defined.

```verilog
module module_name (pin_list); // Module declaration
// Declare wires, registers, and logic
endmodule
```

### Common Declarations

- **Input signals** are declared using `input`.
- **Output signals** are declared using `output`.
- **Registers** are declared with `reg`.
- **Wires** are declared with `wire`.

### Example of Comments

- Comments can span multiple lines using `/* */` or be placed on a single line using `//`. This helps in making the code more readable and maintainable.

  - Example:

    ```verilog
    // This is a single-line comment
    /* This is a
       multi-line comment */
    ```

### Naming Rules

- Identifiers are case-sensitive.
- The identifier cannot start with a number.
- Alphanumeric characters and underscores (`_`) are allowed.

---

## **Types of Variables in Verilog** 📝

### **Wire**

- Used to connect signals outside `begin ... end` blocks.
- Must be paired with an `assign` statement.
- Example:

  ```verilog
  wire a, b, c;
  assign c = a & b;
  ```

### **Register (`reg`)**

- Used within `begin ... end` blocks.
- Example:

  ```verilog
  reg d;
  always @(a or b)
  begin
      d = a & b;
  end
  ```

---

## **Radix Representation** 🔢

In VerilogHDL, numbers can be written in different bases. Here are examples of a **4-bit** number represented in various formats:

- **Decimal**: `4'd10`
- **Hexadecimal**: `4'ha`
- **Octal**: `4'o12`
- **Binary**: `4'b1010`

These are useful for expressing numbers in the form that best matches the design and makes the code more readable.

---

## **Description Styles in Verilog** 🎨

### **1. Gate-Level Description** 🔲

Describes circuits using basic logic gates like `not`, `and`, `or`, `nand`, `nor`, `xor`, etc.

- **Example**:

  ```verilog
  module and_2 (in1, in2, out);
  input in1, in2;
  output out;
  and a1 (out, in1, in2);
  endmodule
  ```

### **2. Data Flow Description** ⚙️

Describes the circuit using assignments (`assign`) and bitwise operations. This is typically used to represent combinational logic.

- **Example**:

  ```verilog
  module and_2(in1, in2, out);
  input in1, in2;
  output out;
  assign out = in1 & in2;
  endmodule
  ```

### **3. Behavioral Description** 🧠

This style focuses on the behavior of the circuit rather than its structure. It uses high-level constructs like `if`, `case`, and `always`. This is closest to the way C code operates, but is abstracted from the actual hardware implementation.

- **Example**:

  ```verilog
  always @(posedge clk)
  begin
      if (reset) out = 0;
      else out = in1 & in2;
  end
  ```

### **Gate-Level vs. Data Flow vs. Behavioral**

- **Gate-level** is the most detailed and closest to the hardware.
- **Data flow** abstracts the hardware while describing logical relationships using assignments.
- **Behavioral** is the most abstract, focusing on the overall functionality.

---

## **Example Code** 🔧

### 1. **Logic Gate-Level Design**

```verilog
module abc(A, B, C, F);
    input A, B, C;
    output F;
    wire D, E;
    and a1 (D, A, B);    // AND gate
    not n1 (E, C);       // NOT gate
    or o1 (F, D, E);     // OR gate
endmodule
```

This example demonstrates the basic logic gate-level design using `and`, `not`, and `or` gates.

### 2. **Data Flow-Level Design**

```verilog
module abc(A, B, C, F);
    input A, B, C;
    output F;
    wire D, E;
    assign D = A & B;    // AND operation
    assign E = ~C;       // NOT operation
    assign F = D | E;    // OR operation
endmodule
```

This example uses `assign` to describe the logical flow of the circuit, making it more compact than the gate-level version.
