alter SESSION set NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI'; 

CREATE TABLE Sportsmen
(
	fname VARCHAR2(100) ,
	lname VARCHAR2(100),
	country VARCHAR2(30),
	age NUMBER(2,0),
    gender VARCHAR2(1),
  CONSTRAINT Tkey1  primary key(fname, lname)
);


CREATE TABLE Sports
(
	sname VARCHAR2(100),
	branch VARCHAR2(100),
	team VARCHAR2(3),
	gender VARCHAR2(1) ,
  primary key(sname, branch, gender)
);

CREATE TABLE Competitions
(
	fname VARCHAR2(100),
	lname VARCHAR2(100),
	sname VARCHAR2(100),
	branch VARCHAR2(100), 
    gender VARCHAR2(1),
    takesplace DATE,
    rank NUMBER(2, 0),
    record VARCHAR2(2),
 primary key(fname, lname, sname, branch, gender, takesplace)
);



INSERT INTO Sportsmen VALUES ('A' ,'A' ,'USA' ,20 ,'M' );
INSERT INTO Sportsmen VALUES ('A' ,'B' ,'ISR' ,22 ,'F' );
INSERT INTO Sportsmen VALUES ('B' ,'A' ,'TUR' ,27 ,'F' );
INSERT INTO Sportsmen VALUES ('B' ,'C' ,'FRA' ,18 ,'F' );
INSERT INTO Sportsmen VALUES ('D' ,'E' ,'ITA' ,31 ,'M' );
INSERT INTO Sportsmen VALUES ('C' ,'E' ,'GER' ,52 ,'M' );
INSERT INTO Sportsmen VALUES ('A' ,'C' ,'USA' ,26 ,'F' );
INSERT INTO Sportsmen VALUES ('G' ,'T' ,'ISR' ,23 ,'M' );


INSERT INTO Sports VALUES ('Swimming' ,'100m freestyle' ,'no' ,'M' );
INSERT INTO Sports VALUES ('Swimming' ,'100m freestyle' ,'no' ,'F' );
INSERT INTO Sports VALUES ('Swimming' ,'100m relay' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Athletics' ,'Triple jump' ,'no' ,'M' );
INSERT INTO Sports VALUES ('Athletics' ,'Triple jump' ,'no' ,'F' );
INSERT INTO Sports VALUES ('Athletics' ,'100m relay' ,'yes' ,'M' );
INSERT INTO Sports VALUES ('Athletics' ,'400m relay' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Soccer' ,'NULL' ,'yes' ,'F' );
INSERT INTO Sports VALUES ('Soccer' ,'NULL' ,'yes' ,'M' );



INSERT INTO Competitions VALUES ( 'A' , 'B' , 'Athletics' , '100m' , 'M' , '2021/09/01 12:00'  , 2 , 'PB' );
INSERT INTO Competitions VALUES ( 'A' , 'C' , 'Athletics' , '100m' , 'F', '2021/09/02 18:00' , 1 , 'OR' );
INSERT INTO Competitions VALUES ( 'C' , 'D' , 'Swimming' , '50m butterfly' , 'M' ,'2021/09/01 12:00' , 1  , 'WR' );
INSERT INTO Competitions VALUES ( 'A' , 'A' , 'Swimming' , '50m butterfly' , 'M' ,'2021/09/01 12:00' , 2  , 'PB' );
INSERT INTO Competitions VALUES ( 'G' , 'T' , 'Athletics' , '100m' , 'F' , '2021/09/02 12:00'  ,3 , 'PB' );


/*---------------- QST 1 ------------------*/
SELECT s.country,  c.rank,  count(c.rank)
FROM competitions c, sportsmen s
WHERE s.fname = c.lname and s.fname = c.lname
GROUP BY country, rank

           
/*---------------- QST 2 ------------------*/
                                     
SELECT s.fname , s.lname, age
FROM sportsmen s, (SELECT d. fname, d.lname  
FROM (SELECT fname , lname
FROM competitions )d
GROUP BY  d. fname, d.lname
HAVING COUNT(*) > 1)g
WHERE g.fname = s.fname AND g.lname = s.lname

/*---------------- QST 3 ------------------*/

SELECT DISTINCT S.FNAME, S.LNAME, S.AGE
FROM SPORTSMEN S, COMPETITIONS C
WHERE C.FNAME = S.FNAME AND S.LNAME = C.LNAME AND C.RANK = 
ANY ( SELECT MIN(CO.RANK)
FROM SPORTSMEN SP, COMPETITIONS CO
WHERE SP.FNAME = CO.FNAME AND SP.LNAME = CO.LNAME AND S.COUNTRY = SP.COUNTRY)



/*---------------- QST 4 ------------------*/


SELECT sname,branch
FROM competitions
WHERE record != 'WR' AND record='OR'


/*---------------- QST 5 ------------------*/

SELECT C.SNAME, C.BRANCH  ,AVG(S.AGE)
FROM COMPETITIONS C, SPORTSMEN S
WHERE S.FNAME = C.FNAME AND S.LNAME = C.LNAME
GROUP BY C.SNAME ,C.BRANCH, c.takesplace


/*---------------- QST 6 ------------------*/


SELECT C.SNAME
FROM COMPETITIONS C, SPORTSMEN S
WHERE S.FNAME = C.FNAME AND S.LNAME = C.LNAME
GROUP BY C.SNAME
HAVING COUNT(DISTINCT S.COUNTRY) <=3
