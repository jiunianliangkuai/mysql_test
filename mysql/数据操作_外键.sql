-- 创建字符数据
-- 外键是表中的特殊字段
-- 必须有主表才能给子表确定外键
-- 必须存储为 InnoDB 才能使用外键
-- 元素必须为相似数据类型
-- 外键类必须是索引,不指定的话会自动添加

-- 比如 省份是固定的 不管有没有人 都会存在,那么省份表就是主表
CREATE DATABASE IF NOT EXISTS `data_test`;

USE data_test;
DROP TABLE IF EXISTS `sub_table_test`;
DROP TABLE IF EXISTS `main_table_test`;
-- 主表
CREATE TABLE IF NOT EXISTS `main_table_test`(
    id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS `sub_table_test`;
-- 附表
CREATE TABLE IF NOT EXISTS `sub_table_test`(
	id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
	username VARCHAR(20) NOT NULL UNIQUE ,
	password CHAR(32) NOT NULL ,
	email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
	age TINYINT UNSIGNED DEFAULT 18,
	sex ENUM('male', 'female', 'secret') DEFAULT 'secret',
	sub_id TINYINT UNSIGNED,
	FOREIGN KEY (sub_id) REFERENCES main_table_test(id) ON DELETE CASCADE ON UPDATE CASCADE
-- 	FOREIGN KEY (sub_id) REFERENCES main_table_test(id) ON DELETE SET NULL ON UPDATE SET NULL
    # 外键,ON DELETE CASCADE表示主表中删除记录时附表也会被删除ON UPDATE CASCADEB表示更新时级联
    # ON DELETE SET NULL 删除时附表设置为 null
);

-- 主表
INSERT `main_table_test`(name) VALUE ('教学部');
INSERT `main_table_test`(name) VALUE ('文学部');
INSERT `main_table_test`(name) VALUE ('视觉部');
INSERT `main_table_test`(name) VALUE ('宣传部');

-- 值和字段顺序一一对应
INSERT `sub_table_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male', 1);
INSERT INTO `sub_table_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2, 3);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `sub_table_test`(username, password, sex, age, sub_id) VALUE ('JACK', 'JACK', 'MALE', '17', 2);

-- 同时插入多条
INSERT `sub_table_test`(username, password, sub_id) VALUE ('111', '111', 2),
    ('222', '222', 3);

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `sub_table_test` SET username='test_1', password = 'test_1', sub_id = 4;

-- 设置外键后,就不能添加超过主表的字段了
-- INSERT `sub_table_test` SET username='test_2', password = 'test_2', sub_id = 111;

-- 设置外键后,无法直接操作主表
-- DELETE FROM `main_table_test` WHERE id=1;

-- 左外连接查询
SELECT s.id, s.username, m.name
FROM sub_table_test AS s
LEFT JOIN main_table_test AS m
ON s.sub_id = m.id;

/*
+----+----------+-----------+
| id | username | name      |
+----+----------+-----------+
|  4 | 111      | 宣传部    |
|  5 | 222      | NULL      |
|  3 | JACK     | 视觉部    |
|  1 | KING     | 教学部    |
|  2 | QUEEN    | 文学部    |
|  6 | test_1   | NULL      |
|  7 | test_2   | NULL      |
+----+----------+-----------+
*/

