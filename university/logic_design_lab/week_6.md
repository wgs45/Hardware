# 📘 **MySQL Syntax - Week 6** 🍃

---

## 🔍 **LIKE** Operator

LIKE is used in the **WHERE clause** to compare strings using pattern matching.

```sql
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
```

### 🎯 **Wildcard Characters:**

- `%` → matches **0, 1, or more characters** (anything)
- `_` → matches **exactly 1 character**

### 🧪 **Examples:**

| Pattern  | Meaning                                         |
| -------- | ----------------------------------------------- |
| `'a%'`   | Starts with "a"                                 |
| `'%a'`   | Ends with "a"                                   |
| `'%a%'`  | Contains "a" anywhere                           |
| `'__a%'` | "a" is the third character                      |
| `'a_%'`  | Starts with "a", at least **2 characters** long |
| `'a__%'` | Starts with "a", at least **3 characters** long |
| `'a%o'`  | Starts with "a", ends with "o"                  |

### ❗ **NOT LIKE**

Use `NOT LIKE` to exclude a specific pattern.

### 🛡️ **LIKE with ESCAPE**

Sometimes we need to search for special characters (like `%` or `_`) **literally**:

```sql
SELECT * FROM notes
WHERE note LIKE '!%%%' ESCAPE '!';
```

- `ESCAPE '!'` defines `!` as the escape character.
- `!%` means treat `%` as a **literal percent sign**.

🧾 **Example Table:**

| id | note |
|----|------------|
| 1 | 100%%true |
| 2 | 50% false |
| 3 | 100kg |

---

## 🧩 **IN Operator**

Use `IN` to simplify multiple `OR` conditions.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
```

### 📝 **Example:**

```sql
SELECT *
FROM sakila.actor
WHERE last_name IN ('AKROYD', 'ALLEN');
```

✅ This finds all actors with last names **AKROYD or ALLEN**.

---

## 📊 **BETWEEN ... AND**

Use `BETWEEN` to select values **within a range**.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

- You can also use `NOT BETWEEN` to exclude that range.

### 🔢 **Number Example:**

```sql
SELECT *
FROM sakila.customer
WHERE customer_id BETWEEN 5 AND 10;
```

✅ Returns rows where `customer_id` is **between 5 and 10 inclusive**.

### 🔡 **Text Range Example:**

```sql
SELECT *
FROM sakila.customer
WHERE first_name BETWEEN 'adam' AND 'allen';
```

✅ This checks alphabetically by **ASCII/Unicode** value.

---

🌟 **Summary Cheatsheet:**

| Clause | Purpose | Example |
|-------------|------------------------------------------------|---------|
| `LIKE` | Match patterns in text | `'A%'` |
| `IN` | Match any of a list of values | `IN ('x','y')` |
| `BETWEEN` | Match values within a range | `BETWEEN 10 AND 20` |
| `ESCAPE` | Escape special characters in patterns | `'!%%' ESCAPE '!'` |
