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