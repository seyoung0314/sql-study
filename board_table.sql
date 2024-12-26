create table tbl_board(
	id bigint auto_increment primary key,
    title varchar(50) not null,
    content text not null,
    view_count bigint DEFAULT 0,
    reg_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from tbl_board;

ALTER TABLE tbl_board
ADD COLUMN status ENUM('ACTIVE', 'DELETED') DEFAULT 'ACTIVE';

UPDATE tbl_board
SET status = 'ACTIVE'
WHERE id = 2;