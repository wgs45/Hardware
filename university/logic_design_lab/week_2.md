# 🎨 Week 2 Logic Design Notes ✨

---

## 🔵 AND Gate (⋅)

- **Symbol:** `A ⋅ B` or `AB`
- **Function:** Outputs `1` only if **both** inputs are `1`
- **Boolean Expression:** `A ⋅ B`

**Verilog Code:**

```verilog
module and_gate (input A, input B, output Y);
    assign Y = A & B;
endmodule
```

### 📝 Truth Table

|  A  |  B  | A ⋅ B |
| :-: | :-: | :---: |
|  0  |  0  |   0   |
|  0  |  1  |   0   |
|  1  |  0  |   0   |
|  1  |  1  |   1   |

### 🔍 Visualization

```
    A ─┬──
        | AND ➝ Output
    B ─┴──
```

---

## 🔴 OR Gate (+)

- **Symbol:** `A + B`
- **Function:** Outputs `1` if **at least one** input is `1`
- **Boolean Expression:** `A + B`

**Verilog Code:**

```verilog
module or_gate (input A, input B, output Y);
    assign Y = A | B;
endmodule
```

### 📝 Truth Table

|  A  |  B  | A + B |
| :-: | :-: | :---: |
|  0  |  0  |   0   |
|  0  |  1  |   1   |
|  1  |  0  |   1   |
|  1  |  1  |   1   |

### 🔍 Visualization

```
    A ─┬──
        | OR ➝ Output
    B ─┴──
```

---

## ⚫ NOT Gate (¬)

- **Symbol:** `¬A` or `A'`
- **Function:** **Inverts** the input (`0` → `1`, `1` → `0`)
- **Boolean Expression:** `¬A`

**Verilog Code:**

```verilog
module not_gate (input A, output Y);
    assign Y = ~A;
endmodule
```

### 📝 Truth Table

|  A  | ¬A  |
| :-: | :-: |
|  0  |  1  |
|  1  |  0  |

### 🔍 Visualization

```
    A ─⊲| NOT |
            ➝ Output
```

---

## 🟡 NAND Gate (⊼)

- **Symbol:** `A ⋅ B` **negated**
- **Function:** Outputs `0` only if **both** inputs are `1`
- **Boolean Expression:** `¬(A ⋅ B)`

**Verilog Code:**

```verilog
module nand_gate (input A, input B, output Y);
    assign Y = ~(A & B);
endmodule
```

### 📝 Truth Table

|  A  |  B  | ¬(A ⋅ B) |
| :-: | :-: | :------: |
|  0  |  0  |    1     |
|  0  |  1  |    1     |
|  1  |  0  |    1     |
|  1  |  1  |    0     |

### 🔍 Visualization

```
    A ─┬──
        | AND ➝ NOT ➝ Output
    B ─┴──
```

---

## 🟢 NOR Gate (⊽)

- **Symbol:** `A + B` **negated**
- **Function:** Outputs `1` only if **both** inputs are `0`
- **Boolean Expression:** `¬(A + B)`

**Verilog Code:**

```verilog
module nor_gate (input A, input B, output Y);
    assign Y = ~(A | B);
endmodule
```

### 📝 Truth Table

|  A  |  B  | ¬(A + B) |
| :-: | :-: | :------: |
|  0  |  0  |    1     |
|  0  |  1  |    0     |
|  1  |  0  |    0     |
|  1  |  1  |    0     |

### 🔍 Visualization

```
    A ─┬──
        | OR ➝ NOT ➝ Output
    B ─┴──
```

---

## 🟣 XOR Gate (⊕)

- **Symbol:** `A ⊕ B`
- **Function:** Outputs `1` if **inputs are different**
- **Boolean Expression:** `A ⊕ B = (A ⋅ ¬B) + (¬A ⋅ B)`

**Verilog Code:**

```verilog
module xor_gate (input A, input B, output Y);
    assign Y = A ^ B;
endmodule
```

### 📝 Truth Table

|  A  |  B  | A ⊕ B |
| :-: | :-: | :---: |
|  0  |  0  |   0   |
|  0  |  1  |   1   |
|  1  |  0  |   1   |
|  1  |  1  |   0   |

### 🔍 Visualization

```
    A ─┬──
        | XOR ➝ Output
    B ─┴──
```

---

## 🌟 Summary Cheat Sheet 📝

| Gate | Symbol | Function                            |
| ---- | ------ | ----------------------------------- |
| AND  | `⋅`    | Outputs `1` if both inputs are `1`  |
| OR   | `+`    | Outputs `1` if at least one is `1`  |
| NOT  | `¬`    | Inverts the input                   |
| NAND | `⊼`    | Opposite of AND                     |
| NOR  | `⊽`    | Opposite of OR                      |
| XOR  | `⊕`    | Outputs `1` if inputs are different |

---
