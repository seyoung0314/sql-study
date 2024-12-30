-- 1. 모든 직원 정보 조회
-- 모든 직원의 employee_id, first_name, last_name, salary, job_id를 조회하세요.
SELECT employee_id, first_name, last_name, salary, job_id
FROM employees;

-- 2. 급여가 5000 이상인 직원 검색
-- 급여가 5000 이상인 직원들의 employee_id, first_name, last_name, salary를 조회하세요.
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= 5000;

-- 3. 급여 높은 순서로 상위 5명 조회
-- 급여가 높은 순으로 상위 5명의 직원의 employee_id, first_name, last_name, salary를 조회하세요.
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

-- 4. 부서별 평균 급여 계산
-- 모든 부서에서 직원들의 평균 급여를 계산하세요. department_id별로 평균 급여(average_salary)를 조회하세요.
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- 5. 각 부서별 직원 수
-- 각 부서에 속한 직원 수를 department_id별로 조회하세요.
SELECT department_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY department_id;

-- 6. 직원 이름과 부서 이름 조회
-- 각 직원의 first_name, last_name과 해당 직원이 속한 department_name을 조회하세요.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 7. 급여가 평균 급여보다 높은 직원
-- 급여가 전체 직원의 평균 급여보다 높은 직원들의 first_name, last_name, salary를 조회하세요.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 8. 직무별 급여가 3000 이상인 직원
-- 각 직무별로 급여가 3000 이상인 직원들의 first_name, last_name, salary, job_id를 조회하세요.
SELECT first_name, last_name, salary, job_id
FROM employees
WHERE salary >= 3000 AND job_id IN (SELECT job_id FROM jobs);

-- 9. 직원과 관리자 이름 조회
-- 각 직원과 해당 직원의 manager_id를 조회하세요. (직원이 가진 manager_id를 이용해 관리자의 이름도 함께 조회하세요.)
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name,
       m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 10. 위치별 직원 정보
-- 직원들이 속한 부서의 위치(city)와 함께 직원의 이름을 조회하세요. (employees, departments, locations 테이블을 조인하세요.)
SELECT e.first_name || ' ' || e.last_name AS employee_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 11. 급여 인상액 계산
-- 각 직원의 급여에 대해 이전 급여와의 차이를 계산하여 급여 인상액을 구하세요.
SELECT employee_id, first_name, last_name, salary,
       salary - LAG(salary) OVER (ORDER BY hire_date) AS salary_increase
FROM employees;

-- 12. 직무별 급여가 가장 높은 직원
-- 각 직무별로 급여가 가장 높은 직원의 job_id, first_name, last_name, salary를 조회하세요.
SELECT job_id, first_name, last_name, salary
FROM (
  SELECT job_id, first_name, last_name, salary,
         RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) AS rank
  FROM employees
)
WHERE rank = 1;

-- 13. 부서별 급여 상위 3명
-- 각 부서별로 급여가 높은 상위 3명의 직원 정보를 조회하세요.
SELECT department_id, first_name, last_name, salary
FROM (
  SELECT department_id, first_name, last_name, salary,
         RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
  FROM employees
)
WHERE rank <= 3;

-- 14. 직원 직무 변경 정보 조회
-- 직원들이 직무를 변경한 기록을 조회하세요. (직원의 이전 직무는 job_history 테이블에 저장되어 있습니다.)
SELECT e.first_name || ' ' || e.last_name AS employee_name,
       j.job_id AS new_job, jh.job_id AS previous_job,
       jh.start_date, jh.end_date
FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
JOIN jobs j ON jh.job_id = j.job_id;

-- 15. 직원들의 연봉 합계
-- 모든 직원들의 연봉 합계를 계산하여 출력하세요.
SELECT SUM(salary) AS total_salary
FROM employees;

-- 16. 부서별 최고 급여
-- 각 부서에서 가장 급여가 높은 직원의 department_name과 해당 직원의 first_name, last_name, salary를 조회하세요.
SELECT d.department_name, e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT MAX(salary) FROM employees WHERE department_id = d.department_id);

-- 17. 특정 직원이 속한 부서 정보 조회
-- employee_id가 100인 직원이 속한 부서의 department_name, location을 조회하세요.
SELECT d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.employee_id = 100;

-- 18. 부서 이름과 직원의 직무 조회
-- 부서 이름과 해당 부서에서 일하는 직원들의 직무(job_id)를 조회하세요.
SELECT d.department_name, e.first_name || ' ' || e.last_name AS employee_name, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 19. 최고 급여 직원의 직무와 부서
-- 급여가 가장 높은 직원의 first_name, last_name, salary, job_id, department_id를 조회하세요.
SELECT first_name, last_name, salary, job_id, department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 20. 10년 이상 근무한 직원 조회
-- 입사일이 10년 이상 된 직원들의 employee_id, first_name, last_name, hire_date를 조회하세요.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date <= ADD_MONTHS(SYSDATE, -120);