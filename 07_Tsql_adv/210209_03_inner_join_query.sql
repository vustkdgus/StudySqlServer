select * from userTBL;
select * from buyTbl;

select * from userTbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK';

--INNER JOIN
select * 
	from buyTbl
INNER JOIN userTBL 
	on buyTbl.userID = userTbl.userID
where buyTbl.userID = 'JYP';



select u.userName, u.addr, 
		concat(u.mobile1,'-',left(u.mobile2,4),'-',right(u.mobile2,4)) as mobile, b.prodName, b.price, b.amount
	from buyTbl as b
INNER JOIN userTBL  as u
	on b.userID = u.userID
where b.userID = 'JYP';



--OUTER JOIN