-- 测试枚举类型
-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `type_test`;

USE type_test;

CREATE TABLE IF NOT EXISTS `enum_test`(
	sex ENUM('男', '女', '保密')
);

INSERT `enum_test` VALUES('男   ');

INSERT `enum_test` VALUES('女   ');

INSERT `enum_test` VALUES('保密');

INSERT `enum_test` VALUES(2);
-- 相当于选择第二个

INSERT `enum_test` VALUES(NULL);
-- 枚举类型可以为空