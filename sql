Amits-MacBook-Pro:~ amitsingh$ /usr/local/mysql/bin/mysql -u root -p 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.27 MySQL Community Server - GPL

mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| naincy_schema      |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.03 sec)
mysql> use payroll_service;
Database changed
mysql> create table employee_pay_roll(id INT unsigned NOT NULL auto_increment, name varchar(150) Not null, salary double Not Null, startDate date, primary key(id));
Query OK, 0 rows affected (0.01 sec)

mysql> describe employee_pay_roll;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int unsigned | NO   | PRI | NULL    | auto_increment |
| name      | varchar(150) | NO   |     | NULL    |                |
| salary    | double       | NO   |     | NULL    |                |
| startDate | date         | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)
