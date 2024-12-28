import sqlite3
import json

def initialize():
    sql_file_path = 'populate.sql'
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    with open(sql_file_path, 'r') as file:
        sql = file.read()
        cursor.executescript(sql)
    db.close()

def print_all_courses():
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT * FROM courses")
    courses = cursor.fetchall()
    db.close()

    for course in courses:
        print(f"Course Code: {course[0]}")
        print(f"Course Name: {course[1]}")
        print(f"Faculty: {course[2]}")
        print(f"Credits: {course[3]}")
        print("")

def print_all_programs():
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT * FROM programs")
    programs = cursor.fetchall()
    db.close()
    for program in programs:
        print(f"Program Name: {program[0]}")
        print(f"Program Type: {program[1]}")
        print(f"Program Faculty: {program[2]}")
        print("")

def print_all_prerequisites():
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT * FROM prerequisites")
    prerequisites = cursor.fetchall()
    db.close()
    for prerequisite in prerequisites:
        print(f"Course Code: {prerequisite[0]}")
        print(f"Prerequisite: {prerequisite[1]}")
        print("")

def print_all_available_courses():
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT * FROM available_courses")
    available_courses = cursor.fetchall()
    db.close()
    for available_course in available_courses:
        print(f"Course Code: {available_course[1]}")
        print(f"Section: {available_course[2]}")
        print(f"Professor: {available_course[3]}")
        times = json.loads(available_course[4])
        days = ""
        for day in times['days']:
            days += day + " "
        print(f"Days: {days}")
        print(f"Start Time: {times['start_time']}")
        print(f"End Time: {times['end_time']}")
        print("")

def print_my_programs(id):
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT programs.p_name, programs.program_type, programs.faculty FROM student_programs JOIN programs ON student_programs.p_name = programs.p_name WHERE student_programs.s_num = ?;", (id,))
    student_programs = cursor.fetchall()
    db.close()
    for student_program in student_programs:
        print(f"Program Name: {student_program[0]}")
        print(f"Program Type: {student_program[1]}")
        print(f"Program Faculty: {student_program[2]}")
        print("")

def print_my_completed_courses(id):
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT courses.c_code, courses.c_name, courses.faculty, courses.credits, completed_courses.grade FROM courses JOIN completed_courses ON courses.c_code = completed_courses.c_code WHERE completed_courses.s_num = ?;", (id,))
    student_courses = cursor.fetchall()
    db.close()
    for student_course in student_courses:
        print(f"Mark Earned: {student_course[4]}")
        print(f"Credit(s) Earned: {student_course[3]}")
        print(f"Course Code: {student_course[0]}")
        print(f"Course Name: {student_course[1]}")
        print(f"Faculty: {student_course[2]}")
        print("")

def print_courses_i_can_take(id):
    db = sqlite3.connect('schedule.db')
    cursor = db.cursor()
    cursor.execute("SELECT ac.* FROM available_courses ac JOIN courses c ON ac.c_code = c.c_code JOIN program_requirements pr ON pr.c_code = c.c_code JOIN student_programs sp ON sp.p_name = pr.p_name WHERE sp.s_num = ? AND NOT EXISTS ( SELECT 1 FROM completed_courses cc WHERE cc.s_num = sp.s_num AND cc.c_code = ac.c_code ) AND NOT EXISTS ( SELECT 1 FROM prerequisites p LEFT JOIN completed_courses cc ON p.prerequisite_name = cc.c_code  WHERE p.c_code = ac.c_code  AND cc.s_num != sp.s_num );", (id,))
    student_courses = cursor.fetchall()
    db.close()
    for student_course in student_courses:
        print(f"Course Code: {student_course[1]}")
        print(f"Section: {student_course[2]}")
        print(f"Professor: {student_course[3]}")
        times = json.loads(student_course[4])
        days = ""
        for day in times['days']:
            days += day + " "
        print(f"Days: {days}")
        print(f"Start Time: {times['start_time']}")
        print(f"End Time: {times['end_time']}")
        print("")


