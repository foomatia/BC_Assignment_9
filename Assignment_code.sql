-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GE2LX2
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Department (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_Employee (
    emp_no integer   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

--DROP TABLE Dept_Employee CASCADE;

CREATE TABLE Dept_Manager (
    dept_no VARCHAR   NOT NULL, 
	FOREIGN KEY(dept_no) REFERENCES Department (dept_no),
    emp_no integer   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE Employees (
    emp_no integer   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id),
    birth_date varchar   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date varchar   NOT NULL
);

CREATE TABLE Salaries (
    emp_no integer   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
    salary integer   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    PRIMARY KEY (title_id),
	title VARCHAR   NOT NULL
);

--SELECT * FROM Dept_Employee;
