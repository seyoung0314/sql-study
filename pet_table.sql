create table tbl_pet(
	id bigint auto_increment primary key
    ,pet_name varchar(50)
    ,pet_age int
    ,injection boolean
);
    
ALTER TABLE tbl_pet
ADD COLUMN status ENUM('ACTIVE', 'DELETED') DEFAULT 'ACTIVE';

select * from tbl_pet;

        SELECT * FROM tbl_pet
        WHERE status = 'ACTIVE'
        AND id = 2;