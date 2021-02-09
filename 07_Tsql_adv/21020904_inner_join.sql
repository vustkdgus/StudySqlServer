/* select * from stdTbl;
select * from clubTbl;
select * from clubregtbl; */

--standard SQL(INNER JOIN)
select s.id, s.stdName,c.clubName, c.buildingNum
  from clubRegTbl as r
 inner join stdTbl as s
  on s.id = r.std_id
 inner join clubTbl as c
  on r.club_id = c.id;

--inner join 약식(SQL Server T-SQL)
select s.id, s.stdName,c.clubName, c.buildingNum
  from clubRegTbl as r, stdTbl as s, clubTbl as c
 where s.id = r.std_id 
  and r.club_id = c.id;

 
 --OUTERJOIN (외부 조인)
 select s.id, s.stdName,c.clubName, c.buildingNum
  from stdTbl as s
 left outer join clubRegTbl as r
  on s.id = r.std_id
 left outer join clubTbl as c
  on r.club_id = c.id;

  --userTBL / buyTBL
select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  right outer join buyTbl as b
	on u.userID = b.userID;

select * from buyTbl;