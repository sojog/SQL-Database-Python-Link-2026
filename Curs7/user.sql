SHOW DATABASES;

USE mysql;
Show TABLES;

DROP DATABASE IF EXISTS db_privilegii;

CREATE DATABASE db_privilegii;
USE db_privilegii;

CREATE USER 'privilegii_admin'@'localhost' IDENTIFIED BY 'parolaxyz';
GRANT ALL PRIVILEGES ON db_privilegii.* TO 'privilegii_admin'@'localhost';

CREATE USER 'privilegii_user'@'127.0.0.1' IDENTIFIED BY 'parola123';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_privilegii.*  TO 'privilegii_user'@'127.0.0.1';

CREATE USER 'privilegii_viewer'@'%' IDENTIFIED BY 'parolaabc';
GRANT SELECT ON db_privilegii.*  TO 'privilegii_viewer'@'%';



REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'privilegii_user'@'127.0.0.1';

GRANT SELECT ON db_privilegii.* TO 'privilegii_user'@'127.0.0.1';

DROP USER 'privilegii_viewer'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'privilegii_admin'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON db_privilegii.* TO 'privilegii_admin'@'localhost';

SELECT user, host from mysql.user;
