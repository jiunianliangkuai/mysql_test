-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;

DROP TABLE IF EXISTS `data_second_select_test`;
CREATE TABLE IF NOT EXISTS `data_second_select_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18,
	sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
);

-- 值和字段顺序一一对应
INSERT `data_second_select_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male');
INSERT INTO `data_second_select_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_second_select_test`(username, password, sex, age) VALUE ('JACK', 'JACK', 'MALE', '17');

-- 同时插入多条
INSERT `data_second_select_test`(username, password) VALUE ('111', '111'),
    ('222', '222');

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_second_select_test` SET username='set', password = 'set';

-- 查询表 单表查询
/*
SELECT select_expr [, select_expr ...]
[
    FROM table_references
    [WHERE 条件]
    [GROUP BY {col_name|position} [ASC|DESC],...分组]
    [HAVING 条件, 对分组结果进行二次筛选]
    [ORDER BY {col_name|position} [ASC|DESC],...排序]
    [LIMIT 限制条数]
]
*/

/*
group 只列出组中第一元素.不知道组内有多少元素
*/

-- 分组
SELECT  ANY_VALUE(id) AS 'id', ANY_VALUE(username) AS 'username',
       ANY_VALUE(password) AS 'password'
FROM data_second_select_test
GROUP BY sex;

-- 更新
UPDATE `data_second_select_test` SET sex='male' WHERE username LIKE '_1_';

SELECT  ANY_VALUE(id) AS 'id', ANY_VALUE(username) AS 'username',
       ANY_VALUE(password) AS 'password'
FROM data_second_select_test
GROUP BY sex;

UPDATE `data_second_select_test` SET sex='secret' WHERE username LIKE '_1_';

SELECT  ANY_VALUE(id) AS 'id', ANY_VALUE(username) AS 'username',
       ANY_VALUE(password) AS 'password'
FROM data_second_select_test
GROUP BY sex;

-- 可以多字段分组
SELECT  ANY_VALUE(id) AS 'id', ANY_VALUE(username) AS 'username',
       ANY_VALUE(password) AS 'password'
FROM data_second_select_test
WHERE age > 18
GROUP BY sex;

-- 配合GROUP_CONCAT 获得分组详情
SELECT sex, GROUP_CONCAT(username), GROUP_CONCAT(password)
FROM data_second_select_test
GROUP BY sex;

-- 配合聚合函数COUNT MAX MIN AVG SUM
SELECT sex, GROUP_CONCAT(username) AS 'username', COUNT(*) AS 'TOTAL COUNT'
FROM data_second_select_test
GROUP BY sex;

-- HAVING 子句二次筛选
SELECT sex, GROUP_CONCAT(username) AS 'username',COUNT(*) AS 'COUNT_NUM',
       MAX(age) AS 'MAX_AGE', MIN(age) AS 'MIN_AGE',AVG(age) AS 'AVG_AGE',
       SUM(age) AS 'SUM_AGE'
FROM data_second_select_test
GROUP BY sex
HAVING COUNT_NUM >= 2;

-- HAVING 多重查询
SELECT sex, GROUP_CONCAT(username) AS 'username',COUNT(*) AS 'COUNT_NUM',
       MAX(age) AS 'MAX_AGE', MIN(age) AS 'MIN_AGE',AVG(age) AS 'AVG_AGE',
       SUM(age) AS 'SUM_AGE'
FROM data_second_select_test
WHERE age > 18
GROUP BY sex
HAVING COUNT_NUM >= 2 AND MAX_AGE > 31;