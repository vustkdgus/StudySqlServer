-- outer join ����

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
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  from dbo.rentaltbl as r
 right outer join memberTBL as m
   on r.memeberIdx = m.memberIdx
 left outer join booksTBL as b
   on r.bookIdx = b.bookIdx
 left outer join cateTBL as c
   on c.cateIdx = b.cateIdx
 where r.rentalIdx is null


-- ������ �Է�
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
  '�������� ���� ����', 
  '��ȳ�', 
  '������', 
  '2019-10-2', 
  '9791135445705', 
   12500);


 -- å���̺� �� å ������, ����, ������� ����
begin tran;

update booksTBL
	set descriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����'
	, regDate = '2021-02-18'
	where bookIdx = 12;

select * from booksTBL;

rollback;
commit;

-- ī�װ� �Է�
begin tran

insert into cateTBL /*(cateIdx,cateName)*/ VALUES ('I0001', '��ȭ'),
												  ('I0002', '����/ó��'),
												  ('I0003', '�ð�/����');

select * from cateTBL;

rollback;
commit;


delete from cateTBL where cateIdx = 'I0003';

