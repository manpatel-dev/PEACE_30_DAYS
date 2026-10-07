CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    national_id VARCHAR(20)
);

CREATE OR REPLACE FUNCTION prevent_duplicate_employee()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
	IF EXISTS(
		SELECT 1
		FROM EMPLOYEE
		WHERE EMAIL = NEW.EMAIL
	) THEN 
		RAISE EXCEPTION 'THI IS % DUPLICATE EMAIL', NEW.EMAIL;
	END IF;

	IF EXISTS(
		SELECT 1
		FROM EMPLOYEE
		WHERE FULL_NAME = NEW.FULL_NAME
	) THEN 
		RAISE EXCEPTION 'ALREAY  % EXIST NAME', NEW.FULL_NAME;
	END IF;
	
	RETURN NEW;
END;
$$;


CREATE TRIGGER TRG_PREVENT_DUPLICATE_INSERT
BEFORE INSERT
ON EMPLOYEE
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_employee();

INSERT INTO employee(full_name, email, national_id)
VALUES
('ManN Patel', 'maAn@gmail.com', 'A123459');



CREATE OR REPLACE FUNCTION after_employee_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee_log(emp_id, message)
    VALUES (NEW.emp_id, 'Employee inserted successfully.');

    RETURN NEW;
END;
$$;




select * from employee
select * from employee_log

INSERT INTO employee(full_name, email, national_id)
VALUES ('M Patel', 'ma@gmail.com', 'A301');

DROP TRIGGER IF EXISTS aftre_insert_values ON employee;


CREATE TABLE employee_log (
    log_id SERIAL PRIMARY KEY,
    emp_id INT,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
$$;


CREATE TRIGGER trg_after_insert
AFTER INSERT
ON employee
FOR EACH ROW
EXECUTE FUNCTION after_employee_insert();

	