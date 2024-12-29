package database

import "fmt"

/**
 * This file is responsible for all of the database operations that are required for the program.
 */

func Connect() {
	fmt.Println("Connecting to the database...")
}

func GetAllCourses() string {
	return "All courses"
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

func Close() {
	fmt.Println("Closing connection to the database")
}
