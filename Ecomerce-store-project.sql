
-- 2. Create Tables (Using IDENTITY instead of AUTO_INCREMENT)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    discount_rate DECIMAL(5,2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATETIME,
    status VARCHAR(20),
    staff_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    payment_method VARCHAR(50),
    amount_paid DECIMAL(10,2),
    payment_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    tracking_number VARCHAR(100),
    carrier VARCHAR(50),
    delivery_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 3. Insert Data into Categories
INSERT INTO Categories (category_name, description) VALUES
('Electronics', 'Gadgets and devices'), ('Fashion', 'Clothing and accessories'), 
('Home Decor', NULL), ('Books', 'Educational and fiction'), 
('Groceries', 'Daily essentials'), ('Toys', 'Kids play items'),
('Automotive', 'Car parts'), ('Beauty', 'Skincare and makeup'),
('Sports', 'Gym and outdoor gear'), ('Music', 'Instruments and vinyls');

-- 4. Insert Data into Customers (21 entries)
INSERT INTO Customers (first_name, last_name, email, phone, city, join_date) VALUES
('Ali', 'Khan', 'ali@email.com', '03001234567', 'Karachi', '2023-01-10'),
('Sara', 'Ahmed', 'sara@email.com', NULL, 'Lahore', '2023-02-15'),
('Zain', 'Malik', 'zain@email.com', '03115556667', 'Islamabad', '2023-03-20'),
('Ayesha', NULL, 'ayesha@email.com', '03451112223', 'Karachi', '2023-04-05'),
('Bilal', 'Sheikh', 'bilal@email.com', NULL, 'Faisalabad', '2023-05-12'),
('Hira', 'Mani', 'hira@email.com', '03217778889', 'Lahore', '2023-06-18'),
('Usman', 'Farooq', 'usman@email.com', '03339990001', 'Multan', '2023-07-25'),
('Sana', 'Javed', 'sana@email.com', NULL, 'Rawalpindi', '2023-08-30'),
('Omar', 'Zaid', 'omar@email.com', '03004445556', 'Peshawar', '2023-09-14'),
('Fiza', 'Ali', 'fiza@email.com', '03126667778', 'Quetta', '2023-10-02'),
('Hamza', 'Riaz', 'hamza@email.com', NULL, 'Karachi', '2023-11-09'),
('Dua', 'Lipia', 'dua@email.com', '03211122233', 'Lahore', '2023-12-01'),
('Saad', 'Hassan', 'saad@email.com', '03443334445', 'Islamabad', '2024-01-05'),
('Nida', 'Batool', 'nida@email.com', NULL, 'Sialkot', '2024-01-15'),
('Taimoor', 'Baig', 'taimoor@email.com', '03005559992', 'Karachi', '2024-02-10'),
('Rabia', 'Basri', 'rabia@email.com', '03157774441', 'Lahore', '2024-02-20'),
('Junaid', 'Jamshed', 'junaid@email.com', NULL, 'Karachi', '2024-03-01'),
('Mehak', 'Gul', 'mehak@email.com', '03221110009', 'Peshawar', '2024-03-10'),
('Waqas', 'Abid', 'waqas@email.com', '03336662221', 'Faisalabad', '2024-03-25'),
('Zoya', 'Khan', 'zoya@email.com', '03119998887', 'Islamabad', '2024-04-01'),
('Kashif', 'Anwar', 'kashif@email.com', '03450009998', 'Multan', '2024-04-10');

-- 5. Insert Data into Products (22 entries)
INSERT INTO Products (product_name, category_id, price, stock_quantity, discount_rate) VALUES
('iPhone 15', 1, 350000.00, 10, 5.00), ('Laptop Dell', 1, 150000.00, 5, NULL),
('T-Shirt', 2, 1500.00, 50, 10.00), ('Jeans', 2, 2500.00, 30, NULL),
('Wall Clock', 3, 1200.00, 20, 2.00), ('Table Lamp', 3, 3000.00, 15, NULL),
('Python Book', 4, 800.00, 100, 15.00), ('Cooking Oil', 5, 600.00, 200, NULL),
('Teddy Bear', 6, 2000.00, 40, 5.00), ('Spark Plug', 7, 500.00, 150, NULL),
('Face Wash', 8, 900.00, 60, 20.00), ('Dumbbells', 9, 5000.00, 12, NULL),
('Guitar', 10, 12000.00, 8, 10.00), ('Headphones', 1, 4500.00, 25, NULL),
('Formal Shirt', 2, 3500.00, 40, 5.00), ('SQL Guide', 4, 1200.00, 80, 5.00),
('Action Figure', 6, 1500.00, 35, NULL), ('Brake Pads', 7, 3000.00, 20, 0.00),
('Lipstick', 8, 2500.00, 45, NULL), ('Cricket Bat', 9, 8000.00, 15, 12.00),
('Keyboard', 1, 2500.00, 60, NULL), ('Curtains', 3, 4000.00, 20, 5.00);

-- 6. Insert Data into Staff
INSERT INTO Staff (name, role, salary, manager_id) VALUES
('Aslam', 'Manager', 80000.00, NULL), ('Kamran', 'Sales', 35000.00, 1),
('Babar', 'Sales', 35000.00, 1), ('Rizwan', 'Delivery', 25000.00, 1);

-- 7. Insert Data into Orders (21 entries)
INSERT INTO Orders (customer_id, order_date, status, staff_id) VALUES
(1, '2024-04-01', 'Delivered', 2), (2, '2024-04-02', 'Delivered', 3),
(3, '2024-04-03', 'Pending', NULL), (4, '2024-04-04', 'Cancelled', 2),
(5, '2024-04-05', 'Shipped', 3), (6, '2024-04-06', 'Delivered', 2),
(7, '2024-04-07', 'Delivered', 3), (8, '2024-04-08', 'Pending', NULL),
(9, '2024-04-09', 'Shipped', 2), (10, '2024-04-10', 'Delivered', 3),
(1, '2024-04-11', 'Delivered', 2), (12, '2024-04-12', 'Shipped', 3),
(13, '2024-04-13', 'Delivered', 2), (14, '2024-04-14', 'Pending', NULL),
(15, '2024-04-15', 'Delivered', 3), (16, '2024-04-16', 'Cancelled', 2),
(17, '2024-04-17', 'Shipped', 3), (18, '2024-04-18', 'Delivered', 2),
(19, '2024-04-19', 'Pending', NULL), (20, '2024-04-20', 'Delivered', 3),
(21, '2024-04-21', 'Shipped', 2);

-- 8. Insert Data into OrderItems (21 entries)
INSERT INTO OrderItems (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 350000.00), (2, 3, 2, 1500.00), (3, 7, 1, 800.00), (4, 10, 1, 500.00),
(5, 11, 3, 900.00), (6, 13, 1, 12000.00), (7, 15, 2, 3500.00), (8, 2, 1, 150000.00),
(9, 19, 1, 2500.00), (10, 20, 1, 8000.00), (11, 21, 2, 2500.00), (12, 5, 5, 1200.00),
(13, 8, 10, 600.00), (14, 12, 2, 5000.00), (15, 14, 1, 4500.00), (16, 16, 1, 1200.00),
(17, 17, 2, 1500.00), (18, 4, 3, 2500.00), (19, 9, 1, 2000.00), (20, 18, 2, 3000.00),
(21, 6, 1, 3000.00);

-- 9. Insert Data into Reviews (21 entries)
INSERT INTO Reviews (product_id, customer_id, rating, comment) VALUES
(1, 1, 5, 'Excellent phone!'), (3, 2, 4, 'Nice fitting'), (7, 3, 5, 'Very helpful book'),
(11, 5, 2, 'Average quality'), (13, 6, 5, 'Great sound'), (15, 7, 4, NULL),
(20, 10, 5, 'Original bat'), (2, 8, 3, 'A bit expensive'), (19, 9, 4, 'Love the shade'),
(5, 12, 1, 'Broken on arrival'), (8, 13, 5, 'Fast delivery'), (14, 15, 4, NULL),
(21, 1, 5, 'Working great'), (4, 16, 4, 'Cool jeans'), (9, 18, 3, 'Decent toy'),
(12, 19, 5, 'Solid weights'), (16, 2, 5, 'Best for SQL beginners'), (17, 4, 2, NULL),
(10, 6, 4, 'Fits well'), (6, 20, 5, 'Bright lamp'), (18, 21, 4, 'Reliable');

-- 10. Insert Data into Payments
INSERT INTO Payments (order_id, payment_method, amount_paid, payment_date) VALUES
(1, 'Credit Card', 350000.00, '2024-04-01'), (2, 'JazzCash', 3000.00, '2024-04-02'),
(5, 'Cash on Delivery', 2700.00, '2024-04-05'), (6, 'EasyPaisa', 12000.00, '2024-04-06'),
(10, 'Bank Transfer', 8000.00, '2024-04-10'), (11, 'Credit Card', 5000.00, '2024-04-11');

-- 11. Insert Data into Shipments
INSERT INTO Shipments (order_id, tracking_number, carrier, delivery_date) VALUES
(1, 'TRK001', 'TCS', '2024-04-05'), (2, 'TRK002', 'Leopards', '2024-04-06'),
(6, 'TRK003', 'Bykea', '2024-04-08'), (7, 'TRK004', 'TCS', '2024-04-10'),
(10, 'TRK005', 'M&P', '2024-04-15');

select * from Categories
select * from Customers
select * from Products
select * from Staff
select * from Orders
select * from OrderItems
select * from Payments
select * from Shipments

-- Task 1: WHERE + ORDER BY : Management chahti hai ke sirf “Delivered” orders dekhein aur latest orders upar hon.
--Sirf delivered orders nikalo , Latest order sabse upar

select order_id , order_date , status from Orders 
where status = 'Delivered'
order by order_date

--Task 2: GROUP BY + SUM Company janna chahti hai har product ne kitna revenue generate kiya 
--Har product ka total revenue Highest revenue top pe

select p.product_name , sum(od.unit_price * od.quantity) Total_Revenue 
from Products p
join OrderItems od on od.product_id = p.product_id
group by p.product_name
order by Total_Revenue desc

--Task 3:Customer ke sath uske orders dekhna 
--Show: customer name + order date + status

select  CONCAT(c.first_name , ' ' ,c.last_name) Customer_Name , o.order_date , o.status
from Customers c
join Orders o on o.order_id = c.customer_id

--Task 4: Kaun se customers ne kabhi order nahi diya
--Sirf wo customers jinke orders NULL hain

select CONCAT(c.first_name , ' ' ,c.last_name) as Customer_Name
from Customers c
left join Orders o on o.customer_id = c.customer_id
where o.customer_id is null

--Task 4: HAVING (Advanced Filtering)
--Sirf woh products jinki sales 5000 se zyada hain

select sum(od.unit_price * od.quantity) Total_sale , p.product_name 
from Products p
join OrderItems od on od.product_id = p.product_id
group by p.product_name
having sum(od.unit_price * od.quantity) > 5000

--Task 5: 6. AVG + GROUP BY
--Har category ka average product price

select c.category_name , avg(p.price) AVG_Product 
from Categories c 
join Products p on c.category_id = p.category_id 
group by c.category_name

--Task 7: COUNT + DISTINCT
--Kitne unique cities se customers hain

select distinct(city) , COUNT(*) Total_Customers from Customers
group by city
order by Total_Customers desc

--Task 8. MAX / MIN (Business Insight)
--Sabse mehnga aur sabse sasta product

select max(p.price)Max_product , p.product_name from Products p
group by p.product_name

select min(p.price)Min_product , p.product_name from Products p
group by p.product_name

--================Another Method===============

select top 1 Product_name , price from Products
order by price desc

select top 1 product_name , price from Products
order by price asc

--====================================

--Task 9: BETWEEN + DATE FILTER
--April 5 se April 15 ke beech ke orders

select * from Orders where order_date between '2024-04-05' and '2024-04-15'

--Task 10.--Wo products jinke naam mein "book" ya "shirt" ho

select * from Products where product_name like '%book%' or product_name like '%shirt%'

--11. IS NULL (Data Cleaning 🔥)
--Jin customers ka phone missing hai

select concat(first_name , ''  ,last_name) Customer_Name , isnull(phone , 'No_Phone') Cell_Number from Customers

-- 12. IN (Multi-filter)
--Sirf Karachi, Lahore, Islamabad ke customers

select * from Customers where city in ('Karachi' , 'Lahore' , 'Islamabad')

--13. CASE WHEN (Business Logic 🔥🔥)
--Total spend calculate karo per customer
--10000 → "High Value"
--5000–10000 → "Medium"
--< 5000 → "Low"

select c.Customer_id,
CONCAT(c.first_name , ' ' , c.last_name) Customer_name,
sum(od.quantity * od.unit_price) as Total_spend,
case
when sum(od.quantity * od.unit_price) > 10000 then 'High value'
when sum(od.quantity * od.unit_price) between 5000 and 10000 then 'Medium'
else 'Low'
end as CustomerSegment
from Customers c
join orders o on o.customer_id = c.customer_id
join OrderItems od on od.order_id = o.order_id
group by c.customer_id , c.first_name , c.last_name
order by Total_spend desc

--Task 14: SUBQUERY (Interview Favorite 🔥)
--Sabse zyada order dene wala customer

select c.customer_id , CONCAT(c.first_name , c.last_name) Customer_Name , count(o.order_id) Total_count
from Customers c
join Orders o on o.customer_id = c.customer_id
group by c.customer_id , c.first_name , c.last_name
having count(o.order_id) = 
( 
select MAX(total_count) from
(select count(order_id) total_count from Orders 
group by customer_id
) t );

--=============ANOTHER MESSEGE===============

select top 1 c.customer_id , CONCAT(c.first_name , c.last_name) Customer_Name , count(o.order_id) 
from Customers c
join Orders o on o.customer_id = c.customer_id
group by c.customer_id , c.first_name , c.last_name

--15. SELF JOIN (Thora tricky 😎)
--Staff aur unke managers ka relation

select s1.staff_id , s1.name as Emp_name , s2.name as manager_name
from Staff s1
left join staff s2 on s1.manager_id = s2.staff_id;

--Task 16: CROSS JOIN (Concept Clear)
--Har product ko har category ke sath combine karo (test purpose)

select * from Products 
cross join Categories

--Task 17: MULTI JOIN (REAL PROJECT 🔥🔥🔥)
--Complete order report
--Customer name
--Product name
--Quantity
--Payment method
--Order status

select CONCAT(c.first_name , ' ',c.last_name) Customer_Name, p.product_name , od.quantity , pay.payment_method , o.status
from Customers c
join Orders o on o.customer_id = c.customer_id 
join OrderItems od on od.order_id = o.order_id
join Products p on p.product_id = od.product_id
join Payments pay on pay.order_id = o.order_id

--18. VIEW (Professional Level)
--Ek reusable report banana
--Create VIEW: "Customer_Sales_Summary"
--customer name + total spend

create view Customer_Sales_Summary as
select CONCAT(c.first_name , ' ', c.last_name) Customer_Name , count(o.order_id) Total_spend
from Customers c 
join Orders o on o.customer_id = c.customer_id
group by c.first_name , c.last_name

select * from Customer_Sales_Summary

--20. INDEX (Performance Concept)
--👉 Scenario:
--Email par search fast karna
--👉 Task:
--Email column par index create karo

create index idx_customer_email on Customers(email);







