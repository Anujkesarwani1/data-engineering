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
