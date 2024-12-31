-- 테이블 생성 (DDL: 데이터 정의어)
-- 학생의 성적정보를 저장


-- CREATE TABLE : 테이블 생성(1회만 가능. 수정은 ALTER)
-- CREATE TABLE 테이블 이름 (
--    KEY_NAME DATA_TYPE 
-- );
CREATE TABLE TBL_SCORE (
    -- PK(Primary Key) : 고유 식별자
    STU_ID NUMBER(6) PRIMARY KEY,
    -- VARCHAR2(최대 글자 수)
    STU_NAME VARCHAR2(20) NOT NULL,
    -- NUMBER(Precision(전체 글자 수), 소수점 자리)
    -- CHECK(CHECK 조건)
    -- NOT NULL : 필수
    KOR NUMBER(3) NOT NULL CHECK(KOR >= 0 AND KOR <= 100),
    ENG NUMBER(3) NOT NULL CHECK(ENG >= 0 AND ENG <= 100),
    MATH NUMBER(3) NOT NULL CHECK(MATH >= 0 AND MATH <= 100),
    TOTAL NUMBER(3),
    AVERAGE NUMBER(5, 2),
    -- CHAR(고정 글자 수)
    GRADE CHAR(1) -- CHAR : 고정길이 문자열
);

-- ALTER문으로 제약조건 추가해보기
-- 예시) Average에 unique 제약을 걸고 싶다.
ALTER TABLE TBL_SCORE
ADD CONSTRAINT unique_average -- 변수명 지어주기
UNIQUE (average);

-- unique 제약조건 해제
ALTER TABLE TBL_SCORE
DROP CONSTRAINT unique_average;

-- 컬럼 추가하기
ALTER TABLE TBL_SCORE
ADD (science NUMBER(3) NOT NULL);

-- 컬럼 삭제하기
ALTER TABLE TBL_SCORE
DROP COLUMN science;

INSERT INTO TBL_SCORE
   (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
   (1, '뽀롱롱', 100, 70, 50); -- 문자열은 ''
   
SELECT * FROM TBL_SCORE;

INSERT INTO TBL_SCORE
   (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
   (2, '하츄핑', 90, 70, 50); -- 문자열은 ''

-- TRUNCATE TABLE : 테이블 안의 데이터 전체 삭제
TRUNCATE TABLE TBL_SCORE;

-- DROP TABLE : 테이블을 삭제
DROP TABLE TBL_SCORE;
   

