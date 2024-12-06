import db

if __name__ == '__main__':

    initializedb = input("Do you want to initialize the database? (y/n) ")
    if initializedb == 'y':
        db.initialize()

    print("Welcome to the course scheduler!")
    print("enter your id (1-3 for this demonstration)")

    id = input()


    choice = -1

    while choice != 0:
        print("\n\n\n\n")
        print("What would you like to do?")
        print("")
        print("1. List all courses")
        print("2. List all programs")
        print("3. List all pre-requisites")
        print("4. List all available courses")
        print("")
        print("5. List my program")
        print("6. List my completed courses")
        print("7. Make a schedule")
        print("")
        print("0. Exit")
        print("")
        choice = int(input("Enter your choice: "))
        print("\n\n\n\n")

        if choice == 1:
            db.print_all_courses()
        elif choice == 2:
            db.print_all_programs()
        elif choice == 3:
            db.print_all_prerequisites()
        elif choice == 4:
            db.print_all_available_courses()
        elif choice == 5:
            db.print_my_programs(id)
        elif choice == 6:
            db.print_my_completed_courses(id)
        elif choice == 7:
            db.print_courses_i_can_take(id)
        elif choice == 0:
            print("Goodbye!")

        


