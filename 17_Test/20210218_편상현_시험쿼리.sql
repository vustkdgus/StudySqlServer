-- 1-1

SELECT email,mobile,names,addr 
 FROM membertbl 
 order by names desc;

-- 1-2

select names, author, releaseDate, price 
 from bookstbl;

-- 2-1

select top(10)
  concat(RIGHT(Names, 2),', ',left(Names ,1)) as '변경이름',
  levels,
  left(addr ,2) as '도시',
  lower(email) as '이메일'
 from membertbl;

-- 2-2

select 
  Idx,
  Names,
  concat('저자> ',Author) as 'Author',
  format(ReleaseDate,'yyyy년 MM월 dd일') as '출판일',
  ISBN,
  format(price,'#,#원') as '가격'
 from bookstbl
  order by Idx desc;


-- 3-1

select 
  b.Idx as '번호',
  b.Division as '장르번호',
  d.Names as '장르',
  b.Names as '책제목',
  b.Author as '저자'
 from bookstbl as b
 inner join divtbl as d
	on d.Division = b.Division
  where d.Names = '로맨스';

-- 3-2

select 
  m.Names,
  m.Levels,
  m.Addr,
  r.rentalDate
  from membertbl as m
 left outer join rentaltbl as r
	on m.Idx = r.memberIdx
 where r.rentalDate is null;

-- 4-1

 insert into divtbl 
  values('I002','자기개발서');

-- 4-2

 update membertbl
	set Addr = '부산시 해운대구'
	, Mobile = '010-6683-7732'
	where Idx = 26;

-- 5

SELECT 
  d.names, 
  sum(b.Price) as '총합계금액'
 FROM bookstbl as b
	inner join divtbl as d
		on d.Division = b.Division
 GROUP BY d.Names WITH ROLLUP;