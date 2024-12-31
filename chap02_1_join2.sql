
-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, 
--    ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���˴ϴ�.
--     -> �������� ���� �÷��� ������ AND������ �ɷ��� �����Ͱ� �̻��ϰ� �ɼ�����(����)

-- ��� ���̺�� �μ� ���̺��� ���� (���, �����, �μ��ڵ�, �μ���)

SELECT
e.emp_no
,e.emp_nm
,dept_cd    -- ���� �÷��� �������� ó��
,d.dept_nm
FROM tb_emp E
NATURAL JOIN tb_dept D
;

SELECT
*
FROM tb_emp E
NATURAL JOIN tb_dept D
--ON e.dept_cd = d.dept_cd
;

SELECT
*
FROM tb_emp E
NATURAL JOIN tb_dept D
--ON e.dept_cd = d.dept_cd
;

-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
--    ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� 
--    �ο��� �� �ֽ��ϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.

SELECT
e.emp_no
,e.emp_nm
,dept_cd    
,d.dept_nm
FROM tb_emp E
JOIN tb_dept D
USING (dept_cd)
;


-- ��� ����� �� ��Ī
select
* 
from 
tb_emp, tb_dept
;

select
* 
from tb_emp
cross join tb_dept
;