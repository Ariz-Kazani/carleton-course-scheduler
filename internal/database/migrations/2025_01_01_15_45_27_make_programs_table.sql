CREATE TABLE `programs` (
    `p_name` VARCHAR(180) NOT NULL UNIQUE PRIMARY KEY,
    `program_type` VARCHAR(255) NOT NULL,
    `faculty` VARCHAR(255) NOT NULL
);
