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


-- 添加删除唯一属性
ALTER TABLE `act_on_tables` ADD UNIQUE (tel);

/*
唯一性是索引,主键本身就是特殊的索引
主键不需要再加唯一性,本身就是唯一性
*/


-- 指定索引名称 uni_tel 就是索引名称 删除时删除的也是索引名称 不写的时候默认用字段名表示索引名
ALTER TABLE `act_on_tables` DROP INDEX `tel`;
ALTER TABLE `act_on_tables` ADD CONSTRAINT symbol UNIQUE KEY uni_tel (tel);
ALTER TABLE `act_on_tables` DROP INDEX `uni_tel`;

-- 添加复合索引
ALTER TABLE `act_on_tables` ADD CONSTRAINT symbol UNIQUE INDEX mul_index(tel, test);
ALTER TABLE `act_on_tables` DROP INDEX `mul_index`;
ALTER TABLE `act_on_tables` ADD CONSTRAINT symbol UNIQUE INDEX test_name(tel, test);
ALTER TABLE `act_on_tables` DROP KEY `test_name`;
ALTER TABLE `act_on_tables` ADD CONSTRAINT symbol UNIQUE INDEX mul_index(test, tel);
