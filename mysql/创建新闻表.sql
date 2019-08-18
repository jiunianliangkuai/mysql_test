CREATE DATABASE IF NOT EXISTS `learning_db`;

USE `learning_db`;
-- 创建分类表
DROP TABLE IF EXISTS `cms_cate`;
CREATE TABLE IF NOT EXISTS `cms_cate`(
	id TINYINT,
	cate_Name VARCHAR(50),
	cate_Desc VARCHAR(200)
)ENGINE=MyISAM;

-- 创建新闻表
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE IF NOT EXISTS cms_news(
	new_id TINYINT,
	new_titles VARCHAR(200),
	new_content TEXT,
	new_time TIMESTAMP,
	new_hitcount TINYINT,
	new_top TINYINT(1) COMMENT '0代表不置顶,1 代表置顶',
	cid TINYINT,
	new_creater VARCHAR(20)
)ENGINE=INNODB;