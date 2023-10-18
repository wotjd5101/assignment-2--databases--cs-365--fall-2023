create database passwords;

show databases;

use passwords;

create table password (
First_Name varchar(15) not null,
Last_Name varchar(15) not null,
UserName varchar(15) not null,
Email_Address varchar(30) not null,
PW varbinary(200) default null,
Created_At timestamp not null default  current_timestamp,
website varchar(30) not null null,
URL text default null,
Comment text default null,

primary key (First_Name)
);


call insert_info('Noah', 'Wilson', 'nwilson','nwilson@gmail.com','wilson20','Yahoo!','https://www.Yahoo.com','Test Comment');
call insert_info('Oliver', 'Johnson', 'ojohnson','ojohnson@gmail.com','ojohnson12','Youtube','https://www.youtube.com/',null);
call insert_info('James', 'Wiliams', 'jwiliams','jwiliams@gmail.com','jwiliams19','Statefarm','https://www.statefarm.com',null);
call insert_info('Elijah', 'Anderson', 'eanderson','eanderson@gmail.com','eanderson52','Nike','https://www.nike.com/',null);
call insert_info('William', 'Rodriguez', 'wrodriguez','wrodriguez@gmail.com','wrondriguez19','Adidas','https://www.adidas.com/us',null);
call insert_info('Henry', 'Brown', 'hbrwon','hbrwon@gmail.com','hbrwon85','Asics','https://www.asics.com/us/en-us/',null);
call insert_info('Lucas', 'Garcia', 'lgarcia','lgarcia@gmail.com','lgarcia65','Zara','https://www.zara.com/',null);
call insert_info('Benjamin', 'Taylor', 'btaylor','btaylor@gmail.com','btaylor65','ALLSAINTS','https://www.allsaints.com/men.html',null);
call insert_info('Emma', 'Martinez', 'emartinez','emartinez@gmail.com','emartinez328','UNIQLO','https://www.uniqlo.com/us/en/',null);