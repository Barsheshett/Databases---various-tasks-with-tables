

------------------------------------------
---------------------A--------------------
------------------------------------------

CREATE OR REPLACE TRIGGER TrigRecords
AFTER INSERT ON COMPETITIONS
FOR EACH ROW
WHEN(NEW.RECORD != 'NULL')
BEGIN
UPDATE sportsmen s set s.countofrecords = s.countofrecords + 1 where :new.fname = s.fname and :new.lname = s.lname; 
END;
/


------------------------------------------
---------------------B--------------------
------------------------------------------




DECLARE 
     get_sname competitions.sname%type;
     get_branch competitions.branch%type;
    
    CURSOR myCursor(s VARCHAR2, b VARCHAR2) IS
                    SELECT  * FROM competitions com
                    WHERE com.sname = s and com.branch = b;
BEGIN
    get_sname :='&SNAME'; -- input from user  
    get_branch := '&BRANCH'; -- input from user  
    DBMS_OUTPUT.put_line('This report for ' || get_sname ||' ' || get_branch || ':');
    FOR temp_table IN myCursor(get_sname,get_branch)
    LOOP
        DBMS_OUTPUT.put_line(' ');
        DBMS_OUTPUT.put(temp_table.fname);
        DBMS_OUTPUT.put(' | ');
        DBMS_OUTPUT.put(temp_table.lname);
        DBMS_OUTPUT.put(' | ');
        DBMS_OUTPUT.put(temp_table.gender);
        DBMS_OUTPUT.put(' | ');
        DBMS_OUTPUT.put(temp_table.takesplace);
        DBMS_OUTPUT.put(' | ');
        DBMS_OUTPUT.put(temp_table.rank);
        DBMS_OUTPUT.put(' | ');
        DBMS_OUTPUT.put(temp_table.record);
    END LOOP;
END;
    /

------------------------------------------
---------------------C--------------------
------------------------------------------

CREATE OR REPLACE FUNCTION CountRanks(Country_Name VARCHAR2)
RETURN NUMBER IS
Counter NUMBER;
get_Countery competitions%rowtype;
Cursor myCursor(select_country VARCHAR2) IS 
SELECT DISTINCT S.COUNTRY, C.RANK FROM SPORTSMEN S, COMPETITIONS C 
WHERE S.COUNTRY = select_country AND S.FNAME = C.FNAME AND S.LNAME = C.LNAME;
BEGIN
    Counter := 0;
    FOR ANYROW IN myCursor(Country_Name)
    LOOP
        IF  ANYROW.RANK >=1 and ANYROW.RANK <=10 THEN
                    Counter := Counter + 1;
        END IF;
    END LOOP;
RETURN Counter;
END CountRanks;

--DECLARATION--
DECLARE 
    CN sportsmen.country%type;
    TEMP NUMBER;
BEGIN
     CN  := '&Enter Countery:';
     temp := CountRanks(CN);
    DBMS_OUTPUT.PUT_LINE(CN || ' | ' || temp);
END;
/

--DELETE FUNCTION
--drop function CountRanks;


------------------------------------------
---------------------4--------------------
------------------------------------------




SET SERVEROUTPUT ON;

CREATE PROCEDURE ViewToday (get_date competitions.takesplace%TYPE) AS
CURSOR myCursor (get_date competitions.takesplace%TYPE) IS
select c.sname, c.branch, c.gender, c.record  from competitions c 
where c.takesplace = get_date and (c.record = 'WR' OR c.record = 'OR');
BEGIN
  FOR ANYROW IN myCursor(get_date)
  LOOP
        DBMS_OUTPUT.put_line(ANYROW.sname || ' | ' || ANYROW.branch || ' | ' || ANYROW.gender || ' | ' || ANYROW.record );
  END LOOP;
END;
/

--DECLARATION--

BEGIN
 ViewToday('2021/09/01 12:00');
END;
/

--DELETE PROCEDURE
--drop PROCEDURE ViewToday;;