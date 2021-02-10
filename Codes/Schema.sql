-- At first create the tables bind and category that have no foreign keys
CREATE TABLE bind(
    bind_id INT PRIMARY KEY,
    bind_type VARCHAR(15)
);

CREATE TABLE category(
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(15)
);

-- Then create employee table that has a foreing key that points back to itself
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(1),
    start_date DATE,
    super_id INT
);

ALTER TABLE employee
ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;



-- Now create all tables who have foreing keys that point to already existing tables
CREATE TABLE room(
    room_id INT PRIMARY KEY,
    room_name VARCHAR(15),
    flooor VARCHAR(1),
    mgr_id INT,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
DESCRIBE room;

CREATE TABLE book(
    book_id INT PRIMARY KEY,
    title VARCHAR(30),
    author VARCHAR(30),
    publ_year INT,
    lang VARCHAR(15),
    cat_id INT,
    bind_id INT,
    room_id INT,
    FOREIGN KEY (cat_id) REFERENCES category(cat_id) ON DELETE SET NULL,
    FOREIGN KEY (bind_id) REFERENCES bind(bind_id) ON DELETE SET NULL,
    FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE SET NULL
);
describe book;


CREATE TABLE student(
    std_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(1),
    dept VARCHAR(20),
    semester INT,
    phone VARCHAR(12),
    assist_id INT,
    FOREIGN KEY (assist_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);


CREATE TABLE borrows(
    std_id INT, 
    book_id INT,
    start_day DATE,
    end_day DATE,
    statous VARCHAR(12),
    FOREIGN KEY (std_id) REFERENCES student(std_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    PRIMARY KEY(std_id,book_id)
);

CREATE TABLE supplier(
    cat_id INT,  
    supplier_name VARCHAR(40),
    sales INT,
    FOREIGN KEY (cat_id) REFERENCES category(cat_id) ON DELETE CASCADE,
    PRIMARY KEY(cat_id,supplier_name)
);

