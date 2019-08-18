-- 完整性约束条件

-- 测试枚举类型
-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `key_test`;

USE `key_test`;

-- 自增长字段必须为主键,可指定开始值
DROP TABLE IF EXISTS `auto_inc_test`;
CREATE TABLE IF NOT EXISTS `auto_inc_test`(
	id SMALLINT KEY AUTO_INCREMENT,
	username VARCHAR(20)
	)AUTO_INCREMENT = 1000;

-- 修改自增长起点
ALTER TABLE `auto_inc_test` AUTO_INCREMENT = 500;

-- 查看创建表的定义
SHOW CREATE TABLE `auto_inc_test`;

-- 主键不允许重复
INSERT `auto_inc_test` VALUES(112,'KING');

-- 如果不指定 id 字段 会自动在最大值上加 1
INSERT `auto_inc_test`(username) VALUES('QUEEN');

-- 指定是按照指定值
INSERT `auto_inc_test` VALUES(12,'KING1');

-- 使用 null 也表示默认加一
INSERT `auto_inc_test` VALUES(NULL,'KING2');

-- 使用 DEFAULT 也表示默认加一
INSERT `auto_inc_test` VALUES(DEFAULT,'KING3');

-- 查询主键
SELECT * FROM auto_inc_test WHERE id = 112;
