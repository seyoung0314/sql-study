-- # 문자열 비교

-- CHAR타입끼리의 비교
DROP TABLE CHAR_COMPARE;

CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');
INSERT INTO char_compare VALUES ('103', 'SQLD', '  SQLD');

SELECT * FROM char_compare;

-- char 타입은 비교 시 문자열의 길이가 다르면 
-- 작은 쪽 뒤에 차이만큼 공백이 추가됨 
SELECT
    * FROM char_compare
    WHERE sn = '103'
        AND char_4 = char_6
        ;
        
        -------------------------------------------------------------
        
-- 한쪽이 VARCHAR타입일 경우의 비교
DROP TABLE VARCHAR_COMPARE;

CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
INSERT INTO varchar_compare VALUES ('103', 'SQLD', 'SQLD');

SELECT
    * FROM varchar_compare
    WHERE sn = '103'
        AND char_4 = varchar_6
        ;

-- 상수 문자열 비교
SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = 'SQLD  ' -- true
;

SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    AND varchar_6 = 'SQLD' ? false
;
