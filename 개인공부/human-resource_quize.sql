-- 1. ��� ���� ���� ��ȸ
-- ��� ������ employee_id, first_name, last_name, salary, job_id�� ��ȸ�ϼ���.
SELECT employee_id, first_name, last_name, salary, job_id
FROM employees;

-- 2. �޿��� 5000 �̻��� ���� �˻�
-- �޿��� 5000 �̻��� �������� employee_id, first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= 5000;

-- 3. �޿� ���� ������ ���� 5�� ��ȸ
-- �޿��� ���� ������ ���� 5���� ������ employee_id, first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

-- 4. �μ��� ��� �޿� ���
-- ��� �μ����� �������� ��� �޿��� ����ϼ���. department_id���� ��� �޿�(average_salary)�� ��ȸ�ϼ���.
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- 5. �� �μ��� ���� ��
-- �� �μ��� ���� ���� ���� department_id���� ��ȸ�ϼ���.
SELECT department_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id;

-- 6. ���� �̸��� �μ� �̸� ��ȸ
-- �� ������ first_name, last_name�� �ش� ������ ���� department_name�� ��ȸ�ϼ���.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 7. �޿��� ��� �޿����� ���� ����
-- �޿��� ��ü ������ ��� �޿����� ���� �������� first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 8. ������ �޿��� 3000 �̻��� ����
-- �� �������� �޿��� 3000 �̻��� �������� first_name, last_name, salary, job_id�� ��ȸ�ϼ���.
SELECT first_name, last_name, salary, job_id
FROM employees
WHERE salary >= 3000 AND job_id IN (SELECT job_id FROM jobs);

-- 9. ������ ������ �̸� ��ȸ
-- �� ������ �ش� ������ manager_id�� ��ȸ�ϼ���. (������ ���� manager_id�� �̿��� �������� �̸��� �Բ� ��ȸ�ϼ���.)
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name,
       m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 10. ��ġ�� ���� ����
-- �������� ���� �μ��� ��ġ(city)�� �Բ� ������ �̸��� ��ȸ�ϼ���. (employees, departments, locations ���̺��� �����ϼ���.)
SELECT e.first_name || ' ' || e.last_name AS employee_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 11. �޿� �λ�� ���
-- �� ������ �޿��� ���� ���� �޿����� ���̸� ����Ͽ� �޿� �λ���� ���ϼ���.
SELECT employee_id, first_name, last_name, salary,
       salary - LAG(salary) OVER (ORDER BY hire_date) AS salary_increase
FROM employees;

-- 12. ������ �޿��� ���� ���� ����
-- �� �������� �޿��� ���� ���� ������ job_id, first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT job_id, first_name, last_name, salary
FROM (
  SELECT job_id, first_name, last_name, salary,
         RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) AS rank
  FROM employees
)
WHERE rank = 1;

-- 13. �μ��� �޿� ���� 3��
-- �� �μ����� �޿��� ���� ���� 3���� ���� ������ ��ȸ�ϼ���.
SELECT department_id, first_name, last_name, salary
FROM (
  SELECT department_id, first_name, last_name, salary,
         RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
  FROM employees
)
WHERE rank <= 3;

-- 14. ���� ���� ���� ���� ��ȸ
-- �������� ������ ������ ����� ��ȸ�ϼ���. (������ ���� ������ job_history ���̺� ����Ǿ� �ֽ��ϴ�.)
SELECT e.first_name || ' ' || e.last_name AS employee_name,
       j.job_id AS new_job, jh.job_id AS previous_job,
       jh.start_date, jh.end_date
FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
JOIN jobs j ON jh.job_id = j.job_id;

-- 15. �������� ���� �հ�
-- ��� �������� ���� �հ踦 ����Ͽ� ����ϼ���.
SELECT SUM(salary) AS total_salary
FROM employees;

-- 16. �μ��� �ְ� �޿�
-- �� �μ����� ���� �޿��� ���� ������ department_name�� �ش� ������ first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT d.department_name, e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT MAX(salary) FROM employees WHERE department_id = d.department_id);

-- 17. Ư�� ������ ���� �μ� ���� ��ȸ
-- employee_id�� 100�� ������ ���� �μ��� department_name, location�� ��ȸ�ϼ���.
SELECT d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.employee_id = 100;

-- 18. �μ� �̸��� ������ ���� ��ȸ
-- �μ� �̸��� �ش� �μ����� ���ϴ� �������� ����(job_id)�� ��ȸ�ϼ���.
SELECT d.department_name, e.first_name || ' ' || e.last_name AS employee_name, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 19. �ְ� �޿� ������ ������ �μ�
-- �޿��� ���� ���� ������ first_name, last_name, salary, job_id, department_id�� ��ȸ�ϼ���.
SELECT first_name, last_name, salary, job_id, department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 20. 10�� �̻� �ٹ��� ���� ��ȸ
-- �Ի����� 10�� �̻� �� �������� employee_id, first_name, last_name, hire_date�� ��ȸ�ϼ���.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date <= ADD_MONTHS(SYSDATE, -120);