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

SELECT id FROM main_table_test WHERE name = '宣传部';

-- 子查询一定是从子层到外层的顺序执行的

-- 通过 IN 使用子查询 子查询结果为集合
SELECT username from sub_table_test WHERE sub_id IN(SELECT id FROM main_table_test WHERE name = '宣传部');
SELECT username from sub_table_test WHERE sub_id NOT IN(SELECT id FROM main_table_test WHERE name = '宣传部');

-- 通过比较运算符使用子查询 子查询结果为一条字符
SELECT main_table_test.name FROM  main_table_test WHERE id = 1;
SELECT username from sub_table_test WHERE sub_id <=> (SELECT main_table_test.name FROM  main_table_test WHERE id = 1);

-- exist子查询 判断子查询结果是否为空
SELECT name FROM main_table_test WHERE id = 5;
SELECT username FROM sub_table_test WHERE EXISTS(SELECT name FROM main_table_test WHERE id = 5);

-- ANY SOME ALL ANY = SOME
-- ANY SOME ALL 是在比较运算符中使用的.
-- 一般来说 比较字符串子查询结果是单行数据.
-- 使用了 ANY ALL 就变成了集合数据
-- 比如
-- > ANY 表示 只要大于最小值就通过
-- > ALL 表示 大于最大值才通过
-- < ANY 表示 只要小于最大值就通过
-- < ALL 表示 小于最小值才通过
-- = ANY 表示等于任意值均可通过
-- != ALL 表示不等于任何结果才通过
-- 注意! 没有=ALL 和!= ANY
-- 注意 = ANY 其实等价 IN != ALL 其实就是 NOT IN


SELECT username FROM sub_table_test WHERE sub_id<=> ANY (SELECT main_table_test.name FROM  main_table_test WHERE id = 1);


-- 子查询建表
DROP TABLE IF EXISTS `test_test`;
CREATE TABLE IF NOT EXISTS `test_test`(
    id       TINYINT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL UNIQUE
);
INSERT test_test SELECT id, username FROM sub_table_test;

DROP TABLE IF EXISTS `test_2_test`;
CREATE TABLE IF NOT EXISTS `test_2_test`(
    id       TINYINT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL UNIQUE
)SELECT id, username FROM sub_table_test;

-- 子查询建表需要保证字段名相同