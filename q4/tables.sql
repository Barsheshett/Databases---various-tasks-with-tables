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






