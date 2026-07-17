SET autocommit = 0;

START TRANSACTION;

-- Create Database
CREATE DATABASE employee; 
USE employee;

-- Create Tables
CREATE TABLE employeedetails(
    id VARCHAR(5) NOT NULL PRIMARY KEY,
    fname VARCHAR(10) NOT NULL,
    mname VARCHAR(10) NOT NULL,
    lname VARCHAR(10) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL,
    address VARCHAR(30) NOT NULL,
    postid INT NOT NULL
); 

CREATE TABLE postdetails(
    id INT NOT NULL PRIMARY KEY,
    postname VARCHAR(30),
    postingaddress VARCHAR(30)
); 

ALTER TABLE
    employeedetails ADD FOREIGN KEY(postid) REFERENCES postdetails(id);

-- Create Function  
delimiter $$
CREATE FUNCTION emid() RETURNS VARCHAR(30) DETERMINISTIC BEGIN
    DECLARE
        totalrows VARCHAR(5);
    SELECT
        IF(
            MAX(id) IS NULL,
            "EM100",
            MAX(id)
        )
    INTO totalrows
FROM
    employeedetails;
SET
    totalrows = CONCAT(
        SUBSTR(totalrows, 1, 2),
        SUBSTR(totalrows, 3, 5) +1
    ); 
RETURN totalrows;
END $$
delimiter ;

-- Insert Data
INSERT INTO postdetails
VALUES
(202, "Software Developer", "Delhi"),
(203, "Analyst", "Mumbai"),
(204, "Devops Engineer", "Ahemdabad"),
(205, "Computer Mechanics", "Howrah"),
(206, "web Developer", "Surat");

SELECT "Created Database and Tables Successfully" AS Message;

COMMIT;