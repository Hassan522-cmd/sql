# Hospital Management System (SQL Server)

Yeh project aik **Hospital Management System** ka relational database design aur analytical queries par mabni hai. Is ka maqsad real-world hospital operations jise ke Departments, Doctors, Patients, Appointments, Billing, aur Prescriptions ko manage karna aur un se useful insights nikalna hai.

## 🚀 Features & Database Architecture
Database mein total 8 tables hain jo aik doosre se Primary aur Foreign Keys ke zariye connect hain:
* **Departments & Doctors:** Hospital ke staff aur un ki specializations ka track rakhne ke liye.
* **Patients & Appointments:** Patients ki details aur un ke doctor visits ko manage karne ke liye.
* **Prescriptions & Medicines:** Pharmacy inventory aur patients ko di gayi medicines ka record.
* **Billing:** Revenue tracking aur pending dues ka hisab kitab.

---

## 📊 Business Queries & Insights (Tasks Solved)

Is project mein business logic ko solve karne ke liye advanced SQL concepts (CTEs, Subqueries, Joins, Aggregations) ka istemal kiya gaya hai:

1. **Doctor-wise Revenue:** Har doctor ki completed appointments aur un se generate hone wali total fee ka hisab.
2. **Pending Bills Tracking:** Aise patients ki list jinki payment complete nahi hai (`total_amount > paid_amount`).
3. **Department Salary Analysis:** CTEs ka use kar ke un departments ko filter kiya jahan average doctor salary 70,000 se zyada hai.
4. **Top Prescribed Medicine:** Sabse zyada dispense hone wali medicine ki analytical report.
5. **Inactive Doctors:** Aise doctors jo kisi bhi completed appointment mein shamil nahi rahe (`NOT EXISTS` subquery).
6. **City-wise Patient Demographics:** Cities ke mutabiq patients ka count aur un ka total bill (sirf un cities ke liye jahan 1 se zyada patient hain).
7. **Doctor Schedule Analysis:** Har doctor ki pehli (MIN) aur aakhri (MAX) appointment ki date.

---

## 🛠️ How to Use This Project
1. SQL Server Management Studio (SSMS) open karein.
2. `Hospital_Management_System.sql` file ko open karein.
3. Database create karne ke liye shuru ki commands ko uncomment karein aur poori script run (`F5`) kar dein.
