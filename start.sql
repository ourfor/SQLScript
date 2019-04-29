CREATE DATABASE [EDUC] ON  PRIMARY 
( NAME = N'student_data', FILENAME = N'D:\DBMS\sql_data\student_data.mdf' , SIZE = 6144KB , MAXSIZE = 51200KB , FILEGROWTH = 5%)
 LOG ON 
( NAME = N'student_log', FILENAME = N'D:\DBMS\sql_data\student_log.ldf' , SIZE = 7168KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
GO

use EDUC;
go

create table Student
(Sno char(9) primary key,
Sname char(20),
Ssex char(2),
Sage smallint,
Sdept char(20));

create table Course
(Cno char(4) primary key,
Cname char(40),
Cpno char(4),
Ccredit smallint);

create table SC
(Sno char(9),
Cno char(4),
Grade smallint,
primary key(Sno,Cno));


insert 
into Student
(Sno,Sname,Ssex,Sage,Sdept)
values
('200215121','李勇','男',20,'CS'),
('200215122','刘晨','女',19,'IS'),
('200215123','王敏','女',18,'MA'),
('200215125','张立','女',19,'IS');

select * from Student;

insert
into Course
(Cno,Cname,Cpno,Ccredit)
values
('1','数据库','5',4),
('2','数学',NULL,2),
('3','信息系统','1',4),
('4','操作系统','6',3),
('5','数据结构','7',4),
('6','数据处理',NULL,2),
('7','PASCAL语言','6',5);


select * from Course;

insert 
into SC
(Sno,Cno,Grade)
values
('200215121','1',92),
('200215121','2',85),
('200215121','3',88),
('200215122','2',90),
('200215122','3',80);

select * from SC;

select Sname [姓名],2019-Sage [出生年份]
from Student
where Ssex='男';

select * from Student;

select Sname [姓名],Sdept [系别],Sage [年龄]
from Student
where Ssex='男' and Sage between 18 and 21;

select Sname [姓名],Ssex [性别]
from Student
where Ssex='女' and Sdept in ('IS','CS');


select Cno
from  (select SC.Cno ,Ssex
from SC,Student
where SC.Sno=Student.Sno) as A
group by Cno
having count(distinct Ssex) >=2;
