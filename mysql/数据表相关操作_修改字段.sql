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

 ALTER TABLE `act_on_tables` ADD test CHAR(10) NOT NULL FIRST,

-- 修改字段类型 MODIFY 只修改属性 也可以同时设定完整性约束条件,可修改位置,但不可修改名称
ALTER TABLE `act_on_tables` MODIFY test varchar(200);
ALTER TABLE `act_on_tables` MODIFY test CHAR(50) NOT NULL DEFAULT 'TEST@qq.com'FIRST;
ALTER TABLE `act_on_tables` MODIFY test CHAR(50) NOT NULL DEFAULT 'TEST@qq.com'AFTER birth;

-- change 可以修改名称(必须修改名称) 和属性和完整约束,和位置
ALTER TABLE `act_on_tables` CHANGE `test` `test_rename` CHAR(50) NOT NULL DEFAULT 'TEST_rename@qq.com'AFTER birth;
ALTER TABLE `act_on_tables` CHANGE `test_rename` `test` CHAR(50) NOT NULL DEFAULT 'TEST_rename@qq.com'AFTER birth;

/*
    注意!!!
    mysql 语句在;后执行,执行后才生效.
    所以在同一语句中添加删除是无效的.因为添加的语句尚未实际生效
*/
