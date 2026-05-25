# Hospital Management System (SQL Server)

This repository contains a comprehensive relational database design and analytical SQL queries for a **Hospital Management System**. The project simulates real-world hospital operations—managing departments, doctors, patients, appointments, billing, and prescriptions—and extracts meaningful business insights using advanced SQL techniques.

---

## 🚀 Features & Database Architecture

The database consists of **8 interconnected tables** structured with proper data types, Primary Keys, Identity columns, and Foreign Key constraints to ensure data integrity:

* **Departments & Staff:** Tracks organizational hierarchy, hospital blocks, and administrative staff management.
* **Doctors & Specializations:** Manages physician demographics, department assignments, and salary records.
* **Patients & Appointments:** Records patient admissions, demographics (city, age, blood group), and tracks appointment statuses (`Scheduled`, `Completed`, `Cancelled`).
* **Prescriptions & Pharmacy Inventory:** Links appointments to prescribed medicines while tracking pharmacy stock levels and dosages.
* **Billing & Revenue:** Monitors hospital financial transactions, payment methods (`Cash`, `EasyPaisa`, `JazzCash`, `Card`), and payment statuses.

---

## 📊 Business Queries & Insights (Tasks Solved)

The project demonstrates proficiency in writing optimized, complex SQL queries using **Joins, Aggregations, Subqueries, Common Table Expressions (CTEs), and Window functions**:

1. **Doctor-wise Revenue Analysis:** Calculates total completed appointments and the exact revenue generated per doctor.
2. **Pending Dues & Financial Auditing:** Identifies patients with outstanding balances where `total_amount > paid_amount` to track leaking revenue.
3. **Departmental Salary Analysis (CTEs):** Utilizes Common Table Expressions to aggregate average doctor salaries by department, filtering for high-overhead departments (Average > 70,000).
4. **Pharmacy Inventory Insights:** Identifies the top-prescribed medication by leveraging subqueries/CTEs on prescription frequencies.
5. **Inactive Resource Tracking (`NOT EXISTS`):** Isolates records of doctors who haven't completed any appointments or are currently unassigned to optimize scheduling.
6. **Geographic Patient Demographics:** Analyzes patient density and total billing volume grouped by city, filtering out low-volume areas using the `HAVING` clause.
7. **Doctor Schedule Timeline:** Evaluates workload timelines by tracking the earliest (`MIN`) and most recent (`MAX`) appointment dates for active medical staff.

---

## 🛠️ How to Use & Run This Project

### Prerequisites
* Microsoft SQL Server (2019 or later recommended)
* SQL Server Management Studio (SSMS) or Azure Data Studio

### Execution Steps
1. Clone this repository to your local machine:
   ```bash
   git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
