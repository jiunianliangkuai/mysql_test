-- 创建字符数据
CREATE DATABASE IF NOT EXISTS `type_test`;

USE type_test;

CREATE TABLE IF NOT EXISTS `char_test`(
	str1 CHAR(5),
	str2 VARCHAR(5)
);

INSERT char_test VALUES('1', '1');

INSERT char_test VALUES('12345', '12345');


-- INSERT char_test VALUES('123456', '123456');
-- error too long

INSERT char_test VALUES('','');

INSERT char_test VALUES('1  ', '1  ');
-- 对于 char 类型的数据,末尾的空格会被删除

INSERT char_test VALUES('  a', '  1');

INSERT char_test VALUES('啊', '啊');

SELECT CONCAT(str1, '-'), CONCAT(str2, '-') FROM char_test;

-- 对于数据检索而言 效率 CHAR>VARCHAR>TEXT