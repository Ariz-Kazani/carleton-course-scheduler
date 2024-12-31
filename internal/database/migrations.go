package database

import (
	"database/sql"
	"log"
	"os"
	"sort"
)

/**
 * This file is where the database migrations will be held.
 */

/**
 * This function is responsible for running all of the outstanding migrations, migrations should be sql files
 */
func Migrate(db *sql.DB) {

	var migrationFolder string = "internal/database/migrations"

	var count int8
	// TODO: UPDATE THIS TO USE THE FINAL TABLE NAME WHENEVER
	err := db.QueryRow(`SELECT COUNT(*)
			 			FROM information_schema.tables
						WHERE table_schema = 'test'
 						AND table_name = 'migrations';`).Scan(&count)

	if err != nil {
		log.Fatal("could not check database")
	}

	if count == 0 {
		_, err := db.Exec(`CREATE TABLE migrations (
						   id INT PRIMARY KEY AUTO_INCREMENT,
					       name VARCHAR(255) NOT NULL
		                   );`)

		if err != nil {
			log.Fatal("ERROR CREATING TABLE: ", err)
		}
	}

	files, err := os.ReadDir(migrationFolder)
	if err != nil {
		log.Fatal("Error reading directory: ", err)
	}

	rows, err := db.Query(`SELECT DISTINCT name FROM migrations;`)

	if err != nil {
		log.Fatal("Error querying the database: ", err)
	}

	var items []string

	for rows.Next() {
		var name string
		rows.Scan(&name)
		items = append(items, name)
	}

	if len(files) == len(items) {
		return
	}

	if len(files) < len(items) {
		log.Fatal("ERROR: MIGRATIONS MISSING")
	}

	sort.Strings(items)

	for i := len(items); i < len(files); i++ {
		fileName := migrationFolder + "/" + files[i].Name()
		file, err := os.ReadFile(fileName)

		if err != nil {
			log.Fatal("Error reading from file: ", fileName)
		}

		_, err = db.Exec(string(file))

		if err != nil {
			log.Fatal("Error EXECUTING QUERY for the file:", fileName)
		}

		db.Exec("INSERT INTO migrations (name) VALUES (?)", fileName)
	}

}