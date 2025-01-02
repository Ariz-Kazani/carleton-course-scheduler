CREATE TABLE `available_courses` (
    `crn` INT PRIMARY KEY AUTO_INCREMENT,
    `c_code` VARCHAR(255) NOT NULL,
    `section` INT NOT NULL,
    `prof_name` VARCHAR(255) NOT NULL,
    `timings` VARCHAR(255) NOT NULL
);