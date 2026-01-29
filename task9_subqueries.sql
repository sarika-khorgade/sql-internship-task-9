USE intern_training_db;
SELECT * FROM Employees1;

ALTER TABLE Employees1
ADD COLUMN salary INT;

UPDATE Employees1 SET salary = 50000 WHERE emp_name = 'Amit Sharma';
UPDATE Employees1 SET salary = 40000 WHERE emp_name = 'Neha Patil';
UPDATE Employees1 SET salary = 60000 WHERE emp_name = 'Rahul Verma';

SELECT emp_name, salary FROM Employees1;

SELECT AVG(salary) FROM Employees1;

SELECT emp_name, salary
FROM Employees1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees1
);

SELECT emp_name,
       salary,
       (SELECT AVG(salary) FROM Employees1) AS avg_salary
FROM Employees1;

SELECT emp_name, salary
FROM (
    SELECT emp_name, salary
    FROM Employees1
) AS temp
WHERE salary > 45000;

SELECT e.emp_name, e.salary
FROM Employees1 e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees1 e2
    WHERE e2.department_id = e.department_id
);

SELECT e.emp_name, e.salary
FROM Employees1 e
JOIN (
    SELECT department_id, AVG(salary) AS avg_sal
    FROM Employees1
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_sal;

SELECT emp_name
FROM Employees1
WHERE department_id IN (
    SELECT department_id
    FROM departments
);


SELECT emp_name, salary
FROM Employees1
WHERE salary > 45000;

SELECT emp_name, salary
FROM Employees1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees1
);
SELECT emp_name, salary
FROM Employees1
WHERE salary IN (SELECT salary FROM Employees1);





























