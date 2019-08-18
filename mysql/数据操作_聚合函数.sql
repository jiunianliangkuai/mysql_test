-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;

DROP TABLE IF EXISTS `data_function_test`;
CREATE TABLE IF NOT EXISTS `data_function_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18,
	sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
);

-- 值和字段顺序一一对应
INSERT `data_function_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male');
INSERT INTO `data_function_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_function_test`(username, password, sex, age) VALUE ('JACK', 'JACK', 'MALE', '17');

-- 同时插入多条
INSERT `data_function_test`(username, password) VALUE ('111', '111'),
    ('222', '222');

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_function_test` SET username='set', password = 'set';


-- 聚合函数COUNT MAX MIN AVG SUM

-- 查询总数 不统计 NULL
SELECT COUNT(*) AS 'COUNT_NUM' FROM data_function_test;
SELECT COUNT(id) AS 'COUNT_NUM' FROM data_function_test;


-- 配合分组 查看各组情况
SELECT sex, GROUP_CONCAT(username) AS 'username', COUNT(*) AS 'COUNT_NUM' FROM data_function_test GROUP BY sex;

-- 多组查询
SELECT sex, GROUP_CONCAT(username) AS 'username',COUNT(*) AS 'COUNT_NUM',
       MAX(age) AS 'MAX_AGE', MIN(age) AS 'MIN_AGE',AVG(age) AS 'AVG_AGE',
       SUM(age) AS 'SUM_AGE' FROM data_function_test GROUP BY sex;

-- WITH ROLLUP
-- 同时对全表进行统计
SELECT sex, GROUP_CONCAT(username) AS 'username',COUNT(*) AS 'COUNT_NUM', MAX(age) AS 'MAX_AGE' FROM data_function_test GROUP BY sex WITH ROLLUP;
