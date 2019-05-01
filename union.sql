select A.sname [姓名],A.sno [学号],sc.cno [课程号],course.cname [选修课程名]
from sc,
(select sname [姓名],sno [学号]
from student
where sname like N'_向%') as A(sname,sno),
course
where A.sno=sc.sno and sc.cno=course.cno;
go

declare @sno char(10) = (select sno from student where sname=N'张力')
declare @grade smallint = (select avg(grade) from sc group by sno having sno=@sno)

select sname [姓名],A.sno [学号],A.grade [平均成绩]
from
(select sno,avg(grade)
from sc
group by sno) as A(sno,grade),student
where grade > @grade and A.sno=student.sno
go

select B.sno [学号],student.sname [姓名],student.sdept [所在院系],B.credit [已修学分]
from
(select sno,sum(credit)
from
(select course.credit,sc.sno
from sc,course,student
where grade >=60 and sc.cno=course.cno and sc.sno=student.sno) as A(credit,sno)
group by sno) as B(sno,credit),student
where B.sno=student.sno
go

select sc.sno [学号],sc.cno [课程号],student.sname [学生姓名]
from sc,student
where cno in(
select cno
from sc
where sno in
(select sno
from student
where sname=N'张力')) and sc.sno=student.sno;
go

declare @database int = (select cno from course where cname=N'数据库')
declare @datastruct int = (select cno from course where cname=N'数据结构')

select *
from student
where sno in
(select A.sno
from sc,
(select sno
from sc
where sno in
(select sno
from sc
where cno=@database) and cno=@datastruct) as A(sno)
where A.sno=sc.sno
group by A.sno
having count(distinct sc.sno) =2)


declare @database int = (select cno from course where cname=N'数据库')
declare @datastruct int = (select cno from course where cname=N'数据结构')

select *
from student
where sno in
(select sno
from sc
where cno in (@datastruct,@database))

select *
from student
where sdept=N'CS'
intersect
select *
from student
where ssex=N'女'

select * 
from student
where sno in
(select sno
from sc
where cno=1
intersect
select sno
from sc 
where cno=2)


select *
from student
where sdept=N'CS'
union
select * 
from student
where sage < 19

select *
from student
where sdept=N'CS'
except
select * 
from student
where sage < 19

select *
from student
where sage < all
(select sage
from student
where sdept=N'CS')
and sdept <> N'CS'
go

select *
from student
where sage < 
(select max(sage)
from student
where sdept=N'CS')
and sdept <> N'CS'

select student.sname [姓名],student.sno [学号]
from student,sc
where sc.cno in
(select sc.cno
from sc,student
where student.sname=N'张向东' and student.sno=sc.sno) and sc.sno=student.sno

select course.cno,course.cname,sc.sno,student.sname,sc.grade
from course,sc,student
where course.cno=sc.cno and sc.sno=student.sno
order by cno

