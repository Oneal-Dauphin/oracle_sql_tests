# oracle_sql_tests

# Pharmacy Management System

This repository contains SQL commands for managing a **Pharmacy Management System**. The system tracks medicines, suppliers, customers, and sales transactions. This README explains the SQL queries and operations performed, including table creation, data manipulation, and joins.

## Problem Statement

The Pharmacy Management System requires tables to manage medicines, suppliers, customers, and sales records. These tables are related as follows:
- Each supplier provides many medicines (One-to-Many relationship).
- Customers can buy many medicines, and each medicine can be bought by multiple customers (Many-to-Many relationship, handled by the Sales table).
