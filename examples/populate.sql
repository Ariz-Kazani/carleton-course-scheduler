DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `student_programs`;
DROP TABLE IF EXISTS `programs`;
DROP TABLE IF EXISTS `program_requirements`;
DROP TABLE IF EXISTS `courses`;
DROP TABLE IF EXISTS `prerequisites`;
DROP TABLE IF EXISTS `completed_courses`;
DROP TABLE IF EXISTS `available_courses`;
DROP TABLE IF EXISTS `tutorials`;

CREATE TABLE `student` (
    `s_num` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` TEXT NOT NULL
);

CREATE TABLE `programs` (
    `p_name` TEXT NOT NULL UNIQUE PRIMARY KEY,
    `program_type` TEXT NOT NULL,
    `faculty` TEXT NOT NULL
);

CREATE TABLE `courses` (
    `c_code` TEXT NOT NULL UNIQUE PRIMARY KEY, 
    `c_name` TEXT NOT NULL,
    `faculty` TEXT NOT NULL,
    `credits` INTEGER NOT NULL
);

CREATE TABLE `available_courses` (
    `crn` INTEGER PRIMARY KEY AUTOINCREMENT,
    `c_code` TEXT NOT NULL,
    `section` INTEGER NOT NULL,
    `prof_name` TEXT NOT NULL,
    `timings` text NOT NULL
);

CREATE TABLE `tutorials` (
    `crn` INTEGER PRIMARY KEY AUTOINCREMENT,
    `course_crn` TEXT NOT NULL,
    `timings` TEXT NOT NULL
);

CREATE TABLE `prerequisites` (
    `c_code` TEXT NOT NULL,
    `prerequisite_name` TEXT NOT NULL,
    `min_grade` INTEGER NOT NULL,
    PRIMARY KEY (`c_code`, `prerequisite_name`)
);

CREATE TABLE `student_programs` (
    `s_num` INTEGER NOT NULL,
    `p_name` TEXT NOT NULL,
    PRIMARY KEY (`s_num`, `p_name`)
);

CREATE TABLE `program_requirements` (
    `p_name` TEXT NOT NULL,
    `c_code` TEXT NOT NULL,
    PRIMARY KEY (`p_name`, `c_code`)
);

CREATE TABLE `completed_courses` (
    `s_num` INTEGER NOT NULL,
    `c_code` TEXT NOT NULL,
    `grade` INTEGER NOT NULL,
    PRIMARY KEY (`s_num`, `c_code`)
);

INSERT INTO `student` (`name`) VALUES ('Ariz');
INSERT INTO `student` (`name`) VALUES ('Allen');
INSERT INTO `student` (`name`) VALUES ('Alex');

INSERT INTO `programs` (`p_name`, `program_type`, `faculty`) VALUES ('Computer Science', 'BSc', 'Science');
INSERT INTO `programs` (`p_name`, `program_type`, `faculty`) VALUES ('Mathematics', 'BM', 'Math');
INSERT INTO `programs` (`p_name`, `program_type`, `faculty`) VALUES ('Economics', 'BE', 'Economics');
INSERT INTO `programs` (`p_name`, `program_type`, `faculty`) VALUES ('Business', 'Minor', 'Business');

-- First year cs courses for this demo, we will need 2 math and 1 physics course as well
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 100', 'Intro to Computer Science', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 101', 'Intro to Programming', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 102', 'Data Structures', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 103', 'Algorithms', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 104', 'Computer Organization', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 105', 'Operating Systems', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 106', 'Discrete Mathematics', 'Science', 1);

-- First year math courses for this demo 5 math courses 2 physics courses and 3 cs courses
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('MATH 100', 'Calculus I', 'Math', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('MATH 101', 'Calculus II', 'Math', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('MATH 102', 'Linear Algebra', 'Math', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('MATH 103', 'Differential Equations', 'Math', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('MATH 104', 'Probability', 'Math', 1);

-- First year economics courses for this demo, we will need 1 math course as well and 1 cs course
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('ECON 100', 'Intro to Economics', 'Economics', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('ECON 101', 'Microeconomics', 'Economics', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('ECON 102', 'Macroeconomics II', 'Economics', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('ECON 103', 'Econometrics', 'Economics', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('ECON 104', 'International Economics', 'Economics', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 101', 'Business Management', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 102', 'Marketing', 'Business', 1);

-- Minor in business courses
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 100', 'Business Ethics', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 104', 'Financial Accounting', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 200', 'Corporate Finance', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 201', 'Operations Management', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 300', 'Business Law', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 301', 'Human Resource Management', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 400', 'Strategic Management', 'Business', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('BUS 401', 'International Business', 'Business', 1);

-- Physics courses
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('PHYS 100', 'Physics I', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('PHYS 101', 'Physics II', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('PHYS 102', 'Modern Physics', 'Science', 1);

-- Second year cs courses
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 200', 'Software Engineering', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 201', 'Database Systems', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 202', 'Web Development', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 203', 'Computer Networks', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 204', 'Artificial Intelligence', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 205', 'Machine Learning', 'Science', 1);
INSERT INTO `courses` (`c_code`, `c_name`, `faculty`, `credits`) VALUES ('COMP 206', 'Computer Graphics', 'Science', 1);

-- Program requirements

-- Computer Science
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'MATH 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'PHYS 102');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 101');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 102');

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 103');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 104');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 105');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 106');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'MATH 101');

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 200');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 201');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 202');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 203');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 204');

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 205');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Computer Science', 'COMP 206');

-- Mathematics
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'PHYS 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'COMP 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'COMP 101');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'MATH 101');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'MATH 100');

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'MATH 102');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'COMP 102');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'MATH 103');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'MATH 104');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Mathematics', 'PHYS 101');

-- Economics
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'MATH 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'BUS 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'BUS 101');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'BUS 102');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'COMP 100');

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'ECON 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'ECON 101');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'ECON 102');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'ECON 103');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Economics', 'ECON 104');


-- Business

INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 100');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 104');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 200');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 201');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 300');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 301');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 400');
INSERT INTO `program_requirements` (`p_name`, `c_code`) VALUES ('Business', 'BUS 401');

-- Student programs
INSERT INTO `student_programs` (`s_num`, `p_name`) VALUES (1, 'Computer Science');
INSERT INTO `student_programs` (`s_num`, `p_name`) VALUES (2, 'Mathematics');
INSERT INTO `student_programs` (`s_num`, `p_name`) VALUES (3, 'Economics');
INSERT INTO `student_programs` (`s_num`, `p_name`) VALUES (2, 'Business');

-- Completed courses
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'COMP 100', 85);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'COMP 101', 90);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'COMP 102', 78);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'COMP 103', 88);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'COMP 104', 92);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'MATH 100', 89);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'MATH 101', 84);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (1, 'PHYS 102', 91);

INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'MATH 100', 85);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'MATH 101', 90);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'MATH 102', 78);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'MATH 103', 88);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'MATH 104', 92);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'COMP 100', 89);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'COMP 101', 84);
INSERT INTO `completed_courses` (`s_num`, `c_code`, `grade`) VALUES (2, 'PHYS 100', 91);

-- Prerequisites

INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 103', 'COMP 101', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 104', 'COMP 101', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 105', 'COMP 102', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 106', 'COMP 102 ', 50);

INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 200', 'COMP 103', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 201', 'COMP 103', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 202', 'COMP 101', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 203', 'COMP 104', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 204', 'COMP 105', 50);

INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 205', 'COMP 202', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('COMP 206', 'COMP 204', 50);

INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('MATH 102', 'MATH 101', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('MATH 103', 'MATH 101', 50);
INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('MATH 104', 'MATH 101', 50);

INSERT INTO 'prerequisites' ('c_code', 'prerequisite_name', 'min_grade') VALUES ('PHYS 101', 'PHYS 100', 50);


-- Available courses for this semester

INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 100', 1, 'Prof 1', '{"days": ["Thursday", "Wenesday"], "start_time": "15:30", "end_time": "17:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 100', 2, 'Prof 1', '{"days": ["Wenesday"], "start_time": "9:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 100', 3, 'Prof 1', '{"days": ["Monday"], "start_time": "16:00", "end_time": "19:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 101', 1, 'Prof 2', '{"days": ["Wenesday"], "start_time": "8:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 101', 2, 'Prof 2', '{"days": ["Friday", "Monday"], "start_time": "8:30", "end_time": "10:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 101', 3, 'Prof 2', '{"days": ["Monday", "Friday"], "start_time": "13:30", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 102', 1, 'Prof 3', '{"days": ["Thursday"], "start_time": "15:30", "end_time": "17:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 102', 2, 'Prof 3', '{"days": ["Thursday", "Wenesday"], "start_time": "12:30", "end_time": "14:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 102', 3, 'Prof 3', '{"days": ["Wenesday", "Friday"], "start_time": "11:30", "end_time": "13:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 103', 1, 'Prof 4', '{"days": ["Monday"], "start_time": "14:30", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 103', 2, 'Prof 4', '{"days": ["Friday"], "start_time": "8:00", "end_time": "12:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 103', 3, 'Prof 4', '{"days": ["Wenesday"], "start_time": "17:00", "end_time": "20:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 104', 1, 'Prof 5', '{"days": ["Wenesday", "Friday"], "start_time": "13:00", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 104', 2, 'Prof 5', '{"days": ["Tuesday"], "start_time": "8:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 104', 3, 'Prof 5', '{"days": ["Friday", "Monday"], "start_time": "12:30", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 105', 1, 'Prof 6', '{"days": ["Tuesday", "Friday"], "start_time": "11:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 105', 2, 'Prof 6', '{"days": ["Wenesday"], "start_time": "13:30", "end_time": "17:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 105', 3, 'Prof 6', '{"days": ["Thursday", "Tuesday"], "start_time": "10:00", "end_time": "11:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 106', 1, 'Prof 7', '{"days": ["Thursday", "Monday"], "start_time": "14:00", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 106', 2, 'Prof 7', '{"days": ["Monday"], "start_time": "17:30", "end_time": "20:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 106', 3, 'Prof 7', '{"days": ["Thursday", "Monday"], "start_time": "11:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 100', 1, 'Prof 8', '{"days": ["Tuesday", "Wenesday"], "start_time": "11:30", "end_time": "13:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 100', 2, 'Prof 8', '{"days": ["Thursday"], "start_time": "12:30", "end_time": "14:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 100', 3, 'Prof 8', '{"days": ["Friday"], "start_time": "13:00", "end_time": "16:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 101', 1, 'Prof 9', '{"days": ["Thursday"], "start_time": "12:00", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 101', 2, 'Prof 9', '{"days": ["Monday"], "start_time": "15:30", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 101', 3, 'Prof 9', '{"days": ["Tuesday", "Monday"], "start_time": "11:00", "end_time": "13:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 102', 1, 'Prof 10', '{"days": ["Monday", "Wenesday"], "start_time": "9:00", "end_time": "10:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 102', 2, 'Prof 10', '{"days": ["Friday"], "start_time": "17:30", "end_time": "19:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 102', 3, 'Prof 10', '{"days": ["Wenesday"], "start_time": "10:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 103', 1, 'Prof 11', '{"days": ["Tuesday"], "start_time": "11:00", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 103', 2, 'Prof 11', '{"days": ["Monday", "Thursday"], "start_time": "11:30", "end_time": "13:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 103', 3, 'Prof 11', '{"days": ["Wenesday"], "start_time": "15:30", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 104', 1, 'Prof 12', '{"days": ["Thursday"], "start_time": "13:00", "end_time": "16:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 104', 2, 'Prof 12', '{"days": ["Wenesday"], "start_time": "13:30", "end_time": "16:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('MATH 104', 3, 'Prof 12', '{"days": ["Monday"], "start_time": "9:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 100', 1, 'Prof 13', '{"days": ["Tuesday"], "start_time": "16:00", "end_time": "20:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 100', 2, 'Prof 13', '{"days": ["Monday", "Wenesday"], "start_time": "16:30", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 100', 3, 'Prof 13', '{"days": ["Thursday", "Friday"], "start_time": "13:00", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 101', 1, 'Prof 14', '{"days": ["Wenesday", "Friday"], "start_time": "8:30", "end_time": "9:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 101', 2, 'Prof 14', '{"days": ["Tuesday", "Wenesday"], "start_time": "15:30", "end_time": "17:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 101', 3, 'Prof 14', '{"days": ["Monday", "Tuesday"], "start_time": "9:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 102', 1, 'Prof 15', '{"days": ["Friday", "Monday"], "start_time": "10:00", "end_time": "12:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 102', 2, 'Prof 15', '{"days": ["Friday", "Wenesday"], "start_time": "10:00", "end_time": "11:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 102', 3, 'Prof 15', '{"days": ["Wenesday"], "start_time": "8:30", "end_time": "11:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 103', 1, 'Prof 16', '{"days": ["Thursday", "Wenesday"], "start_time": "8:30", "end_time": "10:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 103', 2, 'Prof 16', '{"days": ["Thursday", "Tuesday"], "start_time": "16:30", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 103', 3, 'Prof 16', '{"days": ["Friday", "Tuesday"], "start_time": "10:30", "end_time": "11:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 104', 1, 'Prof 17', '{"days": ["Tuesday"], "start_time": "8:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 104', 2, 'Prof 17', '{"days": ["Thursday", "Wenesday"], "start_time": "9:00", "end_time": "10:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('ECON 104', 3, 'Prof 17', '{"days": ["Friday"], "start_time": "15:00", "end_time": "19:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 100', 1, 'Prof 18', '{"days": ["Wenesday", "Friday"], "start_time": "17:30", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 100', 2, 'Prof 18', '{"days": ["Wenesday", "Thursday"], "start_time": "14:30", "end_time": "16:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 100', 3, 'Prof 18', '{"days": ["Tuesday", "Friday"], "start_time": "11:00", "end_time": "12:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 101', 1, 'Prof 19', '{"days": ["Wenesday"], "start_time": "17:30", "end_time": "20:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 101', 2, 'Prof 19', '{"days": ["Monday"], "start_time": "15:30", "end_time": "17:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 101', 3, 'Prof 19', '{"days": ["Friday", "Tuesday"], "start_time": "10:00", "end_time": "11:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 102', 1, 'Prof 20', '{"days": ["Tuesday", "Friday"], "start_time": "9:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 102', 2, 'Prof 20', '{"days": ["Wenesday", "Thursday"], "start_time": "15:00", "end_time": "17:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('BUS 102', 3, 'Prof 20', '{"days": ["Friday", "Monday"], "start_time": "17:00", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 100', 1, 'Prof 21', '{"days": ["Tuesday"], "start_time": "8:00", "end_time": "10:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 100', 2, 'Prof 21', '{"days": ["Wenesday", "Thursday"], "start_time": "11:30", "end_time": "13:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 100', 3, 'Prof 21', '{"days": ["Monday", "Tuesday"], "start_time": "16:00", "end_time": "17:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 101', 1, 'Prof 22', '{"days": ["Thursday", "Monday"], "start_time": "13:00", "end_time": "14:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 101', 2, 'Prof 22', '{"days": ["Thursday", "Tuesday"], "start_time": "10:30", "end_time": "12:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 101', 3, 'Prof 22', '{"days": ["Monday"], "start_time": "14:00", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 102', 1, 'Prof 23', '{"days": ["Friday", "Tuesday"], "start_time": "12:30", "end_time": "13:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 102', 2, 'Prof 23', '{"days": ["Wenesday"], "start_time": "14:00", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('PHYS 102', 3, 'Prof 23', '{"days": ["Friday", "Wenesday"], "start_time": "12:30", "end_time": "14:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 200', 1, 'Prof 24', '{"days": ["Tuesday", "Monday"], "start_time": "16:30", "end_time": "18:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 200', 2, 'Prof 24', '{"days": ["Friday", "Monday"], "start_time": "16:30", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 200', 3, 'Prof 24', '{"days": ["Wenesday", "Tuesday"], "start_time": "9:00", "end_time": "11:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 201', 1, 'Prof 25', '{"days": ["Tuesday"], "start_time": "12:00", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 201', 2, 'Prof 25', '{"days": ["Monday"], "start_time": "10:00", "end_time": "12:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 201', 3, 'Prof 25', '{"days": ["Monday", "Wenesday"], "start_time": "16:30", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 202', 1, 'Prof 26', '{"days": ["Wenesday"], "start_time": "16:00", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 202', 2, 'Prof 26', '{"days": ["Tuesday"], "start_time": "10:00", "end_time": "13:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 202', 3, 'Prof 26', '{"days": ["Wenesday"], "start_time": "14:00", "end_time": "17:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 203', 1, 'Prof 27', '{"days": ["Friday"], "start_time": "15:00", "end_time": "18:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 203', 2, 'Prof 27', '{"days": ["Friday", "Wenesday"], "start_time": "11:30", "end_time": "13:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 203', 3, 'Prof 27', '{"days": ["Wenesday"], "start_time": "11:00", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 204', 1, 'Prof 28', '{"days": ["Monday", "Friday"], "start_time": "15:00", "end_time": "16:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 204', 2, 'Prof 28', '{"days": ["Tuesday", "Thursday"], "start_time": "12:30", "end_time": "14:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 204', 3, 'Prof 28', '{"days": ["Monday", "Wenesday"], "start_time": "13:00", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 205', 1, 'Prof 29', '{"days": ["Monday", "Friday"], "start_time": "8:00", "end_time": "9:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 205', 2, 'Prof 29', '{"days": ["Monday", "Tuesday"], "start_time": "8:00", "end_time": "9:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 205', 3, 'Prof 29', '{"days": ["Friday", "Tuesday"], "start_time": "13:00", "end_time": "15:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 206', 1, 'Prof 30', '{"days": ["Monday"], "start_time": "15:30", "end_time": "17:30"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 206', 2, 'Prof 30', '{"days": ["Tuesday", "Wenesday"], "start_time": "15:30", "end_time": "17:00"}');
INSERT INTO `available_courses` (`c_code`, `section`, `prof_name`, `timings`) VALUES ('COMP 206', 3, 'Prof 30', '{"days": ["Monday", "Wenesday"], "start_time": "16:30", "end_time": "17:30"}');
