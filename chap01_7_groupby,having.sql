select * from tb_sal_his;

-- ���� �Լ� (������ �Լ�) - null�� ����
-- ���� ���� ��� �ѹ��� �Լ��� ����

select 
    count(*) "����Ƚ��",
    sum(pay_amt) "���� �Ѿ�",
    avg(pay_amt) "��� ���޾�",
    max(pay_amt) "�ִ� ���޾�",
    min(pay_amt) "�ּ� ���޾�"
from tb_sal_his
;


select *
from tb_emp;

select
    count(direct_manager_emp_no)
    from tb_emp;
    
-- �μ��� ������� ����
-- �μ��� ������ ���� 

-- group by : �� �׷캰�� �����Լ��� ���� ����

    
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
    min(birth_de) as "�ֿ����� ����",
    max(birth_de) as "�ֿ����� ����"
    from tb_emp
    GROUP by sal_trans_bank_cd
;

SELECT
    emp_no,
    count(*) "����� ���� Ƚ��",
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� �޿����"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;


SELECT
    emp_no,
    count(*) "����� ���� Ƚ��",
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� �޿����",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���"
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

-- �޿� �̷� ���̺���
-- ������� 2019�⿡ �߻���
--- �޿� ��վ�, �ּ����޾�, �ִ����޾�

-- where : ���� �� ���͸�
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

-- �޿� �̷� ���̺���
-- ��� �޿��� 400���� �̻��� 
-- ������� �޿��Ѿװ� �޿������ ��ȸ

-- having : ���� �� ���͸�
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

-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.

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