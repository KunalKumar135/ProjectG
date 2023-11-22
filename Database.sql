-- create database Test;-- 
use Test;

create table user(name varchar(40),email varchar(40),password varchar(40));
insert into user values('Kunal','kk1@gmail.com','12345');
desc user;
ALTER TABLE user ADD PRIMARY KEY (email);
ALTER TABLE user DROP COLUMN Language;
Alter table user ADD(Language varchar(40)  NULL);
UPDATE user SET Language='Python' WHERE email='kk1@gmail.com';
UPDATE user SET Language='C' WHERE email='fsx@gmail.com';
select * from user;

create table m1(id numeric(10) ,Lang varchar(20) primary key);
insert into m1 values(1001,'Python');
insert into m1 values(1002,'Java');
insert into m1 values(1003,'C');
select * from m1;

drop table m1;
create table m2(Title varchar(10) ,Lang varchar(20) , des varchar(120), FOREIGN KEY(Lang) REFERENCES m1(Lang));
insert into m2 values("XYZ","Python","Track your progress with the free My Learning program here at W3Schools Log in to your account");
insert into m2 values("XOR","Python","jhkjdshfkjdkjfndsifhkudshfilfhdlfijdhfkufklnj jkdfbehjfghjbdkjas hdhendduahdk");
insert into m2 values("cALC","C","jkunal kumarehjfghjbdkjas hdhendduahdk");
insert into m2 values("UWYAZ","C","C is a programming language");
insert into m2 values("DAA","JAVA","Java is a programming language");

select * from m2;

select Title , Lang from m1 A ,m2 B where A.id=1003;
