-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;
DROP TABLE IF EXISTS `data_extern_link_test`;
CREATE TABLE IF NOT EXISTS `data_extern_link_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18,
	sex ENUM('male', 'female', 'secret') DEFAULT 'secret',
	proID INT

);

-- 值和字段顺序一一对应
INSERT `data_extern_link_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male', 3);
INSERT INTO `data_extern_link_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2, 3);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_extern_link_test`(username, password, sex, age, proID) VALUE ('JACK', 'JACK', 'MALE', '17', 2);

-- 同时插入多条
INSERT `data_extern_link_test`(username, password, proID) VALUE ('111', '111', 2),
    ('222', '222', 3);

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_extern_link_test` SET username='test_1', password = 'test_1', proID = 4;

INSERT `data_extern_link_test` SET username='test_2', password = 'test_2', proID = 400;

-- 内连接查询
SELECT d.id, d.username, p.name
FROM data_extern_link_test AS d
CROSS JOIN provinces AS p
ON d.proID = p.id;

/*
+----+----------+--------+
| id | username | name   |
+----+----------+--------+
|  1 | KING     | 安徽   |
|  2 | QUEEN    | 安徽   |
|  3 | JACK     | 北京   |
|  4 | 111      | 北京   |
|  5 | 222      | 安徽   |
|  6 | test_1   | 福建   |
+----+----------+--------+
*/

-- 左外连接查询
SELECT d.id, d.username, p.name
FROM data_extern_link_test AS d
LEFT JOIN provinces AS p
ON d.proID = p.id;

-- 以左表为主表.在右表中不对应的部分结果为 NULL
/*
+----+----------+--------+
| id | username | name   |
+----+----------+--------+
|  1 | KING     | 安徽   |
|  2 | QUEEN    | 安徽   |
|  3 | JACK     | 北京   |
|  4 | 111      | 北京   |
|  5 | 222      | 安徽   |
|  6 | test_1   | 福建   |
|  7 | test_2   | NULL   |
+----+----------+--------+
*/

-- 右外连接查询
SELECT d.id, d.username, p.name
FROM data_extern_link_test AS d
RIGHT JOIN provinces AS p
ON d.proID = p.id;

/*
+------+----------+-----------+
| id   | username | name      |
+------+----------+-----------+
|    1 | KING     | 安徽      |
|    2 | QUEEN    | 安徽      |
|    3 | JACK     | 北京      |
|    4 | 111      | 北京      |
|    5 | 222      | 安徽      |
|    6 | test_1   | 福建      |
| NULL | NULL     | 中国      |
| NULL | NULL     | 甘肃      |
| NULL | NULL     | 广东      |
| NULL | NULL     | 广西      |
| NULL | NULL     | 贵州      |
| NULL | NULL     | 海南      |
| NULL | NULL     | 河北      |
| NULL | NULL     | 河南      |
| NULL | NULL     | 黑龙江    |
| NULL | NULL     | 湖北      |
| NULL | NULL     | 湖南      |
| NULL | NULL     | 吉林      |
| NULL | NULL     | 江苏      |
| NULL | NULL     | 江西      |
| NULL | NULL     | 辽宁      |
| NULL | NULL     | 内蒙古    |
| NULL | NULL     | 宁夏      |
| NULL | NULL     | 青海      |
| NULL | NULL     | 山东      |
| NULL | NULL     | 山西      |
| NULL | NULL     | 陕西      |
| NULL | NULL     | 上海      |
| NULL | NULL     | 四川      |
| NULL | NULL     | 天津      |
| NULL | NULL     | 西藏      |
| NULL | NULL     | 新疆      |
| NULL | NULL     | 云南      |
| NULL | NULL     | 浙江      |
| NULL | NULL     | 重庆      |
| NULL | NULL     | 香港      |
| NULL | NULL     | 澳门      |
| NULL | NULL     | 台湾      |
+------+----------+-----------+
*/

-- 同理可以分组和排序
SELECT ANY_VALUE(d.id), ANY_VALUE(d.username), ANY_VALUE(p.name) AS pro_name
FROM data_extern_link_test AS d
LEFT JOIN provinces AS p
ON d.proID = p.id
WHERE d.sex = 'male'
GROUP BY p.name;

-- 也可以多表连接JOIN ON JOIN ON