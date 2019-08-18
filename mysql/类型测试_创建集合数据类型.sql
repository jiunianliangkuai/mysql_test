-- 创建集合数据类型
CREATE DATABASE IF NOT EXISTS `type_test`;

USE type_test;

CREATE TABLE IF NOT EXISTS `set_test`(
	far SET('A', 'B', 'C', 'D')
);

INSERT set_test VALUES('A,C,D');

INSERT set_test VALUES('B,D,A');

INSERT set_test VALUES(3);

INSERT set_test VALUES(15);