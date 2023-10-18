DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_password`(
INPUT_URL TEXT,
 NEW_PASSWORD VARCHAR(30)
)
BEGIN
UPDATE password SET PW = aes_encrypt(NEW_PASSWORD,'summer') where URL = INPUT_URL;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_URL`(
INPUT_PW varbinary(200),
INPUT_URL TEXT
)
BEGIN
UPDATE password SET URL = INPUT_URL where PW = aes_encrypt('wilson20','summer'); 
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_password`(
INPUT_URL TEXT,
INPUT_FIRST varchar(15)
)
BEGIN
 DELETE FROM password where URL = INPUT_URL AND First_Name = INPUT_FIRST;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_URL`(
INPUT_URL TEXT)
BEGIN
delete from password where URL = INPUT_URL;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_info`(
FIRST_NAME varchar(15),
LAST_NAME varchar(15),
USERNAME varchar(15),
EMAIL_ADDRESS varchar(30),
PASS_WORD varchar(30),
WEBSITE varchar(30),
URL text,
COMMENT  text
)
BEGIN
INSERT INTO password values(FIRST_NAME, LAST_NAME, USERNAME,EMAIL_ADDRESS, aes_encrypt(PASS_WORD,'summer'), now() ,WEBSITE,URL,COMMENT);
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrive_pw`(
INPUT_URL TEXT)
BEGIN
select cast( aes_decrypt(PW,'summer') as char) PW from password where First_Name = INPUT_URL;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrive_URL`(
INPUT_URL TEXT)
BEGIN
select cast( aes_decrypt(PW,'summer') as char) PW from password where First_Name = INPUT_URL;
END//
DELIMITER ;

