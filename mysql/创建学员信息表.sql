 -- SHOW TABLES;
 -- 创建数据库
 CREATE DATABASE IF NOT EXISTS `learning_db`;

 USE `learning_db`;

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
DROP TABLE IF EXISTS `user`;
 CREATE TABLE IF NOT EXISTS `user`(
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
 	)ENGINE=INNODB CHARSET=UTF8;