# -*- coding: UTF-8 -*-
import pymysql
import re

def sql_execute(db, sql):
    result = None
    cursor = db.cursor()
    try:
        # 执行sql语句
        result = cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except Exception as e:
        # 如果发生错误则回滚
        db.rollback()
    return result


def sql_drop_table(name):
    sql_creat_table_1 = '''DROP TABLE IF EXISTS `%s`'''
    return sql_creat_table_1 % name


def sql_create_table(name):
    sql_creat_table_2 ='''CREATE TABLE IF NOT EXISTS `%s`(
        id TINYINT UNSIGNED AUTO_INCREMENT KEY ,
        username VARCHAR(20) NOT NULL UNIQUE ,
        password CHAR(32) NOT NULL ,
        email VARCHAR(50)NOT NULL DEFAULT 'test@qq.com',
        age TINYINT UNSIGNED DEFAULT 18,
        sex ENUM('male', 'female', 'secret') DEFAULT 'secret'
    )'''
    return sql_creat_table_2 % name


def sql_instert(id, username, password, email, age, sex):
    sql = """INSERT `data_group_test` VALUES(%d, '%s', '%s', %s, %s, %s)"""

#    list = [i.start() for i in re.finditer('%\D%', sql)]
    list = re.fullmatch(r'%\D%', sql)
    print(list)

    if sex == 'DEFAULT':
        sql.index('%')
    return sql % (id, username, password, email, age, sex)


def pymysql_test(db):
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    print(sql_drop_table('data_group_test'))

    sql_execute(db, sql_drop_table('data_group_test'))
    sql_execute(db, sql_create_table('data_group_test'))

    # SQL 插入语句
    sql_insert_1 = sql_instert(1, 'KING', 'KING', 'DEFAULT', '32', 'DEFAULT')
    sql_insert_2 = sql_instert(2, 'QUEEN', 'QUEEN', 'DEFAULT', 'DEFAULT', 'female')
    sql_insert_3 = sql_instert(3, 'JACK', 'JACK', 'DEFAULT', 'DEFAULT', 'DEFAULT')
    sql_insert_4 = sql_instert(4, '111', '111', 'DEFAULT', 'DEFAULT', 'DEFAULT')
    print(sql_insert_4)
    sql_insert_5 = sql_instert(5, '222', '222', 'DEFAULT', 'DEFAULT', 'DEFAULT')

    sql_execute(db, sql_insert_1)
    sql_execute(db, sql_insert_2)
    sql_execute(db, sql_insert_3)
    sql_execute(db, sql_insert_4)
    sql_execute(db, sql_insert_5)

    sql_select = """SELECT * FROM `data_group_test`;
    """
    result = sql_execute(db, sql_select)
    print(result)
    data = cursor.fetchall()
    print(data)


if __name__ == '__main__':
    # 打开数据库连接
    db = pymysql.connect("localhost", "root", "xdlxxd215118", "pymysql_learning_db")
    pymysql_test(db)
    db.close()
