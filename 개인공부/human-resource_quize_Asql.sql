-- 1. 모든 직원 정보 조회
-- 모든 직원의 employee_id, first_name, last_name, salary, job_id를 조회하세요.
SELECT 
    employee_id
    ,first_name
    ,last_name
    ,salary
    ,job_id
FROM EMPLOYEES
;

-- 2. 급여가 5000 이상인 직원 검색
-- 급여가 5000 이상인 직원들의 employee_id, first_name, last_name, salary를 조회하세요.
SELECT * FROM employees;

SELECT 
    employee_id
    ,first_name
    ,last_name
    ,salary
FROM EMPLOYEES
WHERE salary>5000
;

-- 3. 급여 높은 순서로 상위 5명 조회
-- 급여가 높은 순으로 상위 5명의 직원의 employee_id, first_name, last_name, salary를 조회하세요.

-- 오라클 12c 버전 이상
--SELECT 
--    employee_id
--    ,first_name
--    ,last_name
--    ,salary
--FROM EMPLOYEES
--ORDER BY salary DESC
--FETCH FIRST 3 ROWS ONLY
--;

-- 오라클 11버전
SELECT employee_id, first_name, last_name, salary
FROM (
    SELECT employee_id, first_name, last_name, salary
    FROM EMPLOYEES
    ORDER BY salary DESC
)
WHERE ROWNUM <= 3;

-- 4. 부서별 평균 급여 계산
-- 모든 부서에서 직원들의 평균 급여를 계산하세요. department_id별로 평균 급여(average_salary)를 조회하세요.
SELECT 
    department_id
    ,avg(salary) as average_salary
FROM employees
GROUP BY department_id
;

-- 5. 각 부서별 직원 수
-- 각 부서에 속한 직원 수를 department_id별로 조회하세요.
select * from employees;

select 
    department_id
    ,COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY department_id
;

-- 6. 직원 이름과 부서 이름 조회
-- 각 직원의 first_name, last_name과 해당 직원이 속한 department_name을 조회하세요.
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

-- 7. 급여가 평균 급여보다 높은 직원
-- 급여가 전체 직원의 평균 급여보다 높은 직원들의 first_name, last_name, salary를 조회하세요.

SELECT 
    first_name
    ,last_name
    ,salary 
FROM employees
WHERE salary >(Select avg(salary) from employees)
ORDER BY 3
;

-- 8. 직무별 급여가 3000 이상인 직원
-- 각 직무별로 급여가 3000 이상인 직원들의 first_name, last_name, salary, job_id를 조회하세요.
SELECT
    first_name,last_name,salary,job_id 
FROM employees
WHERE salary >= 3000
;

-- 9. 직원과 관리자 이름 조회
-- 각 직원과 해당 직원의 manager_id를 조회하세요. (직원이 가진 manager_id를 이용해 관리자의 이름도 함께 조회하세요.)
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
-- 10. 위치별 직원 정보
-- 직원들이 속한 부서의 위치(city)와 함께 직원의 이름을 조회하세요. (employees, departments, locations 테이블을 조인하세요.)


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

-- 11. 급여 인상액 계산
-- 각 직원의 급여에 대해 이전 급여와의 차이를 계산하여 급여 인상액을 구하세요.

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

-- 12. 직무별 급여가 가장 높은 직원
-- 각 직무별로 급여가 가장 높은 직원의 job_id, first_name, last_name, salary를 조회하세요.
-- (문제 설명)

-- 13. 부서별 급여 상위 3명
-- 각 부서별로 급여가 높은 상위 3명의 직원 정보를 조회하세요.
-- (문제 설명)

-- 14. 직원 직무 변경 정보 조회
-- 직원들이 직무를 변경한 기록을 조회하세요. (직원의 이전 직무는 job_history 테이블에 저장되어 있습니다.)
-- (문제 설명)

-- 15. 직원들의 연봉 합계
-- 모든 직원들의 연봉 합계를 계산하여 출력하세요.
-- (문제 설명)

-- 16. 부서별 최고 급여
-- 각 부서에서 가장 급여가 높은 직원의 department_name과 해당 직원의 first_name, last_name, salary를 조회하세요.
-- (문제 설명)

-- 17. 특정 직원이 속한 부서 정보 조회
-- employee_id가 100인 직원이 속한 부서의 department_name, location을 조회하세요.
-- (문제 설명)

-- 18. 부서 이름과 직원의 직무 조회
-- 부서 이름과 해당 부서에서 일하는 직원들의 job_id를 조회하세요.
-- (문제 설명)

-- 19. 최고 급여 직원의 직무와 부서
-- 급여가 가장 높은 직원의 first_name, last_name, salary, job_id, department_id를 조회하세요.
-- (문제 설명)

-- 20. 10년 이상 근무한 직원 조회
-- 입사일이 10년 이상 된 직원들의 employee_id, first_name, last_name, hire_date를 조회하세요.
-- (문제 설명)
