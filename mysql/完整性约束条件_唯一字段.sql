-- 完整性约束条件

-- 测试枚举类型
-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `key_test`;

USE `key_test`;

-- 唯一字段可被用作索引 NULL 不算重复
DROP TABLE IF EXISTS `unique_test`;
CREATE TABLE IF NOT EXISTS `unique_test`(
	id SMALLINT KEY AUTO_INCREMENT,
	username VARCHAR(20) NOT NULL UNIQUE,
	password CHAR(32) UNIQUE
	)AUTO_INCREMENT = 100;

-- 查看创建表的定义
SHOW CREATE TABLE `unique_test`;

-- 给部分字段赋值
INSERT `unique_test`(username, password) VALUES('KING', NULL);
-- 同为 NULL 不重复
INSERT `unique_test`(username, password) VALUES('QUEEN', NULL);

SELECT * FROM `unique_test`;
