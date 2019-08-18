-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;

DROP TABLE IF EXISTS `data_intern_link_test`;
CREATE TABLE IF NOT EXISTS `data_intern_link_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18,
	sex ENUM('male', 'female', 'secret') DEFAULT 'secret',
	proID INT

);

-- 值和字段顺序一一对应
INSERT `data_intern_link_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male', 3);
INSERT INTO `data_intern_link_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2, 3);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_intern_link_test`(username, password, sex, age, proID) VALUE ('JACK', 'JACK', 'MALE', '17', 2);

-- 同时插入多条
INSERT `data_intern_link_test`(username, password, proID) VALUE ('111', '111', 2),
    ('222', '222', 3);

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_intern_link_test` SET username='test', password = 'test', proID = 4;

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

-- 分组查询 username, provinces name, id
SELECT provinces.name, data_intern_link_test.username, data_intern_link_test.id FROM data_intern_link_test, provinces;

-- 并非想要的结果 应该是 data_intern_link_test.proid = provinces.id
SELECT data_intern_link_test.id, data_intern_link_test.username, provinces.name FROM data_intern_link_test, provinces
WHERE provinces.id= data_intern_link_test.proID;

-- 内连接查询
SELECT d.id, d.username, p.name
FROM data_intern_link_test AS d
INNER JOIN provinces AS p
ON d.proID = p.id;

SELECT d.id, d.username, p.name
FROM provinces AS p
JOIN data_intern_link_test AS d
ON d.proID = p.id;

-- 可以在内连接查询中添加条件
SELECT d.id, d.username, p.name
FROM data_intern_link_test AS d
CROSS JOIN provinces AS p
ON d.proID = p.id
WHERE d.sex = 'male';

-- 同理可以分组和排序
SELECT ANY_VALUE(d.id), ANY_VALUE(d.username), ANY_VALUE(p.name) AS pro_name
FROM data_intern_link_test AS d
CROSS JOIN provinces AS p
ON d.proID = p.id
WHERE d.sex = 'male'
GROUP BY p.name;

-- 也可以多表连接JOIN ON JOIN ON