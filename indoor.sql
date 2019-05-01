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


declare @sno char(9),@sname char(8)
set @sno=N'200215121'
select @sname=sname from student where sno=@sno
print @sname

if (select avg(grade) from sc where sno=@sno)>85
print @sname+'考出了高分'
else 
print @sname+'考得一般'

select [性别]=
case 
when ssex=N'男' then N'男生'
when ssex=N'女' then N'女生'
else N'条件不明'
end,
sno [学号],sname [姓名],sage [年龄],sdept [院系]
from student
go

select [院系]=
case
when sdept='CS' then N'计算机系'
when sdept='IS' then N'信息系'
when sdept='MA' then N'数学系'
when sdept='EN' then N'外语系'
when sdept='CM' then N'中医系'
when sdept='WM' then N'西医系'
else N'院系不明'
end,
sno [学号],sname [姓名],ssex [性别],sage [年龄]
from student
order by sdept desc;

select sdept [院系],[院系规模] =
case
when count(*) >=5 then N'规模很大'
when count(*) >=4 then N'规模一般'
when count(*) <4 and count(*)>=2 then N'规模稍小'
else N'规模很小'
end
from student
group by sdept
having sdept <> '' and sdept is not NULL;
go
