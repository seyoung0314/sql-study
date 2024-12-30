
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