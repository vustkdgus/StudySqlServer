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
	userID		char(8),		-- ���̵�
	userName	nvarchar(10),	-- �̸�
	birthYear	int,			--����⵵
	addr		nchar(2),		-- ����
	mobile1		char(3),		--�޴��� ����
	mobile2		char(8),		-- gbeovhsqjsgh
	height		smallint,		--Ű
	mDate		date			--ȸ��������

);
go

create table byeTBL
();
go

