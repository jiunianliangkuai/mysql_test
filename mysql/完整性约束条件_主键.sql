-- 完整性约束条件

-- 测试枚举类型
-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `key_test`;

USE `key_test`;

-- 可以省略 primary 直接用key 表示主键
CREATE TABLE IF NOT EXISTS `primary_test`(
	id SMALLINT PRIMARY KEY,
	username VARCHAR(20)
	);

-- 查看创建表的定义
SHOW CREATE TABLE `primary_test`;

-- 主键不允许重复
INSERT `primary_test` VALUES(112,'男   ');


-- 查询主键
SELECT * FROM primary_test WHERE id = 112;

-- 多主键
CREATE TABLE IF NOT EXISTS `mutil_primary_test`(
	id SMALLINT,
	username VARCHAR(20),
	card CHAR(18),
	PRIMARY KEY(id, card)
	);

DESC `mutil_primary_test`;

-- 多主键时 多个主键同时确定一个元素,可以部分相同
INSERT `mutil_primary_test` VALUES(1, 'KING', '111');

INSERT `mutil_primary_test` VALUES(1, 'QUEEN', '112')

