
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
