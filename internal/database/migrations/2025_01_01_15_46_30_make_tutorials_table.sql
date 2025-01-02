CREATE TABLE `tutorials` (
    `crn` INT PRIMARY KEY AUTO_INCREMENT,
    `course_crn` VARCHAR(255) NOT NULL,
    `section` INT NOT NULL,
    `timings` VARCHAR(255) NOT NULL
);