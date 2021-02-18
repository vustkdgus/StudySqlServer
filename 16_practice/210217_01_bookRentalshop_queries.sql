-- ���� ȸ������ �ҷ����� ������, �̸���
select memberName, levels, mobile, email 
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;

 -- å����
 select cateIdx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc;

select * from cateTBL;

-- �ý��� �Լ���� ����
select  memberID,
		concat(right(memberName, 2) ,' ',left(memberName, 1)) as'ȸ���̸�',
		case levels
			when 'A' then 'GOLD'
			when 'B' then 'SILVER'
			when 'C' then 'BRONZE'
			when 'D' then 'IRON'
			when 'S' then 'ADMINISTER'
			else '��ȸ��'
		end as 'ȸ������',
		mobile,
		upper(email) as 'email'
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;


-- ����� ���� �Լ���� ����
 select  memberID,
		concat(right(memberName, 2) ,' ',left(memberName, 1)) as'ȸ���̸�',
		dbo.ufn_getLevel(levels) as 'ȸ������',
		mobile,
		upper(email) as 'email'
  from memberTBL
 where levels <> 'S'
 order by levels desc, memberName;
 
 --å ����, �ý��� �Լ�, ���� �Լ� ����

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

-- �뿩�� å�� ���� ���� ����
SELECT r.rentalIdx
     -- ,r.memeberIdx
	  ,m.memberName
    --  ,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
	  ,format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
	on b.bookIdx = r.bookIdx
  inner join memberTBL as m
	on r.memeberIdx = m.memberIdx

-- å�� �Ⱥ��� ȸ�� ��ȸ
SELECT r.rentalIdx
     -- ,r.memeberIdx
	  ,m.memberName
    --  ,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.rentalTBL as r
  left outer join booksTBL as b
	on b.bookIdx = r.bookIdx
  right outer join memberTBL as m
	on r.memeberIdx = m.memberIdx
 where r.rentalIdx is null;

 --�츮 å�뿩���� ���� �Ҽ��帣
 select c.cateIdx
		,c.cateName
		,b.bookName
	from cateTBL as c
	left outer join booksTBL as b
	 on c.cateIdx = b.cateIdx;