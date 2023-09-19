create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
ClassID int not null primary key auto_increment,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit
);
create table Student(
StudentID int not null primary key auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status Bit,
ClassID int not null,
foreign key (ClassID) references Class (ClassID)
);
create table Subject(
SubID int not null primary key auto_increment,
SubName varchar(30) not null,
Credit tinyint not null default 1 check (credit >= 1),
Status Bit default 1
);
create table Mark(
MarkID int not null primary key auto_increment,
SubID int not null,
StudentID int not null,
unique (SubID, StudentID),
Mark float default 0 check(Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key (StudentID) references Student (StudentID),
foreign key (SubID) references Subject (SubID)
);
insert into Class
values(1, 'A1', '2008-12-20', 1);
insert into Class
values(2, 'A2', '2008-12-22', 1);
insert into Class
values(3, 'B3', current_date, 0);

insert into Student(StudentName, Address, Phone, Status, ClassID)
values('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student(StudentName, Address, Status, ClassID)
values('Hoa', 'Hai Phong', 1, 1);
insert into Student(StudentName, Address, Phone, Status, ClassID)
values('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

insert into Mark (SubID, StudentID, Mark, ExamTimes)
values (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

select * from Student;

select * from Student
where Status = true;

select * from Subject
where Credit < 10;

select S.StudentID, S.StudentName, C.ClassName
from Student S join Class C on S.ClassID = C.ClassID
where C.ClassName = 'A1';

select S.StudentID, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentID = M.StudentID join Subject Sub on M.SubID = Sub.SubID
where Sub.SubName = 'CF';