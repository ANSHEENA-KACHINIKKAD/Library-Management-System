--  LIBRARY MANAGEMENT SYSTEM--------------------------------------
 create database library;
 use library;
 
 -- Table creation---------------------------------------------------
 create table Branch (Branch_no int primary key,Manager_id int,Branch_address varchar (50),Contact_no varchar(10));
 create table Employee (Emp_id int primary key,Emp_name varchar(20),Position varchar(25),Salary int,Branch_no int ,foreign key (Branch_no)references Branch(Branch_no));
 create table Books (ISBN int primary key,Book_title varchar(50),Category varchar (50),Rental_price int,Status enum('Yes','No'),Author varchar (50),Publisher varchar (25));
 create table Customer (Customer_id int primary key,Customer_name varchar(28),Customer_address varchar (50),Reg_date date );
 create table Issuestatus (Issue_id int primary key,Issued_cust int ,foreign key (Issued_cust) references Customer(Customer_id), Issued_book_name varchar (50),Issue_date date,
  Isbn_book int,foreign key(Isbn_book)references Books(ISBN));
create table ReturnStatus(Return_id int primary key,Return_cust varchar (50),Return_book_name varchar (50),Return_date date,Isbn_book2 int,foreign key(Isbn_book2) references 
Books(ISBN));

-- Values insertion to the table---------------------------------------
INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES
  (1, 101, 'Kochi', '9876543210'),
  (2, 102, 'Trivandrum', '9876543211'),
  (3, 103, 'Calicut', '9876543212'),
  (4, 104, 'Kannur', '9876543213'),
  (5, 105, 'Palakkad', '9876543214'),
  (6, 106, 'Thrissur', '9876543215'),
  (7, 107, 'Kollam', '9876543216'),
  (8, 108, 'Kottayam', '9876543217'),
  (9, 109, 'Alappuzha', '9876543218'),
  (10, 110, 'Idukki', '9876543219'); -- ---------------------------insert values to Branch table
  
  INSERT INTO Employee (Emp_id, Emp_name, Position, Salary, Branch_no)
VALUES
  (1, 'Alex', 'Manager', 60000, 1),
  (2, 'Ben', 'Assistant Manager', 45000, 2),
  (3, 'Charlie', 'Clerk', 25000, 3),
  (4, 'David', 'Librarian', 30000, 4),
  (5, 'Emily', 'Security Guard', 20000, 5),
  (6, 'Frank', 'Librarian', 35000, 6),
  (7, 'Grace', 'Assistant Manager', 48000, 7),
  (8, 'Henry', 'Manager', 65000, 8),
  (9, 'Isabella', 'Clerk', 28000, 9),
  (10, 'Jack', 'Security Guard', 22000, 10); -- ---------------------------insert values to Employee table
  
  INSERT INTO Books (ISBN, Book_title, Category, Rental_price, Status, Author, Publisher)
VALUES
  (1, 'The Lord of the Rings', 'Fantasy', 20, 'Yes', 'J.R.R. Tolkien', 'HarperCollins'),
  (2, 'To Kill a Mockingbird', 'Fiction', 15, 'Yes', 'Harper Lee', 'HarperCollins'),
  (3, 'Pride and Prejudice', 'Romance', 10, 'No', 'Jane Austen', 'Penguin Books'),
  (4, '1984', 'Dystopian', 25, 'Yes', 'George Orwell', 'Penguin Books'),
  (5, 'The Great Gatsby', 'Classic', 18, 'No', 'F. Scott Fitzgerald', 'Scribner'),
  (6, 'The Catcher in the Rye', 'Coming-of-age', 12, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
  (7, 'Harry Potter and the Sorcerers Stone', 'Fantasy', 15, 'Yes', 'J.K. Rowling', 'Bloomsbury Publishing'),
  (8, 'The Hitchhikers Guide to the Galaxy', 'Science Fiction', 22, 'No', 'Douglas Adams', 'Pan Books'),
  (9, 'The Alchemist', 'Fantasy', 18, 'Yes', 'Paulo Coelho', 'HarperCollins'),
  (10, 'The Silent Patient', 'Thriller', 20, 'Yes', 'Alex Michaelides', 'Celadon Books');-- ------------insert values to Books table
  
  INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES
  (1, 'Alice', 'Kochi', '2023-01-01'),
  (2, 'Bob', 'Trivandrum', '2023-02-15'),
  (3, 'Charlie', 'Calicut', '2023-03-10'),
  (4, 'David', 'Kannur', '2023-04-20'),
  (5, 'Emily', 'Palakkad', '2023-05-12'),
  (6, 'Frank', 'Thrissur', '2022-11-25'),
  (7, 'Grace', 'Kollam', '2022-12-10'),
  (8, 'Henry', 'Kottayam', '2023-01-18'),
  (9, 'Isabella', 'Alappuzha', '2023-02-28'),
  (10, 'Jack', 'Idukki', '2023-03-25');-- -----------------insert values to Customer table
  
  INSERT INTO Issuestatus (Issue_id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
  (1, 1, 'The Lord of the Rings', '2023-11-15', 1),
  (2, 2, 'To Kill a Mockingbird', '2023-12-01', 2),
  (3, 3, 'Pride and Prejudice', '2023-11-20', 3),
  (4, 4, '1984', '2023-12-10', 4),
  (5, 5, 'The Great Gatsby', '2023-11-25', 5),
  (6, 6, 'The Catcher in the Rye', '2023-12-05', 6),
  (7, 7, 'Harry Potter and the Sorcerer\'s Stone', '2023-11-18', 7),
  (8, 8, 'The Hitchhiker\'s Guide to the Galaxy', '2023-12-02', 8),
  (9, 9, 'The Alchemist', '2023-11-22', 9),
  (10, 10, 'The Silent Patient', '2023-12-12', 10);-- ------------------------insert values to IssueStatus table
  
  INSERT INTO ReturnStatus (Return_id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
  (1, 'Alice', 'The Lord of the Rings', '2023-12-05', 1),
  (2, 'Bob', 'To Kill a Mockingbird', '2023-12-15', 2),
  (3, 'Charlie', 'Pride and Prejudice', '2023-12-10', 3),
  (4, 'David', '1984', '2023-12-20', 4),
  (5, 'Emily', 'The Great Gatsby', '2023-12-12', 5),
  (6, 'Frank', 'The Catcher in the Rye', '2023-12-25', 6),
  (7, 'Grace', 'Harry Potter and the Sorcerer\'s Stone', '2023-12-18', 7),
  (8, 'Henry', 'The Hitchhiker\'s Guide to the Galaxy', '2023-12-10', 8),
  (9, 'Isabella', 'The Alchemist', '2023-12-22', 9),
  (10, 'Jack', 'The Silent Patient', '2023-12-28', 10);-- -----------------------insert values to ReturnStatus table
  
  

-- Display all tables-------------------------------------------------
select * from Branch;
select * from Employee;
select * from Books;
select * from Customer;
select * from IssueStatus;
select * from ReturnStatus;

-- exercise-1:Retrieve the book title,category and rental price of all available book-----------------------------
 Select Book_title,Category,Rental_price from Books where Status="yes";

-- exercise-2: List the employee names and their respective salaries in descending order of salary.----------------
select Emp_name as Employee_name,Salary from Employee order by Salary desc;

-- exercise-3:Retrieve the book titles and the corresponding customers who have issued those books. -------------
select b.Issued_book_name as Book_title ,c.Customer_name from IssueStatus b inner JOIN Customer c on b.Issued_cust=c.Customer_id;

-- exercise-4:Display the total count of books in each category.
select Category, count(Category) as Total_books from Books group by Category;

-- exercise-5: Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.-------
select Emp_name as Employee_name ,Position from employee where Salary > 50000;

-- exercise-6: List the customer names who registered before 2022-01-01 and have not issued any books yet.-----------
select a.Customer_name as Customer_name from Customer a  inner join issuestatus b on a.Customer_id=b.Issued_cust where Reg_date > 2022-01-01 and b.Issued_book_name is null ;

-- exercise-7:Display the branch numbers and the total count of employees in each branch.---------------------------
 select  a.Branch_no as Branch_number ,count(b.Emp_name) as Total_count_employee from branch a inner join employee b on a.Branch_no=b.Branch_no group by b.Branch_no ;
 
 -- exercise-8:Display the names of customers who have issued books in the month of december 2023.
  select a.Customer_name from customer a inner join issuestatus b on a.Customer_id=b.Issued_cust where b.Issue_date between " 2023-12-01 " and "2023-12-30";

-- exercise-9:Retrieve book_title from book table containing fiction.
select Book_title from books where Category="fiction";

-- exercise-10:Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select b.Branch_no as Branch_number ,count(a.Emp_id) as count_employees from branch b inner join employee a on a.Branch_no=b.Branch_no group by a.Branch_no having count(a.Branch_no)>5;

-- exercise-11:Retrieve the names of employees who manage branches and their respective branch addresses.
select a.Emp_name as employee_name ,b.Manager_id as Manager_id ,b.Branch_address from employee a inner join branch b on a.Branch_no=b.Branch_no;

-- exercise-12:Display the names of customers who have issued books with a rental price higher than Rs. 25
select a.Customer_name from customer a inner join issuestatus b on a.Customer_id=b.issued_cust  inner join books c on c.ISBN=b.isbn_book where c.Rental_price >25 ;
