CREATE TABLE IF NOT EXISTS courses (
    code VARCHAR(15) NOT NULL UNIQUE PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    faculty VARCHAR(255) NOT NULL,
    credits INT NOT NULL
);