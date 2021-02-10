/*
use sqldb;
go
*/
--create table testTBL (num int);
--drop table testTBL;

use tempdb;
go
/*
drop database tabledb;
go
create database tableDB;
*/
USE tableDB;
go

create table userTBL
(
	userID		char(8),		-- 아이디
	userName	nvarchar(10),	-- 이름
	birthYear	int,			--출생년도
	addr		nchar(2),		-- 지역
	mobile1		char(3),		--휴대폰 국번
	mobile2		char(8),		-- gbeovhsqjsgh
	height		smallint,		--키
	mDate		date			--회원가입일

);
go

create table byeTBL
();
go

