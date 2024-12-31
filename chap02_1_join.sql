
--1:1 ���� : ȸ���⺻���� - > ȸ��������
--1:N        : �Խñ� -> ���, ��� -> �μ�
--N:N       :  �ؽ��±� -> �Խñ�. ��ǰ ->  �ֹ�


SELECT 
    emp_no ���
    , emp_nm �̸�
    ,dept_cd �μ��ڵ�
FROM tb_emp
;

-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);


INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- ������ �⺻ ������ ������ (��ø�ݺ��� ����)
-- ī�׽þ� �� : ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ

SELECT 
* FROM test_a, test_b
;

SELECT 
* FROM tb_emp, tb_dept
;

SELECT 
* FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;

SELECT
    * FROM
    tb_dept;
    
    SELECT
    * FROM
    tb_emp
    ;

-- INNER JOIN
-- �� ���̺� ���� �������� ��Ī �÷��� �̿��Ͽ�
-- ���谡 �ִ� �����͸� ��Ī�ؼ� ���͸��Ͽ� ��ȸ

SELECT 
    E.emp_no
    , E.emp_nm
    , E.dept_cd
--    , D.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;


SELECT 
    E.emp_no
    , E.emp_nm
    , E.dept_cd
--    , D.dept_cd
    , D.dept_nm
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
;

SELECT 
    E.emp_no,
    E.emp_nm,
    dept_cd,
    D.dept_nm
FROM tb_emp E
JOIN tb_dept D
USING (dept_cd)
;
-- ����� �����ȣ�� ������ ����� �ڰ������� ��ȸ

SELECT
    E.emp_no
--    ,c.certi_cd
    ,c.acqu_de
    ,t.certi_nm
FROM tb_emp E, tb_emp_certi C, tb_certi T
WHERE e.emp_no = C.emp_no
    AND c.certi_cd = t.certi_cd
;

select 
 e.emp_no
 ,e.emp_nm
 ,ec.certi_cd
 ,tc.certi_nm
 ,tc.issue_insti_nm
 ,ec.acqu_de
from tb_emp_certi EC 
JOIN tb_emp E
ON ec.emp_no = e.emp_no
JOIN tb_certi TC
ON ec.certi_cd = tc.certi_cd
;

SELECT
    * FROM tb_dept;

SELECT
    * FROM tb_emp_certi;

SELECT
    * FROM tb_certi;

 1980���� ������� ���, �����, �μ��� ,�ڰ�����,������� ��ȸ
 
 select 
 e.emp_no
 ,e.emp_nm
 ,e.dept_cd
 ,b.dept_nm
 ,c.certi_nm
 ,c.issue_insti_nm
 from tb_emp e,tb_dept b, tb_certi c, tb_emp_certi ec
 WHERE e.dept_cd = b.dept_cd
    AND e.emp_no = ec.emp_no
    AND ec.certi_cd = c.certi_cd
    AND E.birth_de BETWEEN '19800001' AND '19891231'
 ;
 
 SELECT
    E.emp_no
    , E.emp_nm
    , E.birth_de
    , D.dept_nm
    , C.certi_nm
    , EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;

-- INNER ������ �� ���̺� ���� 
-- ���������Ͱ� �ִ� ��쿡�� ���
-- � ���θ�ȸ���� �Ѱǵ� �ֹ����� ���� ���
-- INNER JOIN������ �ش� ȸ���� ��ȸ���� ����


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�

-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];
