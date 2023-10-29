/* Please source command.sql*/

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 512));
SET @init_vector = RANDOM_BYTES(16);

DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

USE passwords;

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

primary key (First_Name, UserName)
);




insert into password values ('Noah', 'Wilson', 'nwilson','nwilson@gmail.com', aes_encrypt('wilson20',@key_str, @init_vector),now(),'Yahoo!','https://www.Yahoo.com','Test Comment');
insert into password values('Oliver', 'Johnson', 'ojohnson','ojohnson@gmail.com',aes_encrypt('ojohnson12',@key_str, @init_vector),now(),'Youtube','https://www.youtube.com/',null);
insert into password values('James', 'Wiliams', 'jwiliams','jwiliams@gmail.com',aes_encrypt('jwiliams19',@key_str, @init_vector),now(),'Statefarm','https://www.statefarm.com',null);
insert into password values('Elijah', 'Anderson', 'eanderson','eanderson@gmail.com',aes_encrypt('eanderson52',@key_str, @init_vector),now(),'Nike','https://www.nike.com/',null);
insert into password values('William', 'Rodriguez', 'wrodriguez','wrodriguez@gmail.com',aes_encrypt('wrondriguez19',@key_str, @init_vector),now(),'Adidas','https://www.adidas.com/us',null);
insert into password values('Henry', 'Brown', 'hbrwon','hbrwon@gmail.com',aes_encrypt('hbrwon85',@key_str, @init_vector),now(),'Asics','https://www.asics.com/us/en-us/',null);
insert into password values('Lucas', 'Garcia', 'lgarcia','lgarcia@gmail.com',aes_encrypt('lgarcia65',@key_str, @init_vector),now(),'Zara','https://www.zara.com/',null);
insert into password values('Benjamin', 'Taylor', 'btaylor','btaylor@gmail.com',aes_encrypt('btaylor65',@key_str, @init_vector),now(),'ALLSAINTS','https://www.allsaints.com/men.html',null);
insert into password values('Emma', 'Martinez', 'emartinez','emartinez@gmail.com',aes_encrypt('emartinez328',@key_str, @init_vector),now(),'UNIQLO','https://www.uniqlo.com/us/en/',null);
insert into password values('Josh', 'Anderson', 'Janderson','Janderson@gmail.com',aes_encrypt('Janderson940',@key_str, @init_vector),now(),'MUJI','https://www.muji.us/',null);












