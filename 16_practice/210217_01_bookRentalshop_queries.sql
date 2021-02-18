-- 실제 회원정보 불러오기 역레벨, 이름순
select memberName, levels, mobile, email 
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;

 -- 책정보
 select cateIdx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc;

select * from cateTBL;

-- 시스템 함수사용 쿼리
select  memberID,
		concat(right(memberName, 2) ,' ',left(memberName, 1)) as'회원이름',
		case levels
			when 'A' then 'GOLD'
			when 'B' then 'SILVER'
			when 'C' then 'BRONZE'
			when 'D' then 'IRON'
			when 'S' then 'ADMINISTER'
			else '비회원'
		end as '회원레벨',
		mobile,
		upper(email) as 'email'
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;


-- 사용자 정의 함수사용 쿼리
 select  memberID,
		concat(right(memberName, 2) ,' ',left(memberName, 1)) as'회원이름',
		dbo.ufn_getLevel(levels) as '회원레벨',
		mobile,
		upper(email) as 'email'
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;
 
 --책 정보, 시스템 함수, 포맷 함수 쿼리

SELECT b.bookIdx
     -- ,b.cateIdx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM dbo.booksTBL as b
 inner join cateTBL as c
	on b.cateIdx = c.cateIdx

-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalIdx
     -- ,r.memeberIdx
	  ,m.memberName
    --  ,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	  ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
	on b.bookIdx = r.bookIdx
  inner join memberTBL as m
	on r.memeberIdx = m.memberIdx

-- 책을 안빌린 회원 조회
SELECT r.rentalIdx
     -- ,r.memeberIdx
	  ,m.memberName
    --  ,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  left outer join booksTBL as b
	on b.bookIdx = r.bookIdx
  right outer join memberTBL as m
	on r.memeberIdx = m.memberIdx
 where r.rentalIdx is null;

 --우리 책대여점에 없는 소설장르
 select c.cateIdx
		,c.cateName
		,b.bookName
	from cateTBL as c
	left outer join booksTBL as b
	 on c.cateIdx = b.cateIdx;