-- 문제 1: MOCK_DATA 테이블에서 모든 데이터를 조회하세요.
select * 
from mock_data
;

-- 문제 2: first_name, last_name, email 컬럼만 조회하세요.
select 
	first_name
    ,last_name
    ,email
from mock_data
;

-- 문제 3: gender가 'Male'인 모든 사람의 first_name, last_name, email을 조회하세요.
select 
	first_name
    ,last_name
    ,email
    -- ,gender  
from mock_data
	where gender = "Male" 
;

-- 문제 4: job_title이 'Editor'인 사람의 first_name, last_name, job_title을 조회하세요.
select 
	first_name
    ,last_name
    ,job_title
from mock_data
	where job_title = 'Editor'
;

-- 문제 5: id가 100보다 큰 모든 사람의 id, first_name, last_name을 조회하세요.
select 
	id
    ,first_name
    ,last_name
from mock_data
	where id > 100
;

-- 문제 6: MOCK_DATA 테이블에서 last_name을 기준으로 오름차순으로 정렬하세요.
select *
from mock_data
	order by last_name
    ;

-- 문제 7: gender가 'Female'인 사람을 id 기준으로 내림차순으로 정렬하세요.
select *
from mock_data
	where gender = 'Female'
    order by id
    ;

-- 문제 8: MOCK_DATA 테이블에서 처음 10개의 행만 조회하세요.
select *
from mock_data
limit 10
;

-- 문제 9: gender가 'Male'인 사람들 중에서 처음 5명만 조회하세요.
select *
from mock_data
	where gender = 'Male'
	limit 5
;
-- 문제 10: MOCK_DATA 테이블에서 gender별로 몇 명의 사람들이 있는지 조회하는 쿼리를 작성하세요.
select 
	gender
    , count(*) as count 
from mock_data
group by gender
;

-- 문제 11: job_title이 'Editor'인 사람들의 id 수를 세는 쿼리를 작성하세요.
select 
	'Editor'
    ,count(id) as count
from mock_data
	where job_title = 'Editor'
;

-- 문제 12: 모든 사람들의 id에 대한 평균값을 구하는 쿼리를 작성하세요.
select 
	avg(id) as avg
from mock_data
;

-- 문제 13: job_title 별로 사람들의 수를 구하는 쿼리를 작성하세요.
select 
	job_title
    , count(job_title) as count 
from mock_data
	group by job_title
;

-- 문제 14: gender와 job_title 별로 사람들의 수를 구하는 쿼리를 작성하세요.
select 
	gender
	,job_title
    , count(job_title) as count 
from mock_data
	group by gender ,job_title 
;

-- 문제 15: department라는 테이블이 있다고 가정하고, department_id를 기준으로 두 테이블을 JOIN하여 결과를 출력하는 쿼리를 작성하세요.
-- (department 테이블과 JOIN하는 것은 예시이므로 실제 테이블이 없으니 가상의 예시로 작성)

-- 문제 16: first_name이 'Harry' 또는 'Lena'인 사람을 조회하는 쿼리를 작성하세요.
select *
from mock_data
	where first_name IN ('Harry','LEna')
;

-- 문제 17: email이 '@.org'으로 끝나는 모든 사람을 조회하는 쿼리를 작성하세요.
select *
from mock_data
	where email like '%@%.org'
;

-- 문제 18: id가 50 이상 150 이하인 사람을 조회하는 쿼리를 작성하세요.
select *
from mock_data
	where id between 50 and 150
;

-- 문제 19: id가 10인 사람의 first_name을 'Michael'로 업데이트하는 쿼리를 작성하세요.
update mock_data
	set first_name = 'Michael'
    where id = 10
    ;
    
select *
from mock_data
	where id = 10
    ;
    
    
    
-- 문제 20: job_title이 'Administrative Assistant ~'인 사람들의 job_title을 'Administrative Assistant'로 업데이트하는 쿼리를 작성하세요.
SET SQL_SAFE_UPDATES = 0;

update mock_data 
	set job_title = 'Administrative Assistant'
	where job_title like 'Administrative Assistant%'
;

select * 
from mock_data
where job_title like'Administrative Assistant%'
;
-- 문제 21: id가 200 이상인 사람들의 데이터를 삭제하는 쿼리를 작성하세요.

-- 문제 22: gender가 'Male'인 사람들의 데이터를 삭제하는 쿼리를 작성하세요.

-- 문제 23: MOCK_DATA 테이블에 새로운 사람이 first_name이 'Alice', last_name이 'Smith', email이 'alice.smith@example.com', gender가 'Female', job_title이 'HR Manager'인 데이터를 삽입하는 쿼리를 작성하세요.

ALTER TABLE mock_data
MODIFY COLUMN id INT AUTO_INCREMENT;

insert into mock_data (first_name, last_name, email, gender, job_title)
values ('Alice', 'Smith', 'alice.smith@example.com', 'Female', 'HR Manager');

update mock_data
set job_title = 'Human Resources Manager'
where id = 501
;

select * 
from mock_data
	order by id desc
    limit 10
;

-- 문제 24: gender가 'Female'이고, job_title이 'HR Manager'인 사람의 first_name, last_name, email을 조회하는 쿼리를 작성하세요.
select 
	first_name
    ,last_name
    ,email
    ,job_title
from mock_data
	where gender = 'Female'
		and job_title like 'Human Resources Manager'
;

-- 문제 25: first_name이 'John'인 사람 중에서 email에 'gmail.com'이 포함된 사람을 조회하는 쿼리를 작성하세요.
select * 
from mock_data
	where first_name like 'B%'
		and email like '%.com'
	order by last_name
;