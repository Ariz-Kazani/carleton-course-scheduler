package main

import (
	"carleton-course-scheduler/internal/database"
	"fmt"
	"os"
)

func main() {
	args := os.Args[1]

	if len(args) == 0 {
		fmt.Println("No arguments provided.")
		return
	}

	if args == "make" {
		database.MakeMigration()
	} else if args == "run" {
		db := database.Connect()
		database.Migrate(db)
		database.Close(db)
	} else {
		fmt.Println("No valid arguments present")
	}
}
