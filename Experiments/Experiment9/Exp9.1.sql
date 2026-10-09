CREATE OR REPLACE TRIGGER trg_salary_hike
BEFORE UPDATE OF salary ON Salary_Hike
FOR EACH ROW
BEGIN
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary hike cannot exceed 15% of the old salary.'
        );
    END IF;
END;
/