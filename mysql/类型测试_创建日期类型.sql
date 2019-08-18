-- 创建日期类型数据
CREATE DATABASE IF NOT EXISTS `type_test`;

USE type_test;

DROP TABLE IF EXISTS `time_test`;

CREATE TABLE IF NOT EXISTS `time_test`(
	birth YEAR,
	test_time TIME,
	test_date DATE
);

-- 得到 0000 年 一天 12 小时 12 分 12 秒
INSERT `time_test` VALUES(0000, '1 12:12:12', '12-6-7');

-- 0012会被认为是 2012, 11 小时 11 分默认省略秒数
INSERT `time_test` VALUES(0012, '11:11', '12/6/7');

-- 13会被认为是 2013 , 12 分钟 34 秒.省略了小时
INSERT `time_test` VALUES(13, '1234', '120607');

-- 超过 70 会被认为 1970+, 被认为是 12 秒
INSERT `time_test` VALUES(71, '12', '12@6#7');

-- 最大值为 2155, 完全就是零
INSERT `time_test` VALUES(2155,'0','12@6#7');

-- 可以接收字符串, 完全就是零
INSERT `time_test` VALUES('1988',0,'12@6#7');

-- '0' 为2000 年
INSERT `time_test` VALUES('0', '1234','12@6#7');




 