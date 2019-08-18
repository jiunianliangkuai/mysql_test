# -*- coding: UTF-8 -*-
import pymysql


def sql_execute(cursor, sql):
    result = None
    try:
        # 执行sql语句
        result = cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except Exception as e:
        # 如果发生错误则回滚
        db.rollback()
    return result


# 打开数据库连接
db = pymysql.connect("localhost", "root", "xdlxxd215118", "pymysql_learning_db")

# 使用cursor()方法获取操作游标
cursor = db.cursor()


# 打开数据库连接
db = pymysql.connect("localhost", "root", "xdlxxd215118", "pymysql_learning_db")

# 使用cursor()方法获取操作游标
cursor = db.cursor()

sql_creat_table_1 = '''DROP TABLE IF EXISTS `data_group_test`'''
sql_creat_table_2 ='''CREATE TABLE IF NOT EXISTS `data_group_test`(
    id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
    username VARCHAR(20) NOT NULL UNIQUE ,
    password CHAR(32) NOT NULL ,
    email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
    age TINYINT UNSIGNED DEFAULT 18,
    sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
)'''
sql_execute(cursor, sql_creat_table_1)
sql_execute(cursor, sql_creat_table_2)


# SQL 插入语句
sql_insert_1 = """
INSERT `data_group_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male')"""
sql_insert_2 = """
INSERT INTO `data_group_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2)"""
sql_insert_3 = """
INSERT `data_group_test`(username, password, sex, age) VALUE ('JACK', 'JACK', 'MALE', '17')"""
sql_insert_4 = """
INSERT `data_group_test`(username, password) VALUE ('111', '111'),('222', '222')"""
sql_insert_5 = """
INSERT `data_group_test` SET username='set', password = 'set')"""

sql_execute(cursor, sql_insert_1)
sql_execute(cursor, sql_insert_2)
sql_execute(cursor, sql_insert_3)
sql_execute(cursor, sql_insert_4)
sql_execute(cursor, sql_insert_5)

sql_select = """SELECT * FROM `data_group_test`;
"""
result = sql_execute(cursor, sql_select)
print(result)
data = cursor.fetchall()
print(data)


db.close()
