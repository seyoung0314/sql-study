-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm DESC
;

SELECT 
    emp_no
    , emp_nm
    , addr
    ,dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC
;

SELECT 
    emp_no 사번
    , emp_nm 이름
    ,dept_cd 부서코드
FROM tb_emp
ORDER BY 이름
;

SELECT 
    emp_no 사번
    , emp_nm 이름
    ,dept_cd 부서코드
FROM tb_emp
ORDER BY 3 desc, 1
;

-- 오라클에서는 정렬 시 null을 가장 큰 값으로 취급
SELECT 
    emp_no 사번
    , direct_manager_emp_no
FROM tb_emp
ORDER by 2 desc
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;
