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