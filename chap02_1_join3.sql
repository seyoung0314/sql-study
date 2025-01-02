-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO tb_dept VALUES ('100014', '4�����������', '999999');
INSERT INTO tb_dept VALUES ('100015', '����Ʈ�ڷγ���', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;


-- ������� + �μ����� ��ȸ

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd
    ,d.dept_nm
from tb_emp e
join tb_dept d
on e.dept_cd = d.dept_cd
;

-- # OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�� �� ����ϴ� ���α���Դϴ�.
-- 2. OUTER���� ������ ��ȣ�� (+)��ȣ�Դϴ�.
-- 3. INNER������ ���� ������ �������� ������ �ش� ���� ��ȸ���� �ʽ��ϴ�
--   �׷��� OUTER JOIN�� ����(LEFT, RIGHT, FULL)�� �°� ���ǿ� ��Ī���� 
--   �ʴ� ��鵵 ��� NULL�� ó���ؼ� ��ȸ�մϴ�.

-- ����Ŭ ����
-- LEFT: �������ǿ��� �����ʿ� (+)�� ����
-- RIGHT: �������ǿ��� ���ʿ� (+)�� ����
-- FULL: �������� ����
-- (+)�� ������ ǥ�����ο��� ON���� ��ġ�ϴ� ����

-- # LEFT OUTER JOIN
-- ���εǴ� ���� ���̺��� ��� ��ȸ�ϰ�, ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- ���� ��������� �ϴ� �� ���� ������ Ȥ�� �μ����̺��� �μ��ڵ尡 ��Ī�Ǹ�
-- ���ʽ��� �μ��̸��� ������

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  -- d.dept_cd �� null
    ,d.dept_nm
from tb_emp e
left outer join tb_dept d
on e.dept_cd = d.dept_cd
;

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  -- d.dept_cd �� null
    ,d.dept_nm
from tb_emp e, tb_dept d
where e.dept_cd = d.dept_cd (+)
;

-- # RIGHT OUTER JOIN
-- ���εǴ� ������ ���̺��� ��� ��ȸ�ϰ�, ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  
    ,d.dept_nm
from tb_emp e
right outer join tb_dept d
on e.dept_cd = d.dept_cd
;

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  -- d.dept_cd �� null
    ,d.dept_nm
from tb_emp e, tb_dept d
where e.dept_cd (+) = d.dept_cd
;

-- # FULL OUTER JOIN
-- ������, ���� ���̺��� ��� ��ȸ�մϴ�.

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  
    ,d.dept_nm
from tb_emp e
full outer join tb_dept d
on e.dept_cd = d.dept_cd
;

select 
    e.emp_no
    ,e.emp_nm
    ,e.dept_cd  
    ,d.dept_nm
from tb_emp e, tb_dept d
where e.dept_cd = d.dept_cd 
;

-- ����� 46��, �μ��� 16��
-- �μ��� �Ҽӵ� ����� 41��
-- ����� �����ϴ� �μ� 14��
-- INNER JOIN�� ��� ���������ȸ 41��
-- LEFT JOIN : INNER 41 + �μ������� ��� 5 = 46��
-- RIGHT JOIN :INNER 41 + ����̾��� �μ� 2  = 43��
-- FULL JOIN : INNER 41 + 5 + 2 = 48��

-- [FULL JOIN]
--
--      E.A    E.B   E.C    D.C   D.D   D.E
-- ==============================
--        1       b       w       w        1      10
--        3       d       w       w        1      10
--        5       y       y       null      null   null
--       null   null    null     z        4       11
--       null   null    null     v        2       22
--
-- [RIGHT JOIN]
--
--      E.A    E.B   E.C    D.C   D.D   D.E
-- ==============================
--        1       b       w       w        1      10
--        3       d       w       w        1      10
--       null   null    null     z        4       11
--       null   null    null     v        2       22
--
--
--
-- [LEFT JOIN]
--
--      E.A    E.B   E.C    D.C   D.D   D.E
-- ==============================
--        1       b       w       w        1      10
--        3       d       w       w        1      10  
--        5       y       y       null      null   null
--
--
-- [INNER JOIN ]
--
--      E.A    E.B   E.C    D.C   D.D   D.E
-- ==============================
--        1       b       w       w        1      10
--        3       d       w       w        1      10
--      
--
--
-- [CROSS JOIN]  
--
--      E.A    E.B   E.C    D.C   D.D   D.E
-- ==============================
--        1       b       w       w        1      10
--        1       b       w       z         4      11
--        1       b       w       v         2       22
--        3       d       w       w        1      10
--        3       d       w       z         4      11
--        3       d       w       v         2       22
--        5       y       y        w        1      10
--        5       y       y        z         4      11
--        5       y       wy      v         2       22



-- # SELF JOIN
-- 1. �ϳ��� ���̺��� �ڱ� �ڽ��� ���̺��� �����ϴ� ����Դϴ�.
-- 2. �ڱ� �ڽ� ���̺��� pk�� fk�� ���������մϴ�.

select * from tb_emp;

select 
    a.emp_no "�����ȣ"
    ,a.emp_nm "�����"
    ,a.addr "�ּ�"
    ,a.direct_manager_emp_no "�����"
    ,nvl (b.emp_nm, '����') "����̸�"
from tb_emp a
left outer join tb_emp b
on a.direct_manager_emp_no = b.emp_no
ORDER BY a.emp_no
;
