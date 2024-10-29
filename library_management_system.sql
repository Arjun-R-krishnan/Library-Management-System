
-- Creating the libraray management database 
CREATE DATABASE library_management_system;

-- Use the database
USE library_management_system;

-- 1. Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Create the Books table
CREATE TABLE Books (
    ISBN CHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(8, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 4. Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book CHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 CHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert values into branch table
INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES 
(1,101,'City central,Trivandrum','0471-2345678'),
(2,201,'Clock Tower,Kollam','0471-2345678'),
(3,301,'Kakkand,Ernakulam','0471-2345678'),
(4,401,'Thalassery,Kannur','0471-2345678'),
(5,501,'Mittayi Theruvu,Kozhikode','0471-2345678');


-- Insert  values into Employee table
INSERT INTO employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'SUKUMARAN S', 'Manager', 50000, 1),
(102, 'LALITHA KUMARI', 'Assistant Librarian', 40000, 1),
(103, 'SREEKUMAR', 'Clerk', 30000, 1),
(104, 'MUHAMMED ', 'Accountant', 45000, 1),
(105, 'VIJAYAN R', 'Librarian', 60000, 1),
(106, 'RAJAN', 'Security', 35000, 1),
(201, 'GRACE DAVISs', 'Manager', 50000, 2),
(202, 'WISLON THOMAS ', 'Librarian', 30000, 2),
(203, 'ARUN KUMAR', 'Clerk', 40000, 2),
(301, 'THOMAS KURIAN', 'Manager', 65000, 3),
(302, 'SUSHAMMA V','Librarian',62000,3),
(303,'RAMACHANDRAN S','Clerk',48000,3),
(304, 'KRISSHNA KUMAR  ','Accountant', 45000, 3),
(305, 'BALAN CK', 'Assistant Librarian', 48000, 3),
(306, 'RAJU' ,'Security',26000,3),
(401, 'HARIKRISHNAN M', 'Manager',55000,4),
(402, 'NEETHU SURESH', 'Librarian',45000,4),
(403,'BALAACHANDRAN S','Clerk',48000,4),
(404,'SOUMYA RAJENDRAN','Accountant',38000,4),
(501,'SANTHOSH KRISHNAN', 'Manager',55500,5),
(502,'DEEPAK PRADEEP' , 'Librarian',50000,5),
(503,'KAVYA RADHAKRISHNAN', 'Clerk',28000,5);


-- insert values into Books table
INSERT INTO books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9781234567891', 'Python Programming', 'Technology', 35.00, 'yes', 'John Doe', 'Tech Publishers'),
('9781234567892', 'Data Science Handbook', 'Technology', 42.00, 'no', 'Jane Smith', 'Data House'),
('9781234567893', 'Machine Learning Basics', 'Technology', 48.00, 'yes', 'Michael Brown', 'AI Press'),
('9781234567894', 'Statistics Essentials', 'Education', 22.50, 'yes', 'Linda Green', 'Education World'),
('9781234567895', 'Calculus I', 'Mathematics', 30.00, 'no', 'Tom White', 'Math Group'),
('9781234567896', 'World History', 'History', 32.00, 'yes', 'Sarah Blue', 'History Makers'),
('9781234567897', 'Introduction to Philosophy', 'Philosophy', 17.75, 'no', 'Robert Black', 'Philosophy Publishers'),
('9781234567898', 'Modern Economics', 'Economics', 45.50, 'yes', 'Jessica Yellow', 'Econ Press'),
('9781234567899', 'Digital Marketing', 'Business', 50.25, 'yes', 'Daniel Green', 'Marketing Inc.'),
('9781234567800', 'Introduction to Psychology', 'Psychology', 37.75, 'no', 'Emma Purple', 'Psycho Reads'),
('9781234567801', 'Advanced Python', 'Technology', 41.20, 'yes', 'Alice Brown', 'Code World'),
('9781234567802', 'Quantum Physics', 'Science', 49.50, 'no', 'David Grey', 'Science Today'),
('9781234567803', 'Ancient Civilizations', 'History', 20.40, 'yes', 'Lisa White', 'Past Publishers'),
('9781234567804', 'Business Ethics', 'Business', 28.25, 'no', 'Mark Red', 'Biz House'),
('9781234567805', 'Behavioral Economics', 'Economics', 43.75, 'yes', 'Nina Green', 'Economic Insights'),
('9781234567806', 'Philosophical Questions', 'Philosophy', 19.95, 'yes', 'Oscar Blue', 'Thoughtful Press'),
('9781234567807', 'Calculus II', 'Mathematics', 33.20, 'no', 'Tom White', 'Math Group'),
('9781234567808', 'Sociology Basics', 'Social Science', 26.85, 'yes', 'Anna Brown', 'Social World'),
('9781234567809', 'Business Strategies', 'Business', 39.10, 'yes', 'Patricia Gold', 'Strategy Press'),
('9781234567810', 'Introduction to Machine Learning', 'Technology', 44.85, 'no', 'Chris Black', 'ML Corp'),
('9781234567811', 'World War II', 'History', 24.60, 'yes', 'Nancy Grey', 'History Makers'),
('9781234567812', 'Mind and Brain', 'Psychology', 38.95, 'no', 'Peter Violet', 'Mind Matters'),
('9781234567813', 'Linear Algebra', 'Mathematics', 31.40, 'yes', 'Harry Green', 'Math Solutions'),
('9781234567814', 'Political Science Fundamentals', 'Social Science', 29.95, 'yes', 'Alice White', 'Gov Press'),
('9781234567815', 'Entrepreneurial Mindset', 'Business', 47.00, 'no', 'David Gold', 'Entrepreneurs Inc.');


-- Insert values into  customer
INSERT INTO customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1000, 'Akhil Menon', 'Thiruvananthapuram', '2020-01-15'),
(1001, 'Vishnu Raj', 'Kochi', '2020-03-22'),
(1002, 'Ravi Nair', 'Kollam', '2020-05-10'),
(1003, 'Deepa Suresh', 'Thrissur', '2020-07-01'),
(1004, 'Lekshmi Pillai', 'Kozhikode', '2020-08-18'),
(1005, 'Manu Krishnan', 'Kannur', '2020-10-05'),
(1006, 'Sreejith Ramesh', 'Palakkad', '2021-01-12'),
(1007, 'Anjana Nair', 'Alappuzha', '2021-02-25'),
(1008, 'Rakesh Varma', 'Pathanamthitta', '2021-04-30'),
(1009, 'Sree Lakshmi', 'Malappuram', '2021-06-15'),
(1010, 'Divya Mohan', 'Idukki', '2021-09-05'),
(1011, 'Ajith Kumar', 'Kasaragod', '2021-11-20'),
(1012, 'Arya Sivan', 'Kottayam', '2022-02-10'),
(1013, 'Nikhil Pradeep', 'Kannur', '2022-04-18'),
(1014, 'Revathy Haridas', 'Ernakulam', '2022-06-24'),
(1015, 'Suresh Chandran', 'Kollam', '2022-08-30'),
(1016, 'Bindu Nambiar', 'Thrissur', '2022-10-15'),
(1017, 'Sajan Kurian', 'Alappuzha', '2023-01-07'),
(1018, 'Priya Ramesh', 'Thiruvananthapuram', '2023-03-12'),
(1019, 'Arjun Vijayan', 'Kochi', '2023-05-23');


-- Insert  values into IssueStatus
INSERT INTO issueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1000, 'Python Programming', '2023-06-01', '9781234567891'),
(2, 1001, 'Data Science Handbook', '2023-06-05', '9781234567892'),
(3, 1002, 'Machine Learning Basics', '2023-06-10', '9781234567893'),
(4, 1003, 'Statistics Essentials', '2023-06-15', '9781234567894'),
(5, 1004, 'Calculus I', '2023-06-20', '9781234567895'),
(6, 1005, 'World History', '2023-06-25', '9781234567896'),
(7, 1006, 'Introduction to Philosophy', '2023-07-01', '9781234567897'),
(8, 1007, 'Modern Economics', '2023-07-05', '9781234567898'),
(9, 1008, 'Digital Marketing', '2023-07-10', '9781234567899'),
(10, 1009, 'Introduction to Psychology', '2023-07-15', '9781234567800'),
(11, 1010, 'Advanced Python', '2023-07-20', '9781234567801'),
(12, 1011, 'Quantum Physics', '2023-07-25', '9781234567802'),
(13, 1012, 'Ancient Civilizations', '2023-08-01', '9781234567803'),
(14, 1013, 'Business Ethics', '2023-08-05', '9781234567804'),
(15, 1014, 'Behavioral Economics', '2023-08-10', '9781234567805');


-- Insert values into ReturnStatus
INSERT INTO returnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1000, 'Python Programming', '2023-07-01', '9781234567891'),
(2, 1003, 'Statistics Essentials', '2023-07-20', '9781234567894'),
(3, 1005, 'World History', '2023-08-01', '9781234567896'),
(4, 1007, 'Introduction to Philosophy', '2023-08-10', '9781234567897'),
(5, 1011, 'Quantum Physics', '2023-08-20', '9781234567802'),
(6, 1013, 'Business Ethics', '2023-09-01', '9781234567804');




 -- Retrieve the book title, category, and rental price of all available books
 
 SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- List the employee names and their respective salaries in descending order of salary

SELECT  * FROM employee ORDER BY Salary DESC;


-- Retrieve the book titles and the corresponding customers who have issued those books

SELECT books.Book_title, customer.Customer_name
FROM books
INNER JOIN issuestatus ON books.ISBN = issuestatus.Isbn_book
INNER JOIN customer ON issuestatus.Issued_cust = customer.Customer_Id;

-- Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;


-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000

SELECT Emp_name AS 'Name of Employee' , Position FROM employee WHERE Salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name ,Reg_date AS 'Registered Date'
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
    SELECT Issued_cust
    FROM IssueStatus
);

-- Display the branch numbers and the total count of employees in each branch

SELECT Branch_no , COUNT(*) AS 'No of Employees' 
FROM employee
GROUP BY Branch_no;


-- Display the names of customers who have issued books in the month of June 2023
SELECT customer.Customer_name 
FROM issuestatus
JOIN customer ON issuestatus.Issued_cust = customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';


-- Retrieve book_title from book table containing history

SELECT Book_title AS 'Ttile of book About History' 
FROM books
WHERE Category = 'History';


-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT Branch_no, COUNT(*) AS 'Employee Count'
FROM employee
GROUP BY Branch_no HAVING COUNT(*)>5;


-- Retrieve the names of employees who manage branches and their respective branch addresses

SELECT employee.Emp_name AS 'Name Of Employee', branch.Branch_address AS 'Branch Address'
FROM employee
JOIN branch ON employee.Branch_no = branch.Branch_no
WHERE employee.Position = 'Manager';


-- Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT customer.Customer_name AS 'Customers rented books above 25'
FROM customer
JOIN issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
JOIN books ON issuestatus.Isbn_book = books.ISBN
WHERE books.Rental_Price > 25;


