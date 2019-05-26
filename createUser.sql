select name
from sys.databases;
go

select name
from sys.databases;
go

use Study;
go

select name
from sys.tables;
go


create table book(
    name nvarchar(10),
    id nchar(4) primary key
);
go

select name
from sys.tables;
go

insert
into book
(name,id)
values
(N'朝花夕拾','1002'),
(N'山海经','1003'),
(N'唐诗三百首','1004');
go

select *
from book
order by id desc;
go


delete
from book
where id='1004';
go


update
book
set name=N'基督山伯爵'
where id='1002';
go

select name [书名],id [编号]
from book;
go

insert
into book
(name,id)
values
(N'唐诗三百首','1004'),
(N'汤姆索亚历险记','1005');
go

select id,name
from book;
go

select name
from sys.syslogins;
go


select name
from sys.sysusers;
go


create login Sagit with password='2320813747DB$$';
go

select name
from sys.syslogins;
go

create user Sagit for login Sagit;
go


select name
from sys.sysusers;
go

drop user Sagit;

select name
from sys.sysusers;
go

drop login Sagit;
go


select name
from sys.syslogins;
go

use master;
select name
from sys.views;
go


select name
from spt_values;
go
