CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  dept VARCHAR2(25) NOT NULL,
  salary INTEGER
);
INSERT INTO EMPLOYEE VALUES (0001, 'Sales', 1000);
INSERT INTO EMPLOYEE VALUES (0002, 'Accounting', 2000);
INSERT INTO EMPLOYEE VALUES (0003, 'Sales', 50);
DECLARE
  CURSOR emp_cursor IS
    SELECT empId, salary
    FROM EMPLOYEE;

  v_empId   EMPLOYEE.empId%TYPE;
  v_salary  EMPLOYEE.salary%TYPE;
  salary_zero EXCEPTION;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_empId, v_salary;
    EXIT WHEN emp_cursor%NOTFOUND;

    IF v_salary = 0 THEN
      RAISE salary_zero;
    ELSE
      UPDATE EMPLOYEE
      SET salary = v_salary * 1.10
      WHERE empId = v_empId;
    END IF;
  END LOOP;

  CLOSE emp_cursor;

EXCEPTION
  WHEN salary_zero THEN
    DBMS_OUTPUT.PUT_LINE('Salary is zero. Increment not possible.');

END;
/

SELECT * FROM EMPLOYEE;
