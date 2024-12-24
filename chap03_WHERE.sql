
-- WHERE ������ : �����͸� ���͸�

SELECT
    emp_no
    ,emp_nm
    ,addr
    ,sex_cd
FROM TB_EMP
WHERE sex_cd = 1
;

-- PK�� ���͸��ϸ� ������ 0�� �Ǵ� 1���� ��ȸ��

SELECT
    emp_no
    ,emp_nm
    ,addr
    ,sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;


SELECT
    emp_no
    ,emp_nm
    ,addr
    ,sex_cd
FROM TB_EMP
WHERE sex_cd != 1
;


SELECT
    emp_no
    ,emp_nm
    ,addr
    ,sex_cd
FROM TB_EMP
WHERE sex_cd <> 1  -- not equal
;

SELECT
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
 FROM TB_EMP
 WHERE birth_de >=' 19900101'
    AND birth_de <= '19941231'
;

-- BETWEEN A AND B : ���� ������ ��ȸ
SELECT
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
 FROM TB_EMP
 WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN  ������ : OR����
SELECT
    emp_no
    ,emp_nm
    ,dept_cd
FROM TB_EMP
WHERE dept_cd ='100002'
        OR dept_cd =100007
;

SELECT
    emp_no
    ,emp_nm
    ,dept_cd
FROM TB_EMP
WHERE dept_cd NOT IN('100002',100007)
;

-- LIKE ����
-- Ư�� �ܾ ���Ե� �˻�
-- ���ϵ� ī�� ����(% : 0���� �̻�, _ : �� 1����)
SELECT
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
--WHERE emp_nm LIKE '��%'
--WHERE addr LIKE '_��%'
WHERE emp_nm LIKE '��__'
;

-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� 
-- ���, �̸�, ����, �μ��ڵ带  ��ȸ

SELECT
    emp_no
    ,emp_nm
    ,addr
    ,dept_cd
FROM TB_EMP
WHERE 1=1
        AND emp_nm LIKE '��__' 
        AND dept_cd IN (100003,100004)
        AND birth_de BETWEEN '19900101' AND '19991231'
;

--  NULL�� ��ȸ
--  NULL��ȸ�� ������ IS NULL
SELECT
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
 FROM TB_EMP
 WHERE direct_manager_emp_no IS NULL
;

SELECT
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
 FROM TB_EMP
 WHERE direct_manager_emp_no IS NOT NULL
;

-- ������ �켱 ����
-- NOT > AND > OR
SELECT
    emp_no
    ,emp_nm
    ,addr
 FROM TB_EMP
 WHERE 1=1 
    AND emp_nm LIKE '��%'
    AND (addr LIKE '%�ϻ�%'
        OR addr LIKE '%����%')
;
