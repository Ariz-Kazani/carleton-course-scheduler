CREATE TABLE `prerequisites` (
    `code` VARCHAR(15) NOT NULL,
    `prerequisite_code` VARCHAR(15) NOT NULL,
    `min_grade` INTEGER NOT NULL,
    PRIMARY KEY (`code`, `prerequisite_code`)
);
