
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
    
    SELECT
    * FROM
    tb_emp
    ;

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

 1980년대생 사원드의 사번, 사번명, 부서명 ,자격증명,취득일자 조회
 
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

-- INNER 조인은 두 테이블 간에 
-- 연관데이터가 있는 경우에만 사용
-- 어떤 쇼핑몰회원이 한건도 주문하지 않은 경우
-- INNER JOIN에서는 해당 회원이 조회되지 않음


-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름

-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];
