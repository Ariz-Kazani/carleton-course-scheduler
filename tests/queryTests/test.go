package main

import (
	"carleton-course-scheduler/internal/database"
	"fmt"
)

/**
This function just validates that everything in the python version is working when ported over to go
*/

func main() {

	db := database.Connect()
	var id int
	var choice int = -1
	var testOutput string

	database.Migrate(db)

	fmt.Println("Enter your ID")
	fmt.Scanln(&id)

	for choice != 0 {
		fmt.Println("")
		fmt.Println("Choose a number for the following: ")
		fmt.Println("")
		fmt.Println("Choose General Tests")
		fmt.Println("1: List all courses")
		fmt.Println("2: List all programs")
		fmt.Println("3: List all available courses")
		fmt.Println("4: List all courses that are pre-requisites to other courses")
		fmt.Println("")
		fmt.Println("Choose ID specific Tests")
		fmt.Println("5: List my program")
		fmt.Println("6: List my completed courses")
		fmt.Println("7: Get all courses I can take")
		fmt.Println("")
		fmt.Println("0: Exit")
		fmt.Println("")

		fmt.Scan(&choice)

		switch choice {
		case 0:
		case 1:
			testOutput = database.GetAllCourses(db)
		case 2:
			testOutput = database.GetAllPrograms(db)
		case 3:
			testOutput = database.GetAllAvailableCourses(db)
		case 4:
			testOutput = database.GetAllPrerequisites(db)
		case 5:
			testOutput = database.GetUserPrograms(db)
		case 6:
			testOutput = database.GetUserCompletedCourses(db)
		case 7:
			testOutput = database.GetCoursesAvailableToUser(db)
		default:
			choice = -1
		}

		if choice > 0 {
			fmt.Println(testOutput)
		}
	}

	database.Close(db)
}
