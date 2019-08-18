# -*- coding: UTF-8 -*-

import pymysql

# 打开数据库连接
db = pymysql.connect("localhost", "root", "xdlxxd215118", "pymysql_learning_db")

# 使用 cursor() 方法创建一个游标对象 cursor
cursor = db.cursor()

# 数据表名称
name = 'employee'

drop_SQL = 'DROP TABLE IF EXISTS %s'% name

# 使用 execute() 方法执行 SQL，如果表存在则删除
cursor.execute(drop_SQL)

create_SQL = """CREATE TABLE %s (
         FIRST_NAME  CHAR(20) NOT NULL,
         LAST_NAME  CHAR(20),
         AGE INT,  
         SEX CHAR(1),
         INCOME FLOAT )""" % name
# 使用预处理语句创建表create_SQL

cursor.execute(create_SQL)

# 关闭数据库连接
db.close()
