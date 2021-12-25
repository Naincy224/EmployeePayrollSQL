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
mysql> insert into employee_pay_roll(name, salary,startDate)
    -> values('aman',50000,'2020-01-01'),
    -> ('atul',40000,'2021-01-01'),
    -> ('akshat',20000,'2019-01-01'),
    -> ('naincy',20000,'2020-01-01'),
    -> ('shristy',40000,'2021-01-01');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee_pay_roll;
+----+---------+--------+------------+
| id | name    | salary | startDate  |
+----+---------+--------+------------+
|  1 | aman    |  50000 | 2020-01-01 |
|  2 | atul    |  40000 | 2021-01-01 |
|  3 | akshat  |  20000 | 2019-01-01 |
|  4 | naincy  |  20000 | 2020-01-01 |
|  5 | shristy |  40000 | 2021-01-01 |
+----+---------+--------+------------+
5 rows in set (0.00 sec)

mysql> select * from employee_pay_roll where salary='20000';
+----+--------+--------+------------+
| id | name   | salary | startDate  |
+----+--------+--------+------------+
|  3 | akshat |  20000 | 2019-01-01 |
|  4 | naincy |  20000 | 2020-01-01 |
+----+--------+--------+------------+
2 rows in set (0.00 sec)
mysql> select * from employee_pay_roll where startDate between cast('2020-01-01'as date)and date(now());
+----+---------+--------+------------+
| id | name    | salary | startDate  |
+----+---------+--------+------------+
|  1 | aman    |  50000 | 2020-01-01 |
|  2 | atul    |  40000 | 2021-01-01 |
|  4 | naincy  |  20000 | 2020-01-01 |
|  5 | shristy |  40000 | 2021-01-01 |
+----+---------+--------+------------+
4 rows in set (0.00 sec)

mysql> alter table employee_pay_roll add gender char(2)after name;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_pay_roll;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | startDate  |
+----+---------+--------+--------+------------+
|  1 | aman    | NULL   |  50000 | 2020-01-01 |
|  2 | atul    | NULL   |  40000 | 2021-01-01 |
|  3 | akshat  | NULL   |  20000 | 2019-01-01 |
|  4 | naincy  | NULL   |  20000 | 2020-01-01 |
|  5 | shristy | NULL   |  40000 | 2021-01-01 |
+----+---------+--------+--------+------------+
5 rows in set (0.00 sec)

mysql> update employee_pay_roll set gender = 'M' where name = 'atul';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_pay_roll set gender = 'M' where name = 'akshat';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_pay_roll set gender = 'F' where name = 'naincy';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_pay_roll set gender = 'F' where name = 'shristy';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_pay_roll;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | startDate  |
+----+---------+--------+--------+------------+
|  1 | aman    | M      |  50000 | 2020-01-01 |
|  2 | atul    | M      |  40000 | 2021-01-01 |
|  3 | akshat  | M      |  20000 | 2019-01-01 |
|  4 | naincy  | F      |  20000 | 2020-01-01 |
|  5 | shristy | F      |  40000 | 2021-01-01 |
+----+---------+--------+--------+------------+
5 rows in set (0.00 sec)
mysql> select sum(salary) from employee_pay_roll where gender = 'F' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       60000 |
+-------------+
1 row in set (0.00 sec)

mysql> select sum(salary) from employee_pay_roll where gender = 'F';
+-------------+
| sum(salary) |
+-------------+
|       60000 |
+-------------+
1 row in set (0.00 sec)
