# Library-Management-System
A simple yet functional Library Management System built using SQL. This project allows you to manage books, customers, branches, employees, and track book issues and returns.
It keeps track of all information about books in the library, their cost, status and total number of books available in the library. 

## Flow of work:
## 1. Database Creation and Table Definitions (SQL):
   """ Create database named library ."""
   
       create database library;
       use library;

   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   """ Create following tables:
   
   1. Branch(Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no)
   
   2. Employee(Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table)
       
   3. Books( Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher)

   4. Customer (Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date )

   5. IssueStatus(Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should 
          refer isbn in BOOKS table)
      
   7. ReturnStatus( Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table) """
   
          create table Branch (Branch_no int primary key,Manager_id int,Branch_address varchar (50),Contact_no varchar(10));
          create table Employee (Emp_id int primary key,Emp_name varchar(20),Position varchar(25),Salary int,Branch_no int ,foreign key (Branch_no)references Branch(Branch_no));
          create table Books (ISBN int primary key,Book_title varchar(50),Category varchar (50),Rental_price int,Status enum('Yes','No'),Author varchar (50),Publisher varchar (25));
          create table Customer (Customer_id int primary key,Customer_name varchar(28),Customer_address varchar (50),Reg_date date );
          create table Issuestatus (Issue_id int primary key,Issued_cust int ,foreign key (Issued_cust) references Customer(Customer_id), Issued_book_name varchar (50),Issue_date date,
          Isbn_book int,foreign key(Isbn_book)references Books(ISBN));
          create table ReturnStatus(Return_id int primary key,Return_cust varchar (50),Return_book_name varchar (50),Return_date date,Isbn_book2 int,foreign key(Isbn_book2) references 
          Books(ISBN));
      
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
## 2.Data Insertion :

 Insert to Branch table:
 
    INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no)VALUES
    (1, 101, 'Kochi', '9876543210'),
    (2, 102, 'Trivandrum', '9876543211'),
    (3, 103, 'Calicut', '9876543212'),
    (4, 104, 'Kannur', '9876543213'),
    (5, 105, 'Palakkad', '9876543214'),
    (6, 106, 'Thrissur', '9876543215'),
    (7, 107, 'Kollam', '9876543216'),
    (8, 108, 'Kottayam', '9876543217'),
    (9, 109, 'Alappuzha', '9876543218'),
    (10, 110, 'Idukki', '9876543219');
   Display table:

      select * from Branch:
   ![Screenshot (223)](https://github.com/user-attachments/assets/8edadf97-388e-49f6-b4d2-da7d13b541df)

   
----------------------------------------------------------------------------------------------------------------------------------

 Insert to Employee table:

    INSERT INTO Employee (Emp_id, Emp_name, Position, Salary, Branch_no)VALUES
    (1, 'Alex', 'Manager', 60000, 1),
    (2, 'Ben', 'Assistant Manager', 45000, 2),
    (3, 'Charlie', 'Clerk', 25000, 3),
    (4, 'David', 'Librarian', 30000, 4),
    (5, 'Emily', 'Security Guard', 20000, 5),
    (6, 'Frank', 'Librarian', 35000, 6),
    (7, 'Grace', 'Assistant Manager', 48000, 7),
    (8, 'Henry', 'Manager', 65000, 8),
    (9, 'Isabella', 'Clerk', 28000, 9),
    (10, 'Jack', 'Security Guard', 22000, 10); 
  Display table:

    select * from Employee;
 ![Screenshot (224)](https://github.com/user-attachments/assets/a7994226-faa7-482b-bce9-ec83390ce290)

 
-----------------------------------------------------------------------------------------------------------------------------------

Insert to Books:

    INSERT INTO Books (ISBN, Book_title, Category, Rental_price, Status, Author, Publisher)VALUES
    (1, 'The Lord of the Rings', 'Fantasy', 20, 'Yes', 'J.R.R. Tolkien', 'HarperCollins'),
    (2, 'To Kill a Mockingbird', 'Fiction', 15, 'Yes', 'Harper Lee', 'HarperCollins'),
    (3, 'Pride and Prejudice', 'Romance', 10, 'No', 'Jane Austen', 'Penguin Books'),
    (4, '1984', 'Dystopian', 25, 'Yes', 'George Orwell', 'Penguin Books'),
    (5, 'The Great Gatsby', 'Classic', 18, 'No', 'F. Scott Fitzgerald', 'Scribner'),
    (6, 'The Catcher in the Rye', 'Coming-of-age', 12, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
    (7, 'Harry Potter and the Sorcerers Stone', 'Fantasy', 15, 'Yes', 'J.K. Rowling', 'Bloomsbury Publishing'),
    (8, 'The Hitchhikers Guide to the Galaxy', 'Science Fiction', 22, 'No', 'Douglas Adams', 'Pan Books'),
    (9, 'The Alchemist', 'Fantasy', 18, 'Yes', 'Paulo Coelho', 'HarperCollins'),
    (10, 'The Silent Patient', 'Thriller', 20, 'Yes', 'Alex Michaelides', 'Celadon Books');
  Display table:

    select * from Books;
  ![Screenshot (225)](https://github.com/user-attachments/assets/52daa17e-aeef-4bd4-aa30-f865bf47394d)

  
-----------------------------------------------------------------------------------------------------------------------------------


Insert to Customer table:

    INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)VALUES
    (1, 'Alice', 'Kochi', '2023-01-01'),
    (2, 'Bob', 'Trivandrum', '2023-02-15'),
    (3, 'Charlie', 'Calicut', '2023-03-10'),
    (4, 'David', 'Kannur', '2023-04-20'),
    (5, 'Emily', 'Palakkad', '2023-05-12'),
    (6, 'Frank', 'Thrissur', '2022-11-25'),
    (7, 'Grace', 'Kollam', '2022-12-10'),
    (8, 'Henry', 'Kottayam', '2023-01-18'),
    (9, 'Isabella', 'Alappuzha', '2023-02-28'),
    (10, 'Jack', 'Idukki', '2023-03-25');
  Display table:

    select * from Customer;
  ![Screenshot (226)](https://github.com/user-attachments/assets/efc7103e-1d8f-45fa-b235-221321b3b865)

  
-----------------------------------------------------------------------------------------------------------------------------------


Insert to Issuestatus:

    INSERT INTO Issuestatus (Issue_id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)VALUES
    (1, 1, 'The Lord of the Rings', '2023-11-15', 1),
    (2, 2, 'To Kill a Mockingbird', '2023-12-01', 2),
    (3, 3, 'Pride and Prejudice', '2023-11-20', 3),
    (4, 4, '1984', '2023-12-10', 4),
    (5, 5, 'The Great Gatsby', '2023-11-25', 5),
    (6, 6, 'The Catcher in the Rye', '2023-12-05', 6),
    (7, 7, 'Harry Potter and the Sorcerer\'s Stone', '2023-11-18', 7),
    (8, 8, 'The Hitchhiker\'s Guide to the Galaxy', '2023-12-02', 8),
    (9, 9, 'The Alchemist', '2023-11-22', 9),
    (10, 10, 'The Silent Patient', '2023-12-12', 10);
   Display table:

    select * from Issuestatus;
   ![Screenshot (227)](https://github.com/user-attachments/assets/816c10f8-8e6a-4f5f-ba73-714b5fdf822d)

   
-----------------------------------------------------------------------------------------------------------------------------------


Insert to ReturnStatus:

    INSERT INTO ReturnStatus (Return_id, Return_cust, Return_book_name, Return_date, Isbn_book2)VALUES
    (1, 'Alice', 'The Lord of the Rings', '2023-12-05', 1),
    (2, 'Bob', 'To Kill a Mockingbird', '2023-12-15', 2),
    (3, 'Charlie', 'Pride and Prejudice', '2023-12-10', 3),
    (4, 'David', '1984', '2023-12-20', 4),
    (5, 'Emily', 'The Great Gatsby', '2023-12-12', 5),
    (6, 'Frank', 'The Catcher in the Rye', '2023-12-25', 6),
    (7, 'Grace', 'Harry Potter and the Sorcerer\'s Stone', '2023-12-18', 7),
    (8, 'Henry', 'The Hitchhiker\'s Guide to the Galaxy', '2023-12-10', 8),
    (9, 'Isabella', 'The Alchemist', '2023-12-22', 9),
    (10, 'Jack', 'The Silent Patient', '2023-12-28', 10);
  Display table:

    select * from ReturnStatus;
   ![Screenshot (228)](https://github.com/user-attachments/assets/b0f67efc-ff18-4d62-9275-fe9bd5e34c3c)

   -----------------------------------------------------------------------------------------------------------------------------------

## 3.SQL Operations

 1. Retrieve the book title, category, and rental price of all available books.
    
        Select Book_title,Category,Rental_price from Books where Status="yes";

    -----------------------------------------------------------------------------------------------------------------------------------

2. List the employee names and their respective salaries in descending order of salary.

        select Emp_name as Employee_name,Salary from Employee order by Salary desc;
    -----------------------------------------------------------------------------------------------------------------------------------

3.Retrieve the book titles and the corresponding customers who have issued those books.

        select b.Issued_book_name as Book_title ,c.Customer_name from IssueStatus b inner JOIN Customer c on b.Issued_cust=c.Customer_id;

   -------------------------------------------------------------------------------------------------------------------------------------

4.Display the total count of books in each category.

        select Category, count(Category) as Total_books from Books group by Category;

   ------------------------------------------------------------------------------------------------------------------------------------

5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

        select Emp_name as Employee_name ,Position from employee where Salary > 50000;
   -----------------------------------------------------------------------------------------------------------------------------------

6.List the customer names who registered before 2022-01-01 and have not issued any books yet.

        select a.Customer_name as Customer_name from Customer a  inner join issuestatus b on a.Customer_id=b.Issued_cust where Reg_date > 2022-01-01 and b.Issued_book_name is null ;

   ---------------------------------------------------------------------------------------------------------------------------------------

7.Display the branch numbers and the total count of employees in each branch.

        select  a.Branch_no as Branch_number ,count(b.Emp_name) as Total_count_employee from branch a inner join employee b on a.Branch_no=b.Branch_no group by b.Branch_no ;

   ---------------------------------------------------------------------------------------------------------------------------------------

 8.Display the names of customers who have issued books in the month of December 2023. 

         select a.Customer_name from customer a inner join issuestatus b on a.Customer_id=b.Issued_cust where b.Issue_date between " 2023-12-01 " and "2023-12-30";

   -------------------------------------------------------------------------------------------------------------------------------------------


9.Retrieve book_title from book table containing fiction.

         select Book_title from books where Category="fiction";

--------------------------------------------------------------------------------------------------------------------------------------------

10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 

         select b.Branch_no as Branch_number ,count(a.Emp_id) as count_employees from branch b inner join employee a on a.Branch_no=b.Branch_no group by a.Branch_no having count(a.Branch_no)>5;

  -------------------------------------------------------------------------------------------------------------------------------------------

11.Retrieve the names of employees who manage branches and their respective branch addresses.

         select a.Emp_name as employee_name ,b.Manager_id as Manager_id ,b.Branch_address from employee a inner join branch b on a.Branch_no=b.Branch_no;

 ---------------------------------------------------------------------------------------------------------------------------------------------

12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

        select a.Customer_name from customer a inner join issuestatus b on a.Customer_id=b.issued_cust  inner join books c on c.ISBN=b.isbn_book where c.Rental_price >25 ;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



