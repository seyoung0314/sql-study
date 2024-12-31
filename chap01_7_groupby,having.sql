select * from tb_sal_his;

-- 집계 함수 (다중행 함수) - null값 무시
-- 여러 행을 묶어서 한번에 함수를 적용

select 
    count(*) "지급횟수",
    sum(pay_amt) "지급 총액",
    avg(pay_amt) "평균 지급액",
    max(pay_amt) "최대 지급액",
    min(pay_amt) "최소 지급액"
from tb_sal_his
;


select *
from tb_emp;

select
    count(direct_manager_emp_no)
    from tb_emp;
    
-- 부서별 사원수를 집계
-- 부서별 연장자 생일 

-- group by : 각 그룹별로 집계함수를 각각 적용

    
select
dept_cd,
    count(*)
from tb_emp
GROUP BY dept_cd
order by dept_cd asc
;

select 
    sal_trans_bank_cd,
    count(*),
    min(birth_de) as "최연장자 생일",
    max(birth_de) as "최연소자 생일"
    from tb_emp
    GROUP by sal_trans_bank_cd
;

SELECT
    emp_no,
    count(*) "사원별 지급 횟수",
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 급여평균"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;


SELECT
    emp_no,
    count(*) "사원별 지급 횟수",
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 급여평균",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

select 
    dept_cd,
    count(*)
from tb_emp
GROUP BY dept_cd
;


SELECT 
    dept_cd,
    sex_cd,
    COUNT(*)
FROM tb_emp
GROUP BY sex_cd, dept_cd
ORDER BY dept_cd
;

-- 급여 이력 테이블에서
-- 사원별로 2019년에 발생한
--- 급여 평균액, 최소지급액, 최대지급액

-- where : 집계 전 필터링
select
    emp_no,
    avg(pay_amt),
    min(pay_amt)
    ,max(pay_amt)
from tb_sal_his
WHERE pay_de BETWEEN '20190101' and '20191231'
group by emp_no
order by emp_no
;

-- 급여 이력 테이블에서
-- 평균 급여가 400만원 이상인 
-- 사원들의 급여총액과 급여평균을 조회

-- having : 집계 후 필터링
SELECT
    emp_no
    , sum(pay_amt)
    , avg(pay_amt)
FROM tb_sal_his
GROUP BY emp_no
having avg(pay_amt) >= 4500000
;

SELECT
    emp_no
    , sum(pay_amt)
    , avg(pay_amt)
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' and '20191231'
GROUP BY emp_no
having avg(pay_amt) >= 4500000
;

-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.

SELECT 
    dept_cd AS dc,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd
;