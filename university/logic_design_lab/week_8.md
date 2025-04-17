# 🎨 **Week 8 Logic Design Notes** ✨

---

## 🌐 Digital Circuit Components

- 🔍 **Comparator**
- 🔤 **Encoder**
- 🔓 **Decoder**
- 🔀 **Multiplexer (MUX)**
- 🔁 **Demultiplexer (DEMUX)**
- 🧠 **ALU (Arithmetic Logic Unit)**
- 🔢 **Counter**
- ⚙️ **Finite State Machine (FSM)**

---

## 🛠️ Design Steps

1. 🧾 Understand the problem: determine inputs & outputs
2. 🧮 Create the **truth table**
3. 🧩 Write Boolean expressions for outputs
4. 🧑‍🎨 Simplify & draw the logic diagram

---

## 🔓 Decoder

- Converts binary inputs into **one-hot outputs** (only one is HIGH).
- An **n×m decoder** maps `n` inputs to up to `2^n` outputs.

### 🎯 Example: 2-to-4 Decoder

| A1  | A0  | D3  | D2  | D1  | D0  |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 1   |
| 0   | 1   | 0   | 0   | 1   | 0   |
| 1   | 0   | 0   | 1   | 0   | 0   |
| 1   | 1   | 1   | 0   | 0   | 0   |

🧪 **Verilog Example:**

```verilog
module test(A, D);
  input [1:0] A;
  output reg [3:0] D;
  always @(A)
    case (A)
      2'b00: D = 4'b0001;
      2'b01: D = 4'b0010;
      2'b10: D = 4'b0100;
      2'b11: D = 4'b1000;
    endcase
endmodule
```

### 🧠 Using Decoder for Boolean Function

Function: `F(A,B,C) = Σ(0,1,5,7)`

- Use **3×8 Decoder** + OR gate
- Expressed as: `F = A'B'C' + A'B'C + AB'C + ABC`

---

## 🔤 Encoder

- Performs **reverse of decoder**
- Converts `2^n` lines into `n`-bit code (only one input HIGH)

### 🎯 4-to-2 Encoder

| D3  | D2  | D1  | D0  | A1  | A0  |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 1   | 0   | 0   |
| 0   | 0   | 1   | 0   | 0   | 1   |
| 0   | 1   | 0   | 0   | 1   | 0   |
| 1   | 0   | 0   | 0   | 1   | 1   |

🧪 **Verilog Example:**

```verilog
module encoder4_2 (D0, D1, D2, D3, A);
  input D0, D1, D2, D3;
  output reg [1:0] A;
  always @(*)
    case ({D3, D2, D1, D0})
      4'b0001: A = 2'b00;
      4'b0010: A = 2'b01;
      4'b0100: A = 2'b10;
      4'b1000: A = 2'b11;
    endcase
endmodule
```

---

## 🔀 Multiplexer (MUX)

- **Selects one** of many inputs via control lines.
- `2^n` inputs need `n` select lines.

🧪 **4-to-1 MUX Verilog**

```verilog
module MUL4_1(D, S, Y);
  input [3:0] D;
  input [1:0] S;
  output reg Y;
  always @(D or S)
    case(S)
      2'b00 : Y = D[0];
      2'b01 : Y = D[1];
      2'b10 : Y = D[2];
      2'b11 : Y = D[3];
    endcase
endmodule
```

---

## 🔁 Demultiplexer (DEMUX)

- **Opposite of MUX**
- Sends one input to **one of many outputs**

🧪 **Verilog Code:**

```verilog
module MUL(input D, input [1:0] S, output reg [3:0]Y);
  always @(*)
    case (S)
      2'b00: Y = {3'b000 , D};
      2'b01: Y = {2'b00 , D , 1'b0};
      2'b10: Y = {1'b0 , D, 2'b00};
      2'b11: Y = {D , 3'b000};
    endcase
endmodule
```

---

## ➕ Adder & Subtractor

Used for binary **arithmetic operations**: addition & subtraction

### 🧮 Half Adder

| X   | Y   | Carry (Cy) | Sum (S) |
| --- | --- | ---------- | ------- |
| 0   | 0   | 0          | 0       |
| 0   | 1   | 0          | 1       |
| 1   | 0   | 0          | 1       |
| 1   | 1   | 1          | 0       |

🧠 `S = X ⊕ Y`, `Cy = XY`

### 🧮 Full Adder

Inputs: A, B, Carry-in (C)
Outputs: Sum (Sm), Carry-out (Cy)

🧠 `Sm = A ⊕ B ⊕ C`
🧠 `Cy = AB + AC + BC`

---

## ➖ Subtractor

### ✂️ Half Subtractor

| X   | Y   | Difference (D) | Borrow (Bo) |
| --- | --- | -------------- | ----------- |
| 0   | 0   | 0              | 0           |
| 0   | 1   | 1              | 1           |
| 1   | 0   | 1              | 0           |
| 1   | 1   | 0              | 0           |

🧠 `D = X ⊕ Y`, `Bo = X'Y`

### ✂️ Full Subtractor

Inputs: X, Y, Borrow-in (Bi)
🧠 `D = X ⊕ Y ⊕ Bi`
🧠 `Bo = X'Y + X'Bi + YBi`
