import db

if __name__ == '__main__':

    db.initialize()


    print("Welcome to the course scheduler!")
    print("enter your id")

    id = input()


    choice = -1

    while choice != 0:
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

        break
        


