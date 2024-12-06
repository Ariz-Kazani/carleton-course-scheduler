import sqlite3

def initialize():
    sql_file_path = 'populate.sql'
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    with open(sql_file_path, 'r') as file:
        sql = file.read()
        cursor.executescript(sql)
    db.close()