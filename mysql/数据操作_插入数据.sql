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

-- 插入其他表中的数据
DROP TABLE IF EXISTS `data_op_test_extra_table`;
CREATE TABLE IF NOT EXISTS `data_op_test_extra_table`(
    id       TINYINT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL UNIQUE
    )AUTO_INCREMENT = 100;

INSERT data_op_test_extra_table SELECT id, username from data_op_test;

DROP TABLE IF EXISTS `data_op_test_extra_table`;
CREATE TABLE IF NOT EXISTS `data_op_test_extra_table`(
    id       TINYINT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL UNIQUE
    );

INSERT data_op_test_extra_table(username) SELECT username from data_op_test;


