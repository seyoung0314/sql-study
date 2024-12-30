-- 1. ��� ���� ���� ��ȸ
-- ��� ������ employee_id, first_name, last_name, salary, job_id�� ��ȸ�ϼ���.
SELECT 
    employee_id
    ,first_name
    ,last_name
    ,salary
    ,job_id
FROM EMPLOYEES
;

-- 2. �޿��� 5000 �̻��� ���� �˻�
-- �޿��� 5000 �̻��� �������� employee_id, first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT * FROM employees;

SELECT 
    employee_id
    ,first_name
    ,last_name
    ,salary
FROM EMPLOYEES
WHERE salary>5000
;

-- 3. �޿� ���� ������ ���� 5�� ��ȸ
-- �޿��� ���� ������ ���� 5���� ������ employee_id, first_name, last_name, salary�� ��ȸ�ϼ���.

-- ����Ŭ 12c ���� �̻�
--SELECT 
--    employee_id
--    ,first_name
--    ,last_name
--    ,salary
--FROM EMPLOYEES
--ORDER BY salary DESC
--FETCH FIRST 3 ROWS ONLY
--;

-- ����Ŭ 11����
SELECT employee_id, first_name, last_name, salary
FROM (
    SELECT employee_id, first_name, last_name, salary
    FROM EMPLOYEES
    ORDER BY salary DESC
)
WHERE ROWNUM <= 3;

-- 4. �μ��� ��� �޿� ���
-- ��� �μ����� �������� ��� �޿��� ����ϼ���. department_id���� ��� �޿�(average_salary)�� ��ȸ�ϼ���.
SELECT 
    department_id
    ,avg(salary) as average_salary
FROM employees
GROUP BY department_id
;

-- 5. �� �μ��� ���� ��
-- �� �μ��� ���� ���� ���� department_id���� ��ȸ�ϼ���.
select * from employees;

select 
    department_id
    ,COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY department_id
;

-- 6. ���� �̸��� �μ� �̸� ��ȸ
-- �� ������ first_name, last_name�� �ش� ������ ���� department_name�� ��ȸ�ϼ���.
select *from departments;

SELECT
    first_name
    ,last_name
    ,department_name
FROM employees
JOIN departments
   USING (department_id)
;

SELECT
    E.first_name
    ,E.last_name
    ,D.department_name
FROM employees E, departments D
WHERE e.department_id = d.department_id
;

-- 7. �޿��� ��� �޿����� ���� ����
-- �޿��� ��ü ������ ��� �޿����� ���� �������� first_name, last_name, salary�� ��ȸ�ϼ���.

SELECT 
    first_name
    ,last_name
    ,salary 
FROM employees
WHERE salary >(Select avg(salary) from employees)
ORDER BY 3
;

-- 8. ������ �޿��� 3000 �̻��� ����
-- �� �������� �޿��� 3000 �̻��� �������� first_name, last_name, salary, job_id�� ��ȸ�ϼ���.
SELECT
    first_name,last_name,salary,job_id 
FROM employees
WHERE salary >= 3000
;

-- 9. ������ ������ �̸� ��ȸ
-- �� ������ �ش� ������ manager_id�� ��ȸ�ϼ���. (������ ���� manager_id�� �̿��� �������� �̸��� �Բ� ��ȸ�ϼ���.)
select * from employees;
select * from departments;

select 
    e.first_name
    ,e.last_name
--    ,e.manager_id
    ,m.first_name as manager_first
    ,e.last_name as manager_last
from employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
;
-- 10. ��ġ�� ���� ����
-- �������� ���� �μ��� ��ġ(city)�� �Բ� ������ �̸��� ��ȸ�ϼ���. (employees, departments, locations ���̺��� �����ϼ���.)


SELECT
    * FROM employees;
SELECT
    * FROM departments;
SELECT
    * FROM locations;
    
select 
    e.first_name||' '||last_name as name
    , d.department_id
    ,l.city
from employees e
    JOIN departments d
      on e.department_id = d.department_id
    JOIN locations l
       on d.location_id = l.location_id
       ;

-- 11. �޿� �λ�� ���
-- �� ������ �޿��� ���� ���� �޿����� ���̸� ����Ͽ� �޿� �λ���� ���ϼ���.

select *
from employees order by hire_date;

select * from jobs;

select 
    salary - LAG(salary) over (order by hire_date) as increase
from employees ;

select 
    first_name||' '||last_name as name
    , job_id
    ,RANK() over (PARTITION BY  job_id order by salary) as rank
from employees ;

-- 12. ������ �޿��� ���� ���� ����
-- �� �������� �޿��� ���� ���� ������ job_id, first_name, last_name, salary�� ��ȸ�ϼ���.
-- (���� ����)

-- 13. �μ��� �޿� ���� 3��
-- �� �μ����� �޿��� ���� ���� 3���� ���� ������ ��ȸ�ϼ���.
-- (���� ����)

-- 14. ���� ���� ���� ���� ��ȸ
-- �������� ������ ������ ����� ��ȸ�ϼ���. (������ ���� ������ job_history ���̺� ����Ǿ� �ֽ��ϴ�.)
-- (���� ����)

-- 15. �������� ���� �հ�
-- ��� �������� ���� �հ踦 ����Ͽ� ����ϼ���.
-- (���� ����)

-- 16. �μ��� �ְ� �޿�
-- �� �μ����� ���� �޿��� ���� ������ department_name�� �ش� ������ first_name, last_name, salary�� ��ȸ�ϼ���.
-- (���� ����)

-- 17. Ư�� ������ ���� �μ� ���� ��ȸ
-- employee_id�� 100�� ������ ���� �μ��� department_name, location�� ��ȸ�ϼ���.
-- (���� ����)

-- 18. �μ� �̸��� ������ ���� ��ȸ
-- �μ� �̸��� �ش� �μ����� ���ϴ� �������� job_id�� ��ȸ�ϼ���.
-- (���� ����)

-- 19. �ְ� �޿� ������ ������ �μ�
-- �޿��� ���� ���� ������ first_name, last_name, salary, job_id, department_id�� ��ȸ�ϼ���.
-- (���� ����)

-- 20. 10�� �̻� �ٹ��� ���� ��ȸ
-- �Ի����� 10�� �̻� �� �������� employee_id, first_name, last_name, hire_date�� ��ȸ�ϼ���.
-- (���� ����)
