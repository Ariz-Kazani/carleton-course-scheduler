CREATE TABLE `completed_courses` (
    `s_num` INTEGER NOT NULL,
    `c_code` VARCHAR(15) NOT NULL,
    `grade` INTEGER NOT NULL,
    PRIMARY KEY (`s_num`, `c_code`)
);