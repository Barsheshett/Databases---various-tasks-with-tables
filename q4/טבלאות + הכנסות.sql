CREATE TABLE Sportsmen(
fname VARCHAR2(100),
lname VARCHAR2(100),
country VARCHAR2(30) NOT NULL,
age NUMBER(2,0),
gender VARCHAR2(1) CHECK(gender = 'M' OR gender = 'F'),
countofrecords NUMBER(3,0) DEFAULT 0,
primary key(fname, lname)
)

CREATE TABLE Sports(
sname VARCHAR2(100),
branch VARCHAR2(100),
team VARCHAR2(3),
gender VARCHAR2(1)  CHECK(gender = 'M' OR gender = 'F'),
primary key(sname, branch,gender)
)

CREATE TABLE Competitions(
fname VARCHAR2(100),
lname VARCHAR2(100),
sname VARCHAR2(100),
branch VARCHAR2(100),
gender VARCHAR2(1) CHECK(gender = 'M' OR gender = 'F'),
takesplace DATE NOT NULL,
rank NUMBER(2,0),
record VARCHAR2(2) CHECK(record = 'OR' OR record = 'WR' OR record = 'PB' OR record = 'NR' OR record = 'NULL'),
primary key(fname,lname ,sname, branch,gender,takesplace)
)




INSERT INTO Sportsmen VALUES ('A','A', 'USA' ,20 ,'M' , 0 );
INSERT INTO Sportsmen VALUES ('A' ,'B', 'ISR' ,22 ,'F' , 0 );
INSERT INTO Sportsmen VALUES ('B' ,'A', 'TUR' ,27 ,'F' , 0 );
INSERT INTO Sportsmen VALUES ('B' ,'C', 'FRA' ,18 ,'F' , 0 );
INSERT INTO Sportsmen VALUES ('D' ,'E', 'ITA' ,31 ,'M' , 0 );
INSERT INTO Sportsmen VALUES ('C' ,'D', 'GER' ,52 ,'M' , 0);
INSERT INTO Sportsmen VALUES ('A' ,'C', 'USA' ,26 ,'F' , 0 );

INSERT INTO Sports VALUES ('Swimming' ,'100m freestyle' ,'no' ,'M' );
INSERT INTO Sports VALUES ('Swimming' ,'100m freestyle' ,'no' ,'F' );
INSERT INTO Sports VALUES ('Swimming' ,'100m relay' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Athletics' ,'Triple jump' ,'no' ,'M' );
INSERT INTO Sports VALUES ('Athletics' ,'Triple jump' ,'no' ,'F' );
INSERT INTO Sports VALUES ('Athletics' ,'100m relay' ,'yes' ,'M' );
INSERT INTO Sports VALUES ('Athletics' ,'400m relay' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Soccer' ,'NULL' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Soccer' ,'NULL' ,'yes' ,'M' );



alter SESSION set NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI'; 

INSERT INTO Competitions VALUES ( 'A' , 'B' , 'Athletics' , '100m' , 'M' , '2021/09/01 12:00'  , 2 , 'PB' );
INSERT INTO Competitions VALUES ( 'A' , 'C' , 'Athletics' , '100m' , 'F', '2021/09/02 18:00' , 1 , 'OR' );
INSERT INTO Competitions VALUES ( 'C' , 'D' , 'Swimming' , '50m butterfly' , 'M' ,'2021/09/01 12:00' , 1  , 'WR' );
INSERT INTO Competitions VALUES ( 'A' , 'A' , 'Swimming' , '50m butterfly' , 'M' ,'2021/09/01 12:00' , 2  , 'PB' );
INSERT INTO Competitions VALUES ( 'G' , 'T' , 'Athletics' , '100m' , 'F' , '2021/09/02 12:00'  ,3 , 'PB' );
INSERT INTO Competitions VALUES ( 'A' , 'B' , 'Swimming' , '50m butterfly' , 'M' , '2021/09/02 12:00'  , 2 , 'PB' );

