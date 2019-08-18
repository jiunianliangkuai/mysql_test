 -- SHOW TABLES;
 -- 创建数据库
 CREATE DATABASE IF NOT EXISTS `tables_test`;

 USE `tables_test`;

 -- 创建表
 -- 编号 id
 -- 用户名 username
 -- 年龄 age
 -- 性别 sex
 -- 邮箱 email
 -- 地址 addr
 -- 生日 birth
 -- 薪水 salary
 -- 电话 tel
 -- 是否结婚 married
 -- 通过 SET NAMES GBK; 可以临时转换客户端编码方式
 -- 字段注释 用 comment
DROP TABLE IF EXISTS `act_on_tables`;
 CREATE TABLE IF NOT EXISTS `act_on_tables`(
	id SMALLINT,
	username VARCHAR(20),
	age TINYINT,
 	sex ENUM('male','female', 'unknown'),
 	email VARCHAR(50),
 	addr VARCHAR(200),
 	birth YEAR,
 	salary FLOAT(8,2),
 	tel INT,
 	married TINYINT(1) COMMENT '0代表未结婚.1 代表结婚了'
 	)ENGINE=INNODB;

-- 添加字段 CARD 字段
ALTER TABLE `act_on_tables` ADD card CHAR(18) NOT NULL UNIQUE;

-- 指定添加字段位置
ALTER TABLE `act_on_tables` ADD `test1` CHAR(10) NOT NULL FIRST;
ALTER TABLE `act_on_tables` ADD `test2` CHAR(10) NOT NULL AFTER salary;

-- 添加多个字段
ALTER TABLE `act_on_tables`
    ADD test3 CHAR(10) NOT NULL FIRST,
    ADD test4 INT(10) NOT NULL AFTER married,
    ADD test5 YEAR NOT NULL AFTER test4;

-- 删除字段
ALTER TABLE `act_on_tables`
    DROP `test2`,
    DROP `test3`,
    DROP `test4`,
    DROP `test5`;

-- 同时删除和添加
ALTER TABLE `act_on_tables`
    ADD test CHAR(10) NOT NULL FIRST,
    DROP `test1`;
