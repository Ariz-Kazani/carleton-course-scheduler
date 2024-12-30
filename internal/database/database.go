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
	code        string
	pCode       string
	minGrade    uint8
	programName string
}

type StudentPrograms struct {
	studentNum uint32
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
		}
	}

	return "DONE!"
}

func GetAllPrograms() string {
	return "All Programs"
}

func GetAllAvailableCourses() string {
	return "All available Courses"
}

func GetAllPrerequisites() string {
	return "All pre reqs"
}

func GetUserPrograms() string {
	return "Current User Programs"
}

func GetCoursesAvailableToUser() string {
	return "These are the courses the user can take this semester"
}

func GetUserCompletedCourses() string {
	return "These are all of the courses the user has completed"
}

func GetUserInProgressCourses() string {
	return "These are all of the courses the user is takeing before"
}

func Close(db *sql.DB) {
	fmt.Println("Closing connection to the database")
	db.Close()
}
