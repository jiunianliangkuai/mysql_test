-- 完整性约束条件

-- 测试枚举类型
-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `key_test`;

USE `key_test`;

-- 一般非空字段会配合默认值字段使用
DROP TABLE IF EXISTS `default_test`;
CREATE TABLE IF NOT EXISTS `default_test`(
	id SMALLINT KEY AUTO_INCREMENT,
	username VARCHAR(20) NOT NULL,
	password CHAR(32) NOT NULL,
	age TINYINT UNSIGNED DEFAULT 18,
	addr VARCHAR(50) NOT NULL DEFAULT 'BEIJING',
	sex ENUM('男', '女', '保密') NOT NULL DEFAULT '保密'
	)AUTO_INCREMENT = 100;

-- 查看创建表的定义
SHOW CREATE TABLE `default_test`;

-- 给部分字段赋值
INSERT `default_test`(username, password) VALUES(112,'KING');

INSERT `default_test` VALUES(2, 'QUEEN1', 'QUEEN', '29', 'DALIAN', '男');

-- 指定是按照指定值
INSERT `default_test` VALUES(3, 'QUEEN1', 'QUEEN', DEFAULT, DEFAULT, '男');

-- 使用 null 也表示默认加一
INSERT `default_test` VALUES(NULL,'KING2');

-- 使用 DEFAULT 也表示默认加一
INSERT `default_test` VALUES(DEFAULT,'KING3');

-- 查询主键
SELECT * FROM `default_test` WHERE id = 112;
