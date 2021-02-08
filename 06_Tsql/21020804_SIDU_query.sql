--testTBL insert
use sqlDB;
go

-- DML �� SELECT
select * from testTBL_1;

-- DML �� INSERT
INSERT INTO testTBL_1 VALUES(1,'ȫ�浿',25);
INSERT INTO testTBL_1 (id,userName) values(2,'�����');
INSERT INTO testTBL_1 VALUES(3,'ȫ���',NULL);
INSERT INTO testTBL_1 (age, id) VALUES (30,4);
INSERT INTO testTBL_1 (age, userName) VALUES (30,'����');  --pk�� ��� ����

INSERT INTO testTBL_1 values ('���ð�',44);

exec sp_help 'testTBL_1';

select IDENT_CURRENT('testTBL_1');

select @@IDENTITY;

select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;

--sale.order_items ���̺� ����
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
  set userName  = '������',
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