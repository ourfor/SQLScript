create procedure usp_s_c
as
select A.sno [学号],A.sname "姓名",A.sdept "系别",c.cname "课程名",A.grade "分数"
from course c,(
        select s.sname,s.sdept,sc.cno,sc.grade,sc.sno
        from student s,sc
        where s.sno=sc.sno
    ) as A
where c.cno=A.cno;
go

create procedure usp_s_cBysno
@sno varchar(12)
as
select A.sno [学号],A.sname "姓名",A.sdept "系别",c.cname "课程名",A.grade "分数"
from course c,(
    select s.sname,s.sdept,sc.cno,sc.grade,sc.sno
    from student s,sc
    where s.sno=sc.sno and sc.sno=@sno
) as A
where c.cno=A.cno;
go

exec usp_s_cBysno '200515002';

exec usp_1 '200515006',N'数据库';

exec usp_s_c;

create procedure usp_1
@sno varchar(12),@cname nvarchar(12)
as
select A.sname "姓名",c.cname "课程名",A.grade "分数"
from course c,(
    select s.sname,s.sdept,sc.cno,sc.grade
    from student s,sc
    where s.sno=sc.sno and sc.sno=@sno
) as A
where c.cno=A.cno and c.cname=@cname;
go

exec usp_2 N'数据库';


create procedure usp_2
@cname nvarchar(12)
    as
select avg(grade) "平均分"
from sc
where cno=(
    select cno
    from course
    where cname=@cname
);
