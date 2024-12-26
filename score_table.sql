create table scores(
	id bigint auto_increment primary key,
    name varchar(100) not null,
    kor int not null,
    eng int not null,
    math int not null
);

select * from scores; 