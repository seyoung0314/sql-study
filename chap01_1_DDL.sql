-- ���̺� ���� (DDL: ������ ���Ǿ�)
-- �л��� ���������� ����


-- CREATE TABLE : ���̺� ����(1ȸ�� ����. ������ ALTER)
-- CREATE TABLE ���̺� �̸� (
--    KEY_NAME DATA_TYPE 
-- );
CREATE TABLE TBL_SCORE (
    -- PK(Primary Key) : ���� �ĺ���
    STU_ID NUMBER(6) PRIMARY KEY,
    -- VARCHAR2(�ִ� ���� ��)
    STU_NAME VARCHAR2(20) NOT NULL,
    -- NUMBER(Precision(��ü ���� ��), �Ҽ��� �ڸ�)
    -- CHECK(CHECK ����)
    -- NOT NULL : �ʼ�
    KOR NUMBER(3) NOT NULL CHECK(KOR >= 0 AND KOR <= 100),
    ENG NUMBER(3) NOT NULL CHECK(ENG >= 0 AND ENG <= 100),
    MATH NUMBER(3) NOT NULL CHECK(MATH >= 0 AND MATH <= 100),
    TOTAL NUMBER(3),
    AVERAGE NUMBER(5, 2),
    -- CHAR(���� ���� ��)
    GRADE CHAR(1) -- CHAR : �������� ���ڿ�
);

-- ALTER������ �������� �߰��غ���
-- ����) Average�� unique ������ �ɰ� �ʹ�.
ALTER TABLE TBL_SCORE
ADD CONSTRAINT unique_average -- ������ �����ֱ�
UNIQUE (average);

-- unique �������� ����
ALTER TABLE TBL_SCORE
DROP CONSTRAINT unique_average;

-- �÷� �߰��ϱ�
ALTER TABLE TBL_SCORE
ADD (science NUMBER(3) NOT NULL);

-- �÷� �����ϱ�
ALTER TABLE TBL_SCORE
DROP COLUMN science;

INSERT INTO TBL_SCORE
   (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
   (1, '�Ƿշ�', 100, 70, 50); -- ���ڿ��� ''
   
SELECT * FROM TBL_SCORE;

INSERT INTO TBL_SCORE
   (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
   (2, '������', 90, 70, 50); -- ���ڿ��� ''

-- TRUNCATE TABLE : ���̺� ���� ������ ��ü ����
TRUNCATE TABLE TBL_SCORE;

-- DROP TABLE : ���̺��� ����
DROP TABLE TBL_SCORE;
   

