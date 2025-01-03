-- ���� ������
-- ## UNION         A��B=(A?B)��(B?A)��(A��B)
-- 1. ������ ������ �ǹ��Դϴ�.
-- 2. ù��° ������ �ι�° ������ �ߺ������� �ѹ��� �����ݴϴ�.
-- 3. ù��° ������ ���� ������ Ÿ���� �ι�° ������ ������ Ÿ�԰� �����ؾ� ��.
-- 4. �ڵ����� ������ �Ͼ (ù��° �÷� �������� �⺻��)
-- 5. ���ɻ� ���ϰ� �Ͼ �� ����

SELECT 
    emp_no
    , emp_nm
    , birth_de
FROM tb_emp
WHERE 
    birth_de 
        BETWEEN '19600101' AND '19691231'

UNION

SELECT 
    emp_no
    , emp_nm
    , birth_de
FROM tb_emp
WHERE 
    birth_de 
        BETWEEN '19700101' AND '19791231'
;


-- ## UNION ALL        A��B=(A?B)��(B?A)��(A��B)��(A��B)
-- 1. UNION�� ���� �� ���̺��� �������� ���ļ� �����ݴϴ�.
-- 2. UNION���� �޸� �ߺ��� �����͵� �ѹ� �� �����ݴϴ�.
-- 3. �ڵ� ���� ����� �������� �ʾ� ���ɻ� �����մϴ�.


SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19700101' AND '19791231'
ORDER BY emp_nm
;

SELECT 
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT 
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19700101' AND '19791231'
;

-- ## INTERSECT (A �� B)
-- 1. ù��° ������ �ι�° �������� �ߺ��� �ุ�� ����մϴ�.
-- 2. �������� �ǹ��Դϴ�.

SELECT 
    A.emp_no, A.emp_nm, A.addr, B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B ON A.emp_no = B.emp_no
JOIN tb_certi C ON B.certi_cd = C.certi_cd
WHERE C.certi_nm = 'SQLD'

INTERSECT

SELECT 
    A.emp_no, A.emp_nm, A.addr, B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B ON A.emp_no = B.emp_no
JOIN tb_certi C ON B.certi_cd = C.certi_cd
WHERE C.certi_nm = 'SQLD' or c.certi_nm like '%������%';

select * from tb_certi;


SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE C.certi_nm = 'SQLD';

SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%����%';

SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%����%'
    AND C.certi_nm = 'SQLD'
;
-- ## MINUS(EXCEPT)  (A-B)
-- 1. �ι�° �������� ���� ù��° �������� �ִ� �����͸� �����ݴϴ�.
-- 2. �������� �����Դϴ�.

SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100001'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100004'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE sex_cd = '1'
;
