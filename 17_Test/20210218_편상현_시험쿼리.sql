-- 1-1

SELECT email,mobile,names,addr 
 FROM membertbl 
 order by names desc;

-- 1-2

select names, author, releaseDate, price 
 from bookstbl;

-- 2-1

select top(10)
  concat(RIGHT(Names, 2),', ',left(Names ,1)) as '�����̸�',
  levels,
  left(addr ,2) as '����',
  lower(email) as '�̸���'
 from membertbl;

-- 2-2

select 
  Idx,
  Names,
  concat('����> ',Author) as 'Author',
  format(ReleaseDate,'yyyy�� MM�� dd��') as '������',
  ISBN,
  format(price,'#,#��') as '����'
 from bookstbl
  order by Idx desc;


-- 3-1

select 
  b.Idx as '��ȣ',
  b.Division as '�帣��ȣ',
  d.Names as '�帣',
  b.Names as 'å����',
  b.Author as '����'
 from bookstbl as b
 inner join divtbl as d
	on d.Division = b.Division
  where d.Names = '�θǽ�';

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
  values('I002','�ڱⰳ�߼�');

-- 4-2

 update membertbl
	set Addr = '�λ�� �ؿ�뱸'
	, Mobile = '010-6683-7732'
	where Idx = 26;

-- 5

SELECT 
  d.names, 
  sum(b.Price) as '���հ�ݾ�'
 FROM bookstbl as b
	inner join divtbl as d
		on d.Division = b.Division
 GROUP BY d.Names WITH ROLLUP;