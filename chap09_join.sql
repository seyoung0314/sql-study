
--1:1 관계 : 회원기본정보 - > 회원상세정보
--1:N        : 게시글 -> 댓글, 사원 -> 부서
--N:N       :  해시태그 -> 게시글. 상품 ->  주문


SELECT 
    emp_no 사번
    , emp_nm 이름
    ,dept_cd 부서코드
FROM tb_emp
;

-- 조인 기초 테스트 데이터
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

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- 조인의 기본 원리는 곱연산 (중첩반복문 개념)
-- 카테시안 곱 : 가능한 모든 경우의 수를 매칭하여 조회

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
-- 두 테이블 간에 연관관계 매칭 컬럼을 이요하여
-- 관계가 있는 데이터를 매칭해서 필터링하여 조회

SELECT 
    E.emp_no
    , E.emp_nm
    , E.dept_cd
--    , D.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- 사원의 사원번호와 사원명과 취득한 자격증명을 조회

SELECT
    E.emp_no
--    ,c.certi_cd
    ,c.acqu_de
    ,t.certi_nm
FROM tb_emp E, tb_emp_certi C, tb_certi T
WHERE e.emp_no = C.emp_no
    AND c.certi_cd = t.certi_cd
;