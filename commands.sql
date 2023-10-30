
/*
#############Instruction###############

#create a new entry
- if you do not want to add comment, you must include null
call Insert_info(First_Name, Last name, username, email address, password, website, url, comment);

#get the password associated with the URL of one of your 10 entries
call retrive_pw(URL);

#get all the password-related data, including the password, associated with URLs that have 'https' in two of your 10 entries
call retrive_info();

#Change a url associated with one of the passwords in your 10 entries
call change_url(INPUT_PW ,
INPUT_URL);

#change any password
call change_password(INPUT_URL,
 NEW_PASSWORD);

#remove a URL
call delete_URL(
INPUT_URL)

#remove a password
call delete_PW(
INPUT_PW)

*/

DROP PROCEDURE IF EXISTS Insert_info;
DROP PROCEDURE IF EXISTS retrive_info;
DROP PROCEDURE IF EXISTS retrive_pw;
DROP PROCEDURE IF EXISTS change_password;
DROP PROCEDURE IF EXISTS change_URL;
DROP PROCEDURE IF EXISTS delete_PW;
DROP PROCEDURE IF EXISTS delete_URL;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_info`(
FIRST_NAME varchar(15),
LAST_NAME varchar(15),
USERNAME varchar(15),
EMAIL_ADDRESS varchar(30),
PASS_WORD varchar(30),
WEBSITE varchar(30),
URL text,
COMMENT text
)
BEGIN

if COMMENT = '' then

	set COMMENT = null;
end if;

INSERT INTO password values(FIRST_NAME, LAST_NAME, USERNAME,EMAIL_ADDRESS, aes_encrypt(PASS_WORD,@key_str, @init_vector), now() ,WEBSITE,URL,COMMENT);

END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrive_pw`(
INPUT_URL TEXT)
BEGIN
	select cast( aes_decrypt(PW,@key_str,@init_vector) as char) PW 
	from password 
	where URL = INPUT_URL;
	END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_URL`(
INPUT_PW VARCHAR(30),
INPUT_URL TEXT
)
BEGIN
UPDATE password SET URL = INPUT_URL where PW = aes_encrypt(INPUT_PW,@key_str, @init_vector); 
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_password`(
INPUT_URL TEXT,
 NEW_PASSWORD VARCHAR(30)
)
BEGIN
UPDATE password SET PW = aes_encrypt(NEW_PASSWORD,@key_str, @init_vector) where URL = INPUT_URL;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_URL`(
INPUT_URL TEXT)
BEGIN
/*UPDATE password SET URL = null WHERE URL = INPUT_URL;*/
	delete from password where URL = INPUT_URL;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_PW`(
INPUT_PW varchar(30))
BEGIN
	delete from password where PW = aes_encrypt(INPUT_PW,@key_str, @init_vector);
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrive_info`()

BEGIN

		SELECT 
		
		First_Name, 
		Last_Name, 
		UserName, 
		Email_Address, 
		cast( aes_decrypt(PW,@key_str, @init_vector) as char) as 'PW', 
		Created_At, 
		website, 
		URL, 
		Comment 
		
		FROM password;
END//
DELIMITER ;





