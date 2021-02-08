use sqlDB;
go

--이름이 김경호인 사람 조회
select * from userTbl
where userName = '김경호';

--1970년 이후 출생, 키 182 이상인 사람만 아이디,이름 조회
select userID, userName 
  from userTbl 
where birthYear >= 1970 
  and height >= 182;

  --1970년 이후 출생 or 키 182 이상인 사람만 아이디,이름 조회
select userID, userName 
  from userTbl 
where birthYear >= 1970 
  or height >= 182;

 --키가 180~183사이인 사람만 조회
 select userID, userName 
  from userTbl 
  where height >= 180 
    and height <= 183;
--between ~and
select userID, userName 
  from userTbl 
  where height between 180 and 183;

--지역이 경남, 전남, 경북
select userID, userName 
  from userTbl 
 where addr = '경남'
	or addr = '전남'
	or addr = '경북'

select userID, userName 
  from userTbl 
 where addr in ('경남','전남','경북');

 --like

select userID, userName 
  from userTbl 
 where userName like '김%';

 select userID, userName 
  from userTbl 
 where userName like '_종신';

 --SUBQUERY
select userName, height
	from userTbl
 where height >
 ( select height from userTbl where userName = '김경호' );

 --any는 조건에 만족하는것중 어느 조건이든 만족하는거 전부(or 같은것) , all은 모든 조건에 만족하는거만 (and 같은것), in은 값이 같은것 모두(height in)
 select userName, height, addr
	from userTbl
 where height >= any
 ( select height from userTbl where addr = '경남' );

 --order by 정렬
 select userName, mDate
	from userTbl
	order by mDate ASC; --ASC(오름차순) DESC(내림차순)

select *
	from userTbl
	order by userID DESC;

--DISTINCT 중복제거
select distinct addr 
	from userTbl;


select top(5) *
  from userTbl
order by mDate desc;

--offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;

 --복사
 select * into buyTbl2 from buyTbl;
 select userID,prodName into buyTbl3 from buyTbl;

 -- GROUP BY
 select * from buyTbl

select userID, amount
  from buyTbl
 order by userID;

 --
 select userID, sum(amount) as '합계'
  from buyTbl
 group by userID;

 --min, max
 select userID, userName, min(height) as '작은키', max(height) as '큰키'
   from userTbl
group by userID, userName;

select userID, userName
	from userTbl
where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

--총 데이터 개수
select count(*) as '회원수'from userTbl; --10
select count(*) as '구매내역수' from buyTbl; --12