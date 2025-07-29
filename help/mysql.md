## drop database
```
drop database dbname;
```

## create database
```
create database name;
```

## import single database
```
mysql -uroot -p dbname < db.sql
```

## import method 2
```
use dbname;
source db.sql;
```

## drop user
```
drop user name;
```

## list users
```
select user,host from mysql.user;
```

## create user
```
CREATE USER 'new_user'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, CREATE, DROP, ALTER, INDEX, TRIGGER, RELOAD, CREATE USER ON *.* TO 'new_user'@'%';

FLUSH PRIVILEGES;
```

## Grant privileges to user
```
GRANT CREATE TEMPORARY TABLES, INSERT, TRIGGER, ALTER, REFERENCES, INDEX, ALTER ROUTINE, DELETE, LOCK TABLES, EXECUTE, SHOW VIEW, SELECT, CREATE, CREATE ROUTINE, DROP, UPDATE, CREATE VIEW, EVENT, GRANT OPTION ON `fcf_local`.* TO 'new_user'@'%';

FLUSH PRIVILEGES;
```

## mysqldump single database remotely
```
mysqldump -h -u -p database_name > dump.sql 
```

## mysqldump skip comments
```
mysqldump -h -u -p database_name > dump.sql --skip-comments
```

## mysqldump --all-databases
```
mysqldump -uroot -p --all-databases > dump.sql
```

## mysqldump retain encoding?
```
mysqldump -uroot -p database -r dump.sql
```

## show databases
```
show databases;
```

## use database
```
use databasename;
```

## show tables
```
show tables;
```

## replication users
```
GRANT REPLICATION SLAVE ON *.* TO replication_user;
```

## show grants for current user
```
show grants;
```

## check slave privileges
```
SELECT user, host FROM mysql.user WHERE Repl_slave_priv = 'Y';
```

## lock all databases
```
FLUSH TABLES WITH READ LOCK;
```

## unlock all databases
```
UNLOCK TABLES;
```

## MD5
```
SELECT MD5('notsecret'); 
```

## Convert all tables to innodb
Copy the output and run as a new SQL query

https://stackoverflow.com/a/30648414/1331456

```
SELECT CONCAT('ALTER TABLE ',TABLE_NAME,' ENGINE=InnoDB;') 
FROM INFORMATION_SCHEMA.TABLES
WHERE ENGINE='MyISAM'
AND table_schema = 'mydatabase';
```

## Timezone

```
SELECT @@global.time_zone;

SET GLOBAL time_zone = '+8:00';

SET @@global.time_zone='+00:00';
```

https://stackoverflow.com/questions/19023978/should-mysql-have-its-timezone-set-to-utc

https://aws.amazon.com/premiumsupport/knowledge-center/rds-change-time-zone/

## Select
```
SELECT * FROM `table-name` ORDER BY `column`;
```

## Sum minus sum and rollup
```
SELECT pt_user_id, sum(pt_point_add)-sum(pt_point_use)
FROM member_point_system
group by pt_user_id with rollup;
```


## Update 

```
UPDATE `db_name`.`table_name` SET column_name = 'block';
```

```
UPDATE `database_name`.`table_name` SET email = 'hello@example.com'
WHERE NOT email LIKE "%example-one.com" AND NOT
email LIKE "%example-two.com";
```

## Group By
```
select created_by,COUNT(*) 
FROM tablea
where tablea.created_by is not null and tablea.deleted_at is null
group by created_by;
```

## Where And
```
select CONCAT(tableb.name_given, ' ', tableb.name_family),COUNT(*)
from tablea
left join tableb
on tablea.created_by = tableb.user_uuid
where tablea.created_by is not null and tablea.deleted_at is null
group by tablea.created_by, tableb.name_given, tableb.name_family;
```

## Is not null
```
select COUNT(*) FROM tablea
where tablea.created_by is not null and tablea.deleted_at is not null;
```

## Rename table
Rename table old_table_new to new_table_name;

## Find my.cnf
```
mysql --help | grep /my.cnf | xargs ls
```
