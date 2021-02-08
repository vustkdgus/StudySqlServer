use sqlDB;
go

--�̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
where userName = '���ȣ';

--1970�� ���� ���, Ű 182 �̻��� ����� ���̵�,�̸� ��ȸ
select userID, userName 
  from userTbl 
where birthYear >= 1970 
  and height >= 182;

  --1970�� ���� ��� or Ű 182 �̻��� ����� ���̵�,�̸� ��ȸ
select userID, userName 
  from userTbl 
where birthYear >= 1970 
  or height >= 182;

 --Ű�� 180~183������ ����� ��ȸ
 select userID, userName 
  from userTbl 
  where height >= 180 
    and height <= 183;
--between ~and
select userID, userName 
  from userTbl 
  where height between 180 and 183;

--������ �泲, ����, ���
select userID, userName 
  from userTbl 
 where addr = '�泲'
	or addr = '����'
	or addr = '���'

select userID, userName 
  from userTbl 
 where addr in ('�泲','����','���');

 --like

select userID, userName 
  from userTbl 
 where userName like '��%';

 select userID, userName 
  from userTbl 
 where userName like '_����';

 --SUBQUERY
select userName, height
	from userTbl
 where height >
 ( select height from userTbl where userName = '���ȣ' );

 --any�� ���ǿ� �����ϴ°��� ��� �����̵� �����ϴ°� ����(or ������) , all�� ��� ���ǿ� �����ϴ°Ÿ� (and ������), in�� ���� ������ ���(height in)
 select userName, height, addr
	from userTbl
 where height >= any
 ( select height from userTbl where addr = '�泲' );

 --order by ����
 select userName, mDate
	from userTbl
	order by mDate ASC; --ASC(��������) DESC(��������)

select *
	from userTbl
	order by userID DESC;

--DISTINCT �ߺ�����
select distinct addr 
	from userTbl;


select top(5) *
  from userTbl
order by mDate desc;

--offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;

 --����
 select * into buyTbl2 from buyTbl;
 select userID,prodName into buyTbl3 from buyTbl;

 -- GROUP BY
 select * from buyTbl

select userID, amount
  from buyTbl
 order by userID;

 --
 select userID, sum(amount) as '�հ�'
  from buyTbl
 group by userID;

 --min, max
 select userID, userName, min(height) as '����Ű', max(height) as 'ūŰ'
   from userTbl
group by userID, userName;

select userID, userName
	from userTbl
where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

--�� ������ ����
select count(*) as 'ȸ����'from userTbl; --10
select count(*) as '���ų�����' from buyTbl; --12