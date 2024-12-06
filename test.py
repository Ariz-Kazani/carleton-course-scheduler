# This file is to generate the populate.sql file that is used in the db.py file.

import random
import json

def generate_random_days_and_timings(total_minutes):
    start_hour = random.randint(8, 17)
    start_minute = random.choice([0, 30])
    start_time = f"{start_hour}:{start_minute:02d}"

    days = random.choice([1, 2])
    daysOfWeek = ['Monday', 'Tuesday', 'Wenesday', 'Thursday', 'Friday']
    if days == 1:
        day = random.choice(daysOfWeek)

        # Timings

        totTime = start_hour*60 + start_minute + total_minutes

        th = totTime // 60
        tm = totTime % 60

        endTime = f"{th}:{tm:02d}"

        dict = {
            'days': [day],
            'start_time': start_time,
            'end_time': endTime,
        }

        return json.dumps(dict)
    else:
        day1, day2 = random.sample(daysOfWeek, 2)
        total_minutes = total_minutes // 2
        totTime = start_hour*60 + start_minute + total_minutes
        th = totTime // 60
        tm = totTime % 60

        endTime = f"{th}:{tm:02d}"


        dict = {
            'days': [day1, day2],
            'start_time': start_time,
            'end_time': endTime,
        }

        return json.dumps(dict)

prof_index = 0 

courses = [
    'COMP 100', 'COMP 101', 'COMP 102', 'COMP 103', 'COMP 104', 'COMP 105', 'COMP 106',
    'MATH 100', 'MATH 101', 'MATH 102', 'MATH 103', 'MATH 104',
    'ECON 100', 'ECON 101', 'ECON 102', 'ECON 103', 'ECON 104', 'BUS 100', 'BUS 101', 'BUS 102',
    'PHYS 100', 'PHYS 101', 'PHYS 102',
    'COMP 200', 'COMP 201', 'COMP 202', 'COMP 203', 'COMP 204', 'COMP 205', 'COMP 206'
]

output_file = "available_courses.sql"

with open(output_file, "w") as file:
    for course in courses:
        for section in range(1, 4):  # Each course has 3 sections
            prof_name = f"Prof {prof_index + 1}"

            total_hours = random.choice([2, 3, 4])
            timings = generate_random_days_and_timings(total_hours)
            
            file.write(
                f"INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('{course}', {section}, '{prof_name}', '{timings}');\n"
            )
        prof_index += 1
