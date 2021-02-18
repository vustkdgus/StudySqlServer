-- outer join 쿼리

select r.rentalidx
      --,r.memeberidx
	  ,m.memberName
      --,r.bookidx
	  --,b.cateIdx
	  ,c.cateName
	  ,b.bookName
      ,format(r.rentaldt, 'yyyy-MM-dd') as rentalDt
      ,format(r.returndt, 'yyyy-MM-dd') as returnDt
      ,r.rentalstate
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  from dbo.rentaltbl as r
 right outer join memberTBL as m
   on r.memeberIdx = m.memberIdx
 left outer join booksTBL as b
   on r.bookIdx = b.bookIdx
 left outer join cateTBL as c
   on c.cateIdx = b.cateIdx
 where r.rentalIdx is null


-- 데이터 입력
insert into booksTBL 
 (cateIdx, 
  bookName, 
  author, 
  company, 
  releaseDate, 
  ISBN, 
  price)
values
 ('N0002',
  '순수하지 않은 감각', 
  '요안나', 
  '로코코', 
  '2019-10-2', 
  '9791135445705', 
   12500);


 -- 책테이블 위 책 정보중, 설명, 등록일자 수정
begin tran;

update booksTBL
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석'
	, regDate = '2021-02-18'
	where bookIdx = 12;

select * from booksTBL;

rollback;
commit;

-- 카테고리 입력
begin tran

insert into cateTBL /*(cateIdx,cateName)*/ VALUES ('I0001', '대화'),
												  ('I0002', '성공/처세'),
												  ('I0003', '시간/관리');

select * from cateTBL;

rollback;
commit;


delete from cateTBL where cateIdx = 'I0003';

