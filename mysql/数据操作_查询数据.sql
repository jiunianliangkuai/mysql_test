-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;

DROP TABLE IF EXISTS `data_op_test`;
CREATE TABLE IF NOT EXISTS `data_op_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18
);

-- 值和字段顺序一一对应
INSERT `data_op_test` VALUES(1,'KING', 'KING', DEFAULT, DEFAULT);
INSERT INTO `data_op_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, DEFAULT);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_op_test`(username, password) VALUE ('JACK', 'JACK');

-- 同时插入多条
INSERT `data_op_test`(username, password) VALUE ('111', '111'),
    ('222', '222');

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_op_test` SET username='set', password = 'set';

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

-- 表和字段别名
SELECT d.username AS u, d.password AS p FROM data_test.data_op_test AS d;

-- 指定查询 <=> 可以匹配 NULL = 不能
-- IS NULL 也可以匹配 NULL
SELECT d.username, d.password FROM data_test.data_op_test AS d WHERE id<=>1;
SELECT d.username, d.password FROM data_test.data_op_test AS d WHERE id BETWEEN 1 AND 2;

-- 范围查询
SELECT d.username, d.password FROM data_test.data_op_test AS d WHERE id BETWEEN 1 AND 2;
SELECT * FROM `data_op_test` WHERE id IN (1, 3, 5);

-- 模糊查询
-- % 代表 0 个或者多个字符
-- _代表一个字符
SELECT * FROM `data_op_test` WHERE username LIKE '%K%';
SELECT * FROM `data_op_test` WHERE username LIKE 'k%';/* 以 K 开头的字段,查询不区分大小写*/
SELECT * FROM `data_op_test` WHERE username LIKE '____';/* 4 位的字段*/
SELECT * FROM `data_op_test` WHERE username LIKE '_I%';/* 第二位为 i后面不知道*/

-- 逻辑运算符 AND OR
-- 查询用户名为 king 密码为 king 的用户
SELECT * FROM `data_op_test` WHERE username LIKE '____' AND password LIKE 'KING';/* 第二位为 i后面不知道*/
