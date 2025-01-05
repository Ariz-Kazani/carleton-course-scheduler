package database

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

// TODO: will eventually  have to add password and other settings here
type Student struct {
	name   string
	number uint32
}

type Programs struct {
	name    string
	pType   string
	faculty string
}

type Course struct {
	code    string
	name    string
	faculty string
	credits int
}

type AvailableCourses struct {
	crn       uint16
	code      string
	section   uint8
	professor string
	timings   string
}

type Tutorials struct {
	crn       uint8
	courseCrn uint8
	timings   string
}

type Prerequisites struct {
	code     string
	pCode    string
	minGrade uint8
}

type StudentPrograms struct {
	studentNum uint32
	pCode      string
}

/**
 * This file is responsible for all of the database operations that are required for the program.
 */

func Connect() *sql.DB {
	fmt.Println("Connecting to the database...")

	// TODO: add the database password and name with env?
	var source string = "root:@tcp(127.0.0.1:3306)/test"
	db, err := sql.Open("mysql", source)

	if err != nil {
		log.Fatal("Error opening the database: ", err)
	}

	err = db.Ping()

	if err != nil {
		log.Fatal("Error connecting to the database: ", err)
	}

	return db
}

/*
the next 5 things could be abstracted into one function... time to make my own orm?
*/
func GetAllCourses(db *sql.DB) string {
	rows, err := db.Query("SELECT * FROM courses")
	if err != nil {
		return "ERROR QUERYING"
	}

	for rows.Next() {
		var course Course
		err := rows.Scan(&course.code, &course.faculty, &course.name, &course.credits)
		if err == nil {
			fmt.Println("Code:    ", course.code)
			fmt.Println("Faculty: ", course.faculty)
			fmt.Println("Name:    ", course.name)
			fmt.Println("Credits: ", course.credits)
			fmt.Println("")
		}
	}

	return "DONE!"
}

func GetAllPrograms(db *sql.DB) string {
	rows, err := db.Query("SELECT * FROM programs")
	if err != nil {
		return "ERROR QUERYING"
	}

	for rows.Next() {
		var program Programs
		err := rows.Scan(&program.name, &program.pType, &program.faculty)
		if err == nil {
			fmt.Println("Faculty: ", program.faculty)
			fmt.Println("Name:    ", program.name)
			fmt.Println("Faculty: ", program.pType)
			fmt.Println("")
		}
	}

	return "DONE!"
}

func GetAllAvailableCourses(db *sql.DB) string {
	rows, err := db.Query("SELECT * FROM available_courses")
	if err != nil {
		return "ERROR GETTING AVAILABLE COURSES"
	}

	for rows.Next() {
		var cc AvailableCourses
		err := rows.Scan(&cc.crn, &cc.code, &cc.section, &cc.professor, &cc.timings)

		if err == nil {
			fmt.Println("CRN:     ", cc.crn)
			fmt.Println("Code:    ", cc.code)
			fmt.Println("Section: ", cc.section)
			fmt.Println("Prof:    ", cc.professor)
			fmt.Println("Timings: ", cc.timings)
			fmt.Println("")
		}

	}
	return "Done"
}

func GetAllPrerequisites(db *sql.DB) string {
	rows, err := db.Query("SELECT * FROM prerequisites")
	if err != nil {
		return "ERROR GETTING AVAILABLE COURSES"
	}

	for rows.Next() {
		var p Prerequisites
		err := rows.Scan(&p.code, &p.pCode, &p.minGrade)

		if err == nil {
			fmt.Println("code:         ", p.code)
			fmt.Println("pre-req code: ", p.pCode)
			fmt.Println("Min Grade:    ", p.minGrade)
			fmt.Println("")
		}

	}
	return "Done"
}

func GetUserPrograms(db *sql.DB) string {
	rows, err := db.Query("SELECT * FROM student_programs")
	if err != nil {
		return "ERROR GETTING AVAILABLE COURSES"
	}

	for rows.Next() {
		var sp StudentPrograms
		err := rows.Scan(&sp.studentNum, &sp.pCode)

		if err == nil {
			fmt.Println("Student Num: ", sp.studentNum)
			fmt.Println("Course Name: ", sp.pCode)
			fmt.Println("")
		}

	}
	return "Done"
}

func GetCoursesAvailableToUser(db *sql.DB) string {
	return "These are the courses the user can take this semester"
}

func GetUserCompletedCourses(db *sql.DB) string {
	return "These are all of the courses the user has completed"
}

func GetUserInProgressCourses(db *sql.DB) string {
	return "These are all of the courses the user is takeing before"
}

func Close(db *sql.DB) {
	fmt.Println("Closing connection to the database")
	db.Close()
}
