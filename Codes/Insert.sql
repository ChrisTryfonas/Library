-- Create the tables 'category' and 'bind' that are the simplest
INSERT INTO bind VALUES(10,'Coptic');
INSERT INTO bind VALUES(11,'Saddle Stitch');
INSERT INTO bind VALUES(12,'Case Bound');
INSERT INTO bind VALUES(13,'Otabind');

INSERT INTO category VALUES(30,'Mystery');
INSERT INTO category VALUES(31,'Adventure');
INSERT INTO category VALUES(32,'Sci-Fi');
INSERT INTO category VALUES(33,'Romance');


-- create 'employee' and 'room'
INSERT INTO employee VALUES(40,'Alisa','Anthony','F','2004-02-03',NULL);
INSERT INTO employee VALUES(41,'Catrina','Rossi','F','2010-12-03',40);
INSERT INTO employee VALUES(42,'Jane','Smith','F','2017-07-02',40);
INSERT INTO employee VALUES(43,'Jonathan','Hampton','M','2019-09-18',41);

INSERT INTO room VALUES(1,'Warehouse','B',41);
INSERT INTO room VALUES(2,'Central','B',41);
INSERT INTO room VALUES(3,'Basement','A',42);


-- create 'book' table
INSERT INTO book VALUES(101,'Fallen Shadow','Thomas Sharpe',1993,'English',30,10,1);
INSERT INTO book VALUES(102,'The Detective','Nikos Dimitriou',1976,'Greek',30,11,1);
INSERT INTO book VALUES(103,'Road In Town','Aleksander Robof',2002,'Russian',30,13,1);
INSERT INTO book VALUES(104,'Choice Of Fire','Thomas Sharpe',2000,'English',31,13,3);
INSERT INTO book VALUES(105,'Eating At The King','Darci Friedman',2014,'English',31,12,3);
INSERT INTO book VALUES(106,'Element Of Heaven','Maria Moltisante',2006,'Italian',31,10,2);
INSERT INTO book VALUES(107,'Brave North','Danna Aguilar',1981,'Spanish',31,10,3);
INSERT INTO book VALUES(108,'A New Land','Vasilis Papapetrou',2018,'Greek',32,11,1);
INSERT INTO book VALUES(109,'Friends And Darlings','Tony Barese',2001,'Italian',33,12,2);
INSERT INTO book VALUES(110,'Fortune Of Dawn','Aleksander Robof',1985,'Russian',33,12,3);


-- create 'student' table
INSERT INTO student VALUES(501,'Mary','Campos','F','Maths',1,'202-555-0176',40);
INSERT INTO student VALUES(502,'John','Long','M','Literature',5,'202-555-0138',40);
INSERT INTO student VALUES(503,'Alicia','O Reilly','F','Biology',10,'202-555-3185',41);
INSERT INTO student VALUES(504,'Kate','Fergunson','F','Physics',8,'202-555-9106',41);
INSERT INTO student VALUES(505,'Chris','Sherman','M','Biology',1,'202-555-6116',41);
INSERT INTO student VALUES(506,'Nick','Stone','M','Literature',3,'202-555-0280',42);
INSERT INTO student VALUES(507,'Casper','Dunn','M','Maths',4,'202-555-0176',42);
INSERT INTO student VALUES(508,'Mea','Rocha','F','Engineering',5,'202-555-0140',43);


-- finally create 'borrows' and 'supplier' tables
INSERT INTO borrows VALUES(508,104,'2020-03-12','2020-04-12','pending');
INSERT INTO borrows VALUES(503,109,'2020-03-22','2020-05-10','pending');
INSERT INTO borrows VALUES(508,101,'2020-11-03','2020-12-03','returned');
INSERT INTO borrows VALUES(501,108,'2020-01-08','2020-09-08','returned');
INSERT INTO borrows VALUES(506,104,'2020-04-20','2020-06-01','pending');

INSERT INTO supplier VALUES(30,'University Release Ltd',1200);
INSERT INTO supplier VALUES(30,'Books Flagship LLC',3000);
INSERT INTO supplier VALUES(30,'Booksverse Enterprise',500);
INSERT INTO supplier VALUES(31,'Scope LLC',2700);
INSERT INTO supplier VALUES(31,'University Release Ltd',1900);
INSERT INTO supplier VALUES(32,'Scope LLC',23000);
INSERT INTO supplier VALUES(33,'Booksverse Enterprise',12000);
