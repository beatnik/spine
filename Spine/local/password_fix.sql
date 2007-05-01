delete from users where login = "admin";
insert into users (email,fullname,login,password,usergroup) values ('root@localhost','Administrator','admin','acbd18db4cc2f85cedef654fccc4a4d8','admin'); 
delete from session;
