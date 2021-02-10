
-- /Basic Queries/

-- 1. Find all book titles with their authors
SELECT title,author FROM book;

-- 2. Display all the book titles in alphabetical order
SELECT title FROM book
ORDER BY title;

-- 3. Find all the books that are written in English
SELECT * FROM book 
WHERE lang = "English";

-- 4. Find how many books are in each language.
SELECT COUNT(book_id),lang FROM book
GROUP BY lang; 

-- 5. Find all the authors of our library
SELECT DISTINCT author FROM book; 

-- 6. Count number of female and male students
SELECT COUNT(std_id) AS total,gender FROM student
GROUP BY gender; 


-- /A bit advanced queries/

-- 7. Display all in one list the last name of students and employees
SELECT student.last_name FROM student
UNION
SELECT employee.last_name FROM employee;

-- 8. Display side by side each store with each manager name
SELECT room.room_name, employee.first_name, employee.last_name
FROM room
JOIN employee
WHERE mgr_id = emp_id; 

-- 9. Find all female employees that work in library more than 5 years
SELECT * FROM employee 
WHERE gender = 'F' AND DATEDIFF(CURRENT_DATE(),start_date)>5*365.25; -- DATEDIFF gives result in days so I corvert it.

-- 10. Display all students (first and last name) along with the duration of borrowing in days.
SELECT student.first_name, student.last_name, book.title, DATEDIFF(borrows.end_day,borrows.start_day) AS duration
FROM student
JOIN borrows
ON student.std_id = borrows.std_id
JOIN book
ON book.book_id = borrows.book_id
ORDER BY DATEDIFF(borrows.end_day,borrows.start_day);

-- 11. Give book title with category name, room that is stored and the binding of each book
SELECT book.title, cat_name, bind_type room_name  
FROM book
JOIN category
ON book.cat_id = category.cat_id
JOIN bind
ON book.bind_id = bind.bind_id
JOIN room
ON book.room_id = room.room_id;  

-- 12. Give a list of all suppliers and their total worth of product selling to the library (carefull that 1 supplier may sell 2+ categories of books)
SELECT supplier_name, SUM(supplier.sales)
FROM supplier
GROUP BY supplier_name;


-- WILDCARDS
-- 13. Find all suppliers that their bussiness is LLC type
SELECT DISTINCT supplier_name
FROM supplier
WHERE supplier_name LIKE '%LLC';

-- 14. Find all student id's where the last part of their phone starts with 0
SELECT std_id FROM student
WHERE phone LIKE '___-___-0___';


-- NESTED QUERIES / JOINS / UNIONS
-- 15. Find all students last names that borrowed a book on March
SELECT student.last_name FROM student
WHERE student.std_id IN (
    SELECT borrows.std_id FROM borrows
    WHERE borrows.start_day LIKE '____-03-__'
);
SELECT * from borrows;

-- 16. Find all books that are stored in the room with manager Catrina Rossi. 
SELECT book.title FROM book
WHERE book.room_id IN (
    SELECT room.room_id FROM room
    WHERE room.mgr_id IN (
        SELECT employee.emp_id FROM employee
        WHERE employee.first_name = 'Catrina' AND employee.last_name = 'Rossi'
    )
);

-- 17. Find how many students of 5th semester have borrowed books
SELECT DISTINCT student.first_name, student.last_name 
FROM student
JOIN borrows
ON student.std_id = borrows.std_id
WHERE student.semester = 5;

-- 18. Give an average of all money that the library spent on Mystery books
SELECT ROUND(AVG(supplier.sales)) AS average FROM supplier
WHERE supplier.cat_id IN(
    SELECT category.cat_id FROM category
    WHERE category.cat_name = 'Mystery'
);

-- 19. Find the students(last names) that have not returned their books and they will be panalized
SELECT student.last_name FROM student
WHERE std_id IN(
    SELECT std_id FROM borrows
    WHERE borrows.statous = 'pending' AND (borrows.end_day-CURRENT_DATE())<0
);

-- 20. Find number of books that each student has borrowed.
SELECT student.last_name, COUNT(borrows.book_id)
FROM student
JOIN borrows
ON borrows.std_id = student.std_id
GROUP BY borrows.std_id;

-- 21. Find the categories name with sales more than 4,600 euros
SELECT category.cat_name AS category, SUM(supplier.sales) AS total_sales
FROM category
JOIN supplier
ON supplier.cat_id = category.cat_id
GROUP BY supplier.cat_id
HAVING SUM(supplier.sales)>4600;

-- 22. Find how many books are borrowed for each category
SELECT category.cat_name AS category, COUNT(book.cat_id) AS borrowed 
FROM book
JOIN category
ON category.cat_id = book.cat_id
JOIN borrows
ON book.book_id = borrows.book_id
GROUP BY book.cat_id;

-- 23. Find the students that are assisted by the least experienced woman employee
SELECT student.first_name, student.last_name 
FROM student
WHERE student.assist_id = (
    SELECT employee.emp_id
    FROM employee
    WHERE employee.start_date = (
        SELECT MAX(employee.start_date) 
        FROM employee
        WHERE employee.gender = 'F' /*ok*/
    ) 
);

-- 24. Find the category(name) that got supplied with the lowest worth of product.  
SELECT category.cat_name, SUM(supplier.sales) AS sales
FROM supplier
JOIN category
ON supplier.cat_id = category.cat_id
GROUP BY supplier.cat_id       
HAVING SUM(supplier.sales) = (  
    SELECT MIN(category_sum_sales) 
    FROM (
        SELECT SUM(supplier.sales) category_sum_sales   
        FROM supplier
        GROUP BY supplier.cat_id
    )
    tab 
);