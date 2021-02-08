--testTBL insert
use sqlDB;
go

-- DML 중 SELECT
select * from testTBL_1;

-- DML 중 INSERT
INSERT INTO testTBL_1 VALUES(1,'홍길동',25);
INSERT INTO testTBL_1 (id,userName) values(2,'성명건');
INSERT INTO testTBL_1 VALUES(3,'홍길순',NULL);
INSERT INTO testTBL_1 (age, id) VALUES (30,4);
INSERT INTO testTBL_1 (age, userName) VALUES (30,'에러');  --pk가 없어서 에러

INSERT INTO testTBL_1 values ('성시경',44);

exec sp_help 'testTBL_1';

select IDENT_CURRENT('testTBL_1');

select @@IDENTITY;

select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;

--sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
	);

insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;

--update
select * from testTBL_1;

UPDATE testTBL_1
  set userName  = '성수경',
	  age = 30
where id = 6;

--DELETE
DELETE from testTbl_1 
WHERE id = 15;


select * from BikeStores.sales.customers


select * from BikeStores.sales.customers 
where last_name like 'S%' 
and state = 'NY' 
and phone is not null 
order by first_name asc;