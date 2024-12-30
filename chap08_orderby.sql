-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

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
    emp_no ���
    , emp_nm �̸�
    ,dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY �̸�
;

SELECT 
    emp_no ���
    , emp_nm �̸�
    ,dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY 3 desc, 1
;

-- ����Ŭ������ ���� �� null�� ���� ū ������ ���
SELECT 
    emp_no ���
    , direct_manager_emp_no
FROM tb_emp
ORDER by 2 desc
;

SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;
