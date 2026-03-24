# sql-dvdrental-analysis
SQL analysis project using the dvdrental database to explore actors, films, customers, stores, rentals, and sales.
# SQL Analysis of the dvdrental Database

## Overview
This project uses SQL to analyze the `dvdrental` database, a movie rental system containing information about actors, films, customers, stores, rentals, and payments.

The objective is to answer business and operational questions through SQL queries and interpret the results obtained from the database.

## Objective
The main objective of this project is to perform different SQL queries to analyze:

- actor information
- movie catalog characteristics
- customer activity
- store performance
- rental behavior
- sales performance

This project shows how SQL can be used to transform stored data into useful insights for decision-making.

## Database
The project is based on the `dvdrental` database, which simulates a movie rental business.

### Main entities analyzed
- actors
- films
- customers
- stores
- rentals
- inventory
- payments

## Tools Used
- SQL
- SQL Server or compatible database manager
- dvdrental database backup file
- PDF documentation for conclusions

## Key Analysis Performed
The project includes queries such as:

1. Selecting actor first and last names
2. Displaying actor full names in one column
3. Finding actors whose names begin with D
4. Detecting repeated first names among actors
5. Finding the maximum rental rate
6. Identifying films with the maximum rental rate
7. Counting films by audience rating
8. Filtering films that are not rated R or NC-17
9. Counting customers by store
10. Finding the most rented film
11. Detecting films that have never been rented
12. Finding customers with no rental history
13. Identifying actors who participated in more than 30 films
14. Calculating total sales by store
15. Detecting customers who rented the same film more than once

## Main Findings
- The actor table stores basic identification information such as first and last name
- Concatenating fields improves readability for final users
- Pattern matching with `LIKE` is useful for filtering names
- Some actors share the same first name
- The maximum rental rate in the catalog is 4.99
- Several films share the highest rental price
- Film ratings help understand the audience distribution of the catalog
- Customer distribution can be compared between stores
- The most rented film can be identified by combining rental, inventory, and film tables
- Some films have never been rented, which may suggest low demand
- Some customers have no rental history, indicating inactivity
- Certain actors appear in a large number of films
- Total store sales provide a direct comparison of financial performance
- Repeated customer rentals reveal recurring behavior patterns

## Business Value
This SQL analysis provides useful operational insights for a rental business, including:

- identifying inactive customers
- evaluating store revenue performance
- detecting underperforming films
- understanding catalog pricing
- analyzing customer repetition patterns
- supporting commercial and inventory decisions

## Conclusion
This project demonstrates the practical value of SQL for business analysis. Through aggregation functions, filters, joins, groupings, and common table expressions, it is possible to answer important operational questions and generate actionable conclusions from relational databases.

## Repository Structure
```text
sql-dvdrental-analysis/
│
├── sql/
│   ├── Analisis de Datos con SQL.sql
│   └── Analisis de Datos con SQL Resuelto.sql
│
├── docs/
│   └── Avance Proyecto Parte 4.pdf
│
├── data/
│   └── dvdrental.bak
│
├── images/
│   └── query result screenshots
│
└── README.md
