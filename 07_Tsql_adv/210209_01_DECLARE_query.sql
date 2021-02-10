use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(5,2);
declare @myVar4 char(20);

set @myVar1 = 154234521;
set @myVar2 = 32450;
set @myVar3 = 3.14;
set @myVar4 = '가수 이름==>     ';

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTbl where height > 180;

declare @myVar5 tinyint; -- 255
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc;

--
select * from buyTbl;
select convert(float, amount) as amount from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl;

select avg(convert(float,amount)) as '평균구매개수' from buyTbl;

select price,amount, price/amount as [단가/수량] from buyTbl;

-- 
'1000' -->숫자
select PARSE('2021년 2월 39일' as date);
SELECT TRY_PARSE('2021년 2월 39일' as date);

SELECT TRY_PARSE('123.45' as DECIMAL(5,2));
SELECT TRY_PARSE('123.45' as int);

SELECT CAST('11' as int);

--스칼라함수(단일 리턴함수)
SELECT GETDATE() AS '현재날짜';

SELECT YEAR(GETDATE()) AS '금년';
SELECT MONTH(GETDATE()) AS '이번달';
SELECT DAY(GETDATE()) AS '오늘일';

SELECT ABS(-100);

SELECT ROUND(3.1415, 3);
SELECT ROUND(1234.5678, -1);

SELECT ROUND(RAND() * 45, 0);

SELECT IIF(20 > 10, '참','거짓');

--문자열함수
SELECT ASCII('a'), ASCII('A');
select char(98), char(66);
select unicode('가');
select nchar(45909);

--많이 쓰이는거
--문자열 결합
select concat('SQL ','Sever ', 2019);
--문자열 시작위치 리턴
select charindex('Server', 'SQL Server 2019');
--left, right
select left('SQL Server 2019',3), right('SQL Server 2019',4)
--substring
select SUBSTRING('Hello World!',  7, 5);
select SUBSTRING('안녕하세요, SQL서버입니다!',  11, 2);
--LEN 문자열개수
select len('안녕하세요'), len('Hello World!');
--lower, upper 대소문자
select lower('abcdeFG'), upper('abcdeFG')
--LTRIM, RTRIM 공백제거
select ltrim('     Hello World!        '), trim('        Hello World!      '), rtrim('     Hello World!      ');
--replace

select replace('(2016년)SQL Sever 2016', '2016', '2019');

--정말 많이 쓰는 함수
select format(getdate(),''); --기본
select format(getdate(),'dd/MM/yyyy'); --
select format(getdate(),'yyyy-MM-dd hh:mm:ss:ms');
select format(getdate(),'yyyy-MM-dd');
select format(getdate(),' hh:mm:ss');

