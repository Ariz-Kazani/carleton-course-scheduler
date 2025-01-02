CREATE TABLE `program_requirements` (
    `p_name` VARCHAR(180) NOT NULL,
    `c_code` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`p_name`, `c_code`)
);