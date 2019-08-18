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

sql_create_table = '''DROP TABLE IF EXISTS `data_group_test`;
CREATE TABLE IF NOT EXISTS `data_group_test`(
    id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
    username VARCHAR(20) NOT NULL UNIQUE ,
    password CHAR(32) NOT NULL ,
    email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
    age TINYINT UNSIGNED DEFAULT 18,
    sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
);'''
sql_execute(cursor, sql_create_table)

# SQL 插入语句
sql_insert = """
INSERT `data_group_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male');
INSERT INTO `data_group_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2);

-- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
INSERT `data_group_test`(username, password, sex, age) VALUE ('JACK', 'JACK', 'MALE', '17');

-- 同时插入多条
INSERT `data_group_test`(username, password) VALUE ('111', '111'),
    ('222', '222');

-- 通过 set 插入记录 (只需要列出必备项)
INSERT `data_group_test` SET username='set', password = 'set';
 2000)"""
sql_execute(cursor, sql_insert)

sql_select = '''SELECT * FROM `data_group_test`;
'''
data = sql_execute(cursor, sql_select)
print(data)


# # -*- coding: UTF-8 -*-
# import pymysql
#
#
# def sql_execute(cursor, sql):
#     try:
#         # 执行sql语句
#         cursor.execute(sql)
#         # 提交到数据库执行
#         db.commit()
#     except Exception as e:
#         # 如果发生错误则回滚
#         db.rollback()
#
#
# def pymysql_test(db):

#     # 使用cursor()方法获取操作游标
#     cursor = db.cursor()
#
#     sql_create_table = '''DROP TABLE IF EXISTS `data_group_test`;
#     CREATE TABLE IF NOT EXISTS `data_group_test`(
#         id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
#         username VARCHAR(20) NOT NULL UNIQUE ,
#         password CHAR(32) NOT NULL ,
#         email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
#         age TINYINT UNSIGNED DEFAULT 18,
#         sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
#     );'''
#     sql_execute(cursor, sql_create_table)
#
#     # SQL 插入语句
#     sql_insert = """
#     INSERT `data_group_test` VALUES(1,'KING', 'KING', DEFAULT, 32, 'male');
#     INSERT INTO `data_group_test` VALUES(2,'QUEEN', 'QUEEN', DEFAULT, 31, 2);
#
#     -- 只赋值必须要赋值的字段, 同样值和字段顺序一一对应(只需要保证必须赋值的字段在,可以有DEFAULT 字段)
#     INSERT `data_group_test`(username, password, sex, age) VALUE ('JACK', 'JACK', 'MALE', '17');
#
#     -- 同时插入多条
#     INSERT `data_group_test`(username, password) VALUE ('111', '111'),
#         ('222', '222');
#
#     -- 通过 set 插入记录 (只需要列出必备项)
#     INSERT `data_group_test` SET username='set', password = 'set';
#      2000)"""
#     sql_execute(cursor, sql_insert)
#
#     sql_select = '''SELECT * FROM `data_group_test`;
#     '''
#     sql_execute(cursor, sql_select)
#     data = cursor.fetchone()
#     print(data)
#
#
# if __name__ == '_main__':
#     db = pymysql.connect("localhost", "root", "xdlxxd215118", "pymysql_learning_db")
#     pymysql_test(db)
#     # 关闭数据库连接
#     db.close()
