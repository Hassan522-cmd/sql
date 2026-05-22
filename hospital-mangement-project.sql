-- =============================================
-- HOSPITAL MANAGEMENT SYSTEM (CORRECTED DATASET)
-- =============================================
--create database new1
--use new1

-- 1. DEPARTMENTS
CREATE TABLE Departments (
    dept_id    INT PRIMARY KEY IDENTITY(1,1),
    dept_name  VARCHAR(100) NOT NULL,
    location   VARCHAR(100),
    head_id    INT
);

INSERT INTO Departments (dept_name, location, head_id) VALUES 
('Cardiology', 'Block A', 101),
('Neurology', 'Block B', 102),
('Pediatrics', 'Block C', 103),
('Orthopedics', 'Block D', 104),
('ICU', 'Block E', 105);

-- 2. DOCTORS
CREATE TABLE Doctors (
    doctor_id       INT PRIMARY KEY IDENTITY(1,1),
    name            VARCHAR(100) NOT NULL,
    specialization  VARCHAR(100),
    dept_id         INT FOREIGN KEY REFERENCES Departments(dept_id),
    salary          DECIMAL(10,2),
    join_date       DATE,
    phone           VARCHAR(20),
    email           VARCHAR(100)
);

INSERT INTO Doctors (name, specialization, dept_id, salary, join_date, phone, email) VALUES 
('Dr. Ahmed', 'Cardiologist', 1, 95000, '2023-01-15', '03001234567', 'ahmed@hospital.com'),
('Dr. Sara', 'Neurologist', 2, 85000, '2023-02-10', '03007654321', 'sara@hospital.com'),
('Dr. Zain', 'Pediatrician', 3, 75000, '2023-03-05', '03111223344', 'zain@hospital.com'),
('Dr. Fatima', 'Surgeon', 4, 110000, '2023-04-20', '03225566778', 'fatima@hospital.com'),
('Dr. Usman', 'Physician', 5, 65000, '2023-05-12', '03339988776', 'usman@hospital.com');

-- 3. PATIENTS
CREATE TABLE Patients (
    patient_id      INT PRIMARY KEY IDENTITY(1,1),
    name            VARCHAR(100) NOT NULL,
    age             INT,
    gender          VARCHAR(10),
    city            VARCHAR(50),
    phone           VARCHAR(20),
    admission_date  DATE,
    blood_group     VARCHAR(5)
);

INSERT INTO Patients (name, age, gender, city, phone, admission_date, blood_group) VALUES 
('Ali Khan', 25, 'Male', 'Multan', '03450011223', '2026-05-01', 'O+'),
('Ayesha Bibi', 30, 'Female', 'Lahore', '03450044556', '2026-05-02', 'A-'),
('Umer Hayat', 45, 'Male', 'Multan', '03450077889', '2026-05-03', 'B+'),
('Sana Malik', 22, 'Female', 'Bahawalpur', '03451122334', '2026-05-04', 'AB+'),
('Bilal Ahmed', 55, 'Male', 'Khanewal', '03456677889', '2026-05-05', 'O-');

-- 4. APPOINTMENTS
CREATE TABLE Appointments (
    appt_id     INT PRIMARY KEY IDENTITY(1,1),
    patient_id  INT FOREIGN KEY REFERENCES Patients(patient_id),
    doctor_id   INT FOREIGN KEY REFERENCES Doctors(doctor_id),
    appt_date   DATETIME,
    status      VARCHAR(20),
    fee         DECIMAL(10,2)
);

INSERT INTO Appointments (patient_id, doctor_id, appt_date, status, fee) VALUES 
(1, 1, '2026-05-01 09:00', 'Completed', 1500),
(2, 2, '2026-05-01 10:00', 'Completed', 2000),
(3, 3, '2026-05-02 11:30', 'Cancelled', 1200),
(4, 4, '2026-05-02 12:00', 'Completed', 2500),
(5, 5, '2026-05-03 14:00', 'Scheduled', 1000),
(1, 2, '2026-05-04 10:00', 'Completed', 2000),
(2, 4, '2026-05-04 11:00', 'Completed', 2500),
(3, 1, '2026-05-05 09:30', 'Completed', 1500), 
(4, 3, '2026-05-05 10:30', 'Scheduled', 1200), 
(5, 5, '2026-05-06 12:00', 'Completed', 1000);

-- 5. MEDICINES
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY IDENTITY(1,1),
    name        VARCHAR(100) NOT NULL,
    category    VARCHAR(50),
    price       DECIMAL(10,2),
    stock_qty   INT
);

INSERT INTO Medicines (name, category, price, stock_qty) VALUES 
('Panadol', 'Tablet', 50, 500),
('Augmentin', 'Syrup', 250, 100),
('Brufen', 'Tablet', 120, 300),
('Softin', 'Tablet', 180, 150),
('Flagyl', 'Syrup', 90, 200);

-- 6. PRESCRIPTIONS
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY IDENTITY(1,1),
    appt_id         INT FOREIGN KEY REFERENCES Appointments(appt_id),
    medicine_id     INT FOREIGN KEY REFERENCES Medicines(medicine_id),
    qty             INT,
    dosage          VARCHAR(50)
);

INSERT INTO Prescriptions (appt_id, medicine_id, qty, dosage) VALUES 
(1, 1, 2, '1-0-1 after meal'),
(2, 2, 1, '0-0-1 before sleep'),
(4, 3, 3, '1-1-1 for 5 days'),
(6, 4, 1, 'Whenever needed'),
(7, 5, 2, '1-0-1 for 3 days');

-- 7. BILLING
CREATE TABLE Billing (
    bill_id          INT PRIMARY KEY IDENTITY(1,1),
    patient_id       INT FOREIGN KEY REFERENCES Patients(patient_id),
    appt_id          INT FOREIGN KEY REFERENCES Appointments(appt_id),
    total_amount     DECIMAL(10,2),
    paid_amount      DECIMAL(10,2),
    payment_method   VARCHAR(50),
    bill_date        DATE
);

INSERT INTO Billing (patient_id, appt_id, total_amount, paid_amount, payment_method, bill_date) VALUES 
(1, 1, 3000.00, 3000.00, 'Cash', '2026-05-01'),
(2, 2, 4500.00, 4000.00, 'EasyPaisa', '2026-05-01'),
(3, 3, 1200.00, 1200.00, 'Cash', '2026-05-02'),
(4, 4, 5000.00, 5000.00, 'Card', '2026-05-02'), 
(5, 5, 2500.00, 2500.00, 'JazzCash', '2026-05-03');

-- 8. STAFF
CREATE TABLE Staff (
    staff_id    INT PRIMARY KEY IDENTITY(1,1),
    name        VARCHAR(100),
    role        VARCHAR(50),
    dept_id     INT FOREIGN KEY REFERENCES Departments(dept_id),
    salary      DECIMAL(10,2),
    manager_id  INT,
    phone       VARCHAR(20)
);

INSERT INTO Staff (name, role, dept_id, salary, manager_id, phone) VALUES 
('Kamran', 'Nurse', 1, 35000, 1, '03124455667'),
('Nadia', 'Receptionist', 2, 25000, 1, '03128899001'),
('Sohail', 'Lab Tech', 3, 40000, 2, '03121122334'),
('Farah', 'Nurse', 4, 35000, 2, '03125566778'),
('Asad', 'Security', 5, 20000, 3, '03129988776');


--===============TASKS STARTED=============

--Doctor-wise total revenue aur appointment count nikalo
--Har doctor ne kitni appointments ki aur unse hospital ko total kitna fee mila — sirf "Completed" appointments count karo. Doctor ka naam bhi show karo.

select * from Doctors
select * from Appointments

select d.doctor_id , d.name , COUNT(*) as total_count ,sum(fee) as total_fee ,appt.status
from Appointments appt
join Doctors d on d.doctor_id = appt.doctor_id
where (appt.status) = 'completed'
group by d.name , d.doctor_id , appt.status

--TASK2:
--Woh patients dhundo jinki billing pending hai
--Jinke total_amount aur paid_amount mein farq ho — matlab unhon ne poora payment nahi kiya. Patient ka naam, baqi amount, aur payment method dikhao.

select * from Billing
select * from Patients

select p.patient_id , p.name , b.payment_method ,b.total_amount , b.paid_amount , b.total_amount - b.paid_amount as pending_amont
from Patients p
join Billing b on p.patient_id = b.patient_id
where b.total_amount > b.paid_amount

--TASK 3:
--Har department ki average doctor salary nikalo — CTE use karo
--Pehle CTE mein dept-wise average salary calculate karo, phir sirf woh departments dikhao jinka average 70,000 se zyada ho. Department ka naam bhi join karo

with h_CTE as(
select AVG(d.salary) avg_salary, dep.dept_name 
from Departments dep
join Doctors d on d.dept_id = dep.dept_id
group by dep.dept_name  
)
select dept_name , avg_salary from h_CTE
where avg_salary > 70000

SELECT * FROM Departments; -- dep_id,dept_name,location,head_id 
SELECT * FROM Doctors; -- doctor_id,name,specialization,dept_id,salary,join_date,phone,email       (dept_id)
SELECT * FROM Patients; --patient_id,name,age,gender,city,phone,admission_date,blood_group
SELECT * FROM Appointments; -- app_id,patient_id,doctor_id,appt_date,status,fee          (patient_id , doctor_id)
SELECT * FROM Medicines; --medicine_id , name , category,price,stock_qty
SELECT * FROM Prescriptions;-- prescription_id, app_id,medicine_id,qty,dosage      (appt_id , medicine_id)
SELECT * FROM Billing; --bill_id , patient_id,appt_id,total_amount,paid_amont,payment_method,bill_date     (patient_id , appt_id ,)
SELECT * FROM Staff;  --(staff_id , name , role , dept_id, salary , manager_id,phone      (dept_id , manager_id)

--TASK 4:
--Sabse zyada prescription wali medicine kaun si hai?
--Har medicine ko kitni baar prescribe kiya gaya — subquery ya CTE se top 1 medicine nikalo. Medicine ka naam aur category bhi show karo.
select * from Prescriptions

with cte as(
select m.name ,m.category , count(p.prescription_id) total_count 
from Medicines m
join Prescriptions p on p.medicine_id = m.medicine_id
group by m.name , m.category 
)
select top 1 name , category , total_count from cte
order by total_count desc 

--Task 5:
--Woh doctors jo kabhi koi appointment complete nahi kar sake
--Doctors table mein se woh nikalo jinki koi bhi appointment "Completed" status mein nahi hai — ya jo appointments table mein hain hi nahi 
select * from Appointments

select d.doctor_id , d.name ,d.salary 
from Doctors d 
where not exists(
select * from Appointments a 
where a.doctor_id  = d.doctor_id
and a.status = 'Completed'
);

--TASK 6: City-wise patient count aur unka total billing amount
--Har city mein kitne patients hain aur unka combined billing amount kya hai — sirf woh cities dikhao jahan 1 se zyada patient ho
--Descending order mein sort karo
select * from Billing
select * from Patients

select count(p.patient_id) total_count , p.city , sum(b.total_amount) total_sum 
from Patients p
join Billing b on b.patient_id = p.patient_id
group by p.city
having COUNT(p.patient_id) > 1
order by total_count desc

--TASK 7:
--Har doctor ke liye: pehli appointment date aur latest appointment date
--doctor ka naam, unki pehli appointment (MIN), aur aakhri appointment (MAX) dikhao. Sirf woh doctors jo kam az kam 2 appointments mein hon
select * from Appointments

select d.name , min(a.appt_date) as first_appointment , max(a.appt_date) last_date 
from Doctors d
join Appointments a on a.doctor_id = d.doctor_id
group by d.name
having count(a.appt_id) >= 2
