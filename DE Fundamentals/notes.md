# Fundamentals of Data Engineering

## Database

-   A database is used to store data in an organised way so that we can
    easily save, find, update, and manage it.
-   Databases are commonly used for **OLTP (Online Transaction
    Processing)** --- handling daily operations and fast transactions.
-   Examples: PostgreSQL, Oracle, Microsoft SQL Server, and MySQL.

## Data Warehouse

-   A data warehouse is a special type of database used to store large
    amounts of historical data from different sources for **reporting
    and analysis**.
-   Data warehouses are commonly used for **OLAP (Online Analytical
    Processing)** --- reporting, analytics, and business insights.
-   Examples: Snowflake, Google BigQuery, and Amazon Redshift.

## Data Lake

-   A data lake is a storage system that keeps a huge amount of raw data
    in its original format.
-   It can store **structured, semi-structured, and unstructured data**.
-   Instead of cleaning and organising data first, we can store it
    directly in one central place. This place is called a **data lake**.

## Differences

In short, a company uses a database to manage day-to-day activities. A
data warehouse gathers data from different sources, such as databases,
so the company can analyse it and create reports. A data lake stores
large amounts of raw data in its original format.

### Simple Difference

  -----------------------------------------------------------------------
  System                              Main purpose
  ----------------------------------- -----------------------------------
  **Database**                        Used for daily operations such as
                                      inserting, updating, and deleting
                                      data.

  **Data Warehouse**                  Used for analysis and reporting.

  **Data Lake**                       Used to store huge amounts of raw
                                      data in different formats.
  -----------------------------------------------------------------------

### Examples

-   **Database:** What did a customer buy today?
-   **Data Warehouse:** What were the company's total sales over the
    last five years?
-   **Data Lake:** Where can we store all raw customer, transaction,
    log, image, and other data for future use?

# OLTP vs OLAP

| Feature | OLTP | OLAP |
|---|---|---|
| **Full Form** | Online Transaction Processing | Online Analytical Processing |
| **Purpose** | Daily operations | Data analysis and reporting |
| **Data Type** | Current/live data | Historical data |
| **Queries** | Simple and fast | Complex and resource-intensive |
| **Operations** | Insert, Update, Delete | Mostly Read |
| **Users** | Customers and employees | Analysts and managers |
| **Speed** | Very fast transactions | Fast analysis |
| **Examples** | ATM, UPI, shopping apps | Sales dashboards, business reports |
| **Storage** | Traditional databases | Data warehouses |

# ETL vs ELT

Beginner-friendly notes with real-world examples and interview questions for Data Engineering.

## 1. ETL vs ELT

Both ETL and ELT are methods of moving data from one place to another. The main difference is **when we transform the data**.

### ETL — Extract, Transform, Load

ETL means:

1. **Extract:** Collect data from different sources.
2. **Transform:** Clean and modify the data.
3. **Load:** Store the transformed data in the destination.

#### Example: Employee Payroll System

Suppose you receive employee data from three different sources:

- HR system
- Payroll system
- Attendance system

An ETL pipeline will:

1. Extract data from all three systems.
2. Remove duplicate employees.
3. Fix missing values.
4. Calculate employee salaries.
5. Load clean data into a data warehouse.

**Key point:** Transformation happens **before loading**.

### ELT — Extract, Load, Transform

ELT means:

1. **Extract:** Collect data from different sources.
2. **Load:** Store raw data in the destination.
3. **Transform:** Clean and modify data inside the destination.

#### Example: Snowflake

- Extract employee data from HR, payroll and attendance systems.
- Load raw data into Snowflake.
- Use SQL and dbt to clean, join and transform the data.
- Create final reporting tables.

**Key point:** Transformation happens **after loading**.

### ETL vs ELT Comparison

| Feature | ETL | ELT |
|---|---|---|
| Full form | Extract, Transform, Load | Extract, Load, Transform |
| Transformation | Before loading | After loading |
| Storage | Usually transformed data | Raw and transformed data |
| Processing | ETL tool or processing server | Destination platform |
| Flexibility | Reprocessing may require rerunning transformations | Raw data can be transformed again |
| Common tools | Informatica, Talend, SSIS | Snowflake + dbt, BigQuery + dbt |
| Best suited for | Traditional warehouse patterns | Modern cloud data platforms |

**Examples of ETL tools:** Informatica, Talend and SSIS.

**Examples of ELT tools/platforms:** Snowflake + dbt, BigQuery + dbt and Redshift + SQL.

### Interview Question: Why is ELT popular in modern Data Engineering?

**Answer:** Modern cloud data warehouses have powerful and scalable storage and processing capabilities. This makes it practical to load raw data first and transform it later based on business requirements.

---


## 2. Batch Processing vs Streaming Processing

The main difference is **when data is processed**.

### Batch Processing

Batch processing means collecting data over a period of time and processing it together.

#### Example: Daily Employee Attendance Report

Imagine a company receives employee attendance data throughout the day.

Instead of processing every attendance record immediately:

1. Collect attendance records throughout the day.
2. At midnight, process all records together.
3. Generate the daily attendance report.

This is batch processing.

**Common examples:**

- Daily sales reports
- Monthly salary calculations
- Daily bank transaction reports
- Scheduled data warehouse loads

### Streaming Processing

Streaming means processing data continuously as new events arrive.

#### Example: UPI Transactions

Imagine someone makes a UPI payment.

1. A transaction event is generated.
2. The event is sent to Kafka.
3. Spark processes the event.
4. The system updates transaction records.
5. Fraud detection can analyse the transaction almost immediately.

This is streaming processing.

**Common examples:**

- UPI transaction monitoring
- Real-time fraud detection
- Live stock market updates
- Website click tracking
- Real-time recommendations

### Batch vs Streaming Comparison

| Feature | Batch | Streaming |
|---|---|---|
| Processing | Groups of data | Continuous events |
| Frequency | Scheduled | Continuous |
| Latency | Usually minutes to hours | Often milliseconds to seconds |
| Data | Records collected over time | Incoming events |
| Complexity | Generally simpler | Generally more complex |
| Common tools | Apache Spark, Airflow | Kafka, Spark Structured Streaming |
| Use case | Daily reports | Fraud detection |

---

## 3. Understand All Four Concepts Together

Imagine an online shopping company.

### ETL vs ELT

- **ETL:** Extract order data, clean and transform it, then load the result into the warehouse.
- **ELT:** Extract order data, load raw data into the warehouse, then transform it there using SQL or dbt.

### Batch vs Streaming

- **Batch:** Process all orders together at midnight and create a daily sales report.
- **Streaming:** Process each new order as it arrives and update live order metrics.

### Important Distinction

- **ETL/ELT** describes the order of data extraction, transformation and loading.
- **Batch/Streaming** describes how and when data is processed.

These are two different dimensions. You can build:

- A batch ETL pipeline
- A batch ELT pipeline
- A streaming ETL pipeline
- A streaming ELT-style pipeline, depending on the architecture and tools.

---

## 4. Interview Preparation

Try answering these questions without looking at the answers first.

### Q1. What is the main difference between ETL and ELT?

**Answer:** ETL transforms data before loading it into the destination. ELT loads raw data first and transforms it inside the destination.

### Q2. Why do modern data warehouses commonly use ELT?

**Answer:** Cloud warehouses provide scalable storage and processing power. This makes it practical to load raw data first and transform it later.

### Q3. What is batch processing?

**Answer:** Batch processing means processing a collection of data together at scheduled intervals.

### Q4. What is streaming processing?

**Answer:** Streaming processing means processing incoming events continuously, usually with low latency.

### Q5. Can Apache Spark perform both batch and streaming processing?

**Answer:** Yes. Apache Spark supports batch processing and Structured Streaming.

### Q6. Can ETL and batch processing be used together?

**Answer:** Yes. For example, an ETL pipeline can extract data, transform it and load it every night.

---

## 5. What to Focus on for Data Engineering Interviews

Focus especially on:

1. ETL vs ELT
2. Incremental loading
3. Full load vs incremental load
4. Batch pipeline design
5. Streaming architecture
6. Kafka fundamentals
7. Spark Structured Streaming
8. Data quality, retries and fault tolerance

These concepts form an important foundation for modern Data Engineering.

---

## 6. Quick Revision

| Concept | Remember This |
|---|---|
| ETL | Transform before loading |
| ELT | Load first, transform after |
| Batch | Process data in groups at scheduled times |
| Streaming | Process incoming events continuously |
| Kafka | Common platform for event streaming |
| Apache Spark | Supports batch and streaming workloads |
| dbt | Commonly used to transform data in a warehouse |

### One-Line Memory Trick

- **ETL vs ELT =** When do we transform?
- **Batch vs Streaming =** When do we process?

# Batch Processing vs Stream Processing

**Batch Processing:** Process data in groups (batches).

**Stream Processing:** Process data continuously as it arrives.

## Key Differences

| Batch Processing | Stream Processing |
|---|---|
| Data is collected for some time and processed later. | Data is processed immediately when it arrives. |
| Higher latency (minutes, hours, or days). | Very low latency (seconds or milliseconds). |
| Suitable for historical data analysis. | Suitable for real-time applications. |
| Example: Daily sales report. | Example: Fraud detection during a transaction. |
| Tools: Spark Batch, Hadoop. | Tools: Spark Streaming, Kafka, Flink. |

## Simple Examples

### 1. Batch Processing

Imagine a company generates sales data throughout the day.

- Data is stored throughout the day.
- At midnight, a job runs.
- The job calculates the total sales for the day.

**Processing happens once after data collection.**

### 2. Stream Processing

Imagine a customer makes an online payment.

- The payment event arrives.
- The system immediately checks for fraud.
- If the transaction is suspicious, the system blocks it immediately.

**Processing happens continuously in real time.**