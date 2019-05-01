select Sname [姓名],2019-Sage [出生年份]
from student;
go

select Sname [姓名],Sdept [系别],Sage [年龄]
from Student
where Ssex=N'男' and Sage between 18 and 21;
go

select Sname [姓名],Ssex [性别]
from Student
where Sdept in (N'IS',N'CS') and Ssex=N'女';
go

select cno [课程号]
from
    (select SC.cno,Student.Ssex
    from SC,Student
    where SC.sno=Student.sno) as A
group by cno
having count(distinct Ssex) >=2;
go

sp_addtype [编号],'char(8)','not null';
go

create database BookSys on primary
(name=N'booksys_data',filename=N'/var/opt/mssql/data/booksys_data.mdf',
size=5mb,maxsize=16mb,filegrowth=5%)
log on
(name=N'booksys_log',filename=N'/var/opt/mssql/data/booksys_log.ldf',
size=5mb,maxsize=18mb,filegrowth=1mb)
collate Chinese_PRC_CS_AI_WS;
go

use BookSys;
go

create table tsxx
(tusbh char(10) primary key,
shum char(20) not NULL,
jiag smallint,
chubs char(30),
chubrq date,
zuoz char(10));
go

create table dzxx
(duzbh char(10) not null,
xingm char(10) not null,
shenfzh char(18),
jib smallint,
primary key(shenfzh));

create table jyxx
(duzbh char(10),
tusbh char(10),
jieyrq date,
huansrq date,
shifxj bit,
primary key(duzbh,tusbh));
go

alter
table dzxx
add contact char(11) null;
go

alter
table tsxx
alter column chubs char(200)
go

alter
table dzxx
drop column contact
go

insert 
into tsxx
(tusbh,shum)
values
(N'19820105',N'朝花夕拾');
go

insert 
into dzxx
(duzbh,xingm,shenfzh)
values
(N'00001001',N'Alise',N'431081133411091715');
go

insert 
into jyxx
(duzbh,tusbh)
values
(N'00001001',N'19820105');
go

update 
dzxx
set jib=2
where duzbh=N'00001001';
go

delete
from jyxx
where duzbh=N'00001001' and tusbh=N'10010001';
go
