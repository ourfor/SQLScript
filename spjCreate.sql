create database project on primary
(name=N'project_data',filename=N'/var/opt/mssql/data/project_data.mdf',size=5mb,maxsize=16mb,filegrowth=5%)
log on
(name=N'project_log',filename=N'/var/opt/mssql/data/project_log.ldf',size=5mb,maxsize=16mb,filegrowth=1mb)
collate Chinese_PRC_CS_AI_WS;
go

create table s
(sno char(6) primary key,
sname nvarchar(12),
status smallint,
city nvarchar(12));
go

create table p(
pno char(6) primary key,
pname nvarchar(12),
color nvarchar(6),
weight smallint);
go

create table j(
jno char(6) primary key,
jname nvarchar(12),
city nvarchar(12));
go

create table spj(
sno char(6),
pno char(6),
jno char(6),
qty smallint,
primary key(sno,pno,jno));
go


insert
into s
(sno,sname,status,city)
values
('S1',N'精益',20,N'天津'),
('S2',N'盛锡',10,N'北京'),
('S3',N'东方红',30,N'北京'),
('S4',N'丰泰盛',20,N'天津'),
('S5',N'为民',30,N'上海');
go

insert
into p
(pno,pname,color,weight)
values
('P1',N'螺母',N'红',12),
('P2',N'螺母',N'绿',17),
('P3',N'螺丝刀',N'蓝',14),
('P4',N'螺丝刀',N'红',14),
('P5',N'凸轮',N'蓝',40),
('P6',N'齿轮',N'红',30);
go

use project;
go

insert
into j
(jno,jname,city)
values
('J1',N'三建',N'北京'),
('J2',N'一汽',N'长春'),
('J3',N'弹簧厂',N'天津'),
('J4',N'造船厂',N'天津'),
('J5',N'机车厂',N'唐山'),
('J6',N'无线电厂',N'常州'),
('J7',N'半导体厂',N'南京');
go


insert
into spj
(sno,pno,jno,qty)
values
('S1','P1','J1',200),
('S1','P1','J3',100),
('S1','P1','J4',700),
('S1','P2','J2',100),
('S2','P3','J1',400),
('S2','P3','J2',200),
('S2','P3','J4',500),
('S2','P3','J5',400),
('S2','P5','J1',400),
('S2','P5','J2',100),
('S3','P1','J1',200),
('S3','P3','J1',200),
('S4','P5','J1',100),
('S4','P6','J3',300),
('S4','P6','J4',200),
('S5','P2','J4',100),
('S5','P3','J1',200),
('S5','P6','J2',200),
('S5','P6','J4',500);
go
