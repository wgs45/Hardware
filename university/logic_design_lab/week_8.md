# 📘 **MySQL Syntax - Week 8** 🍃

---

## 🏗️ **CREATE SCHEMA**

📌 Use `CREATE SCHEMA` to create a new database:

```sql
CREATE SCHEMA 'your_database_name';
```

✨ Remember: This is one of the first steps in building your database structure!

---

## 🧱 **CREATE TABLE**

🔧 First, select the database you'll work in:

```sql
USE your_database_name;
```

🗂️ Then, define the structure of your table:

```sql
CREATE TABLE table_name (
    column_name1 DATA_TYPE [CONSTRAINT],
    column_name2 DATA_TYPE [CONSTRAINT],
    ...
);
```

📌 Each field has a **data type** and can have **constraints** applied.

---

## 📊 **Common Data Types**

| Data Type      | Description                                               |
| -------------- | --------------------------------------------------------- |
| `INT`          | Integer numbers                                           |
| `VARCHAR(n)`   | Variable-length string, up to **n** characters            |
| `CHAR(n)`      | Fixed-length string                                       |
| `DATE`         | Stores date only (YYYY-MM-DD)                             |
| `DATETIME`     | Stores both date and time                                 |
| `DECIMAL(x,y)` | Decimal number with **x** total digits and **y** decimals |
| `BOOLEAN`      | TRUE / FALSE                                              |

📝 Choose data types wisely to optimize performance and storage!

---

## 🔐 **Constraints**

| Constraint       | Description                                                                    |
| ---------------- | ------------------------------------------------------------------------------ |
| `PRIMARY KEY`    | Uniquely identifies each row in a table. Cannot be NULL.                       |
| `FOREIGN KEY`    | Refers to a primary key in another table to establish relationships.           |
| `NOT NULL`       | Ensures that a column **must** have a value.                                   |
| `UNIQUE`         | All values in the column must be **different**.                                |
| `DEFAULT`        | Automatically sets a value when none is provided.                              |
| `CHECK`          | Limits values based on a condition (e.g., CHECK(age >= 18)).                   |
| `AUTO_INCREMENT` | Automatically increases numeric value for each new row (used in primary keys). |

✨ Constraints help enforce data **integrity** and keep your tables clean and reliable!

---

💡 **Tip:** Start every table with a clear plan—define the **purpose**, decide the **fields**, and apply **constraints** as needed. This saves time and avoids future headaches! 🧠✅
