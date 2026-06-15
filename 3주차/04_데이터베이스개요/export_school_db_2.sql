CREATE TABLE department (
    dept_id     VARCHAR(10) PRIMARY KEY,  
    dept_name   VARCHAR(50) NOT NULL,      
    location    VARCHAR(50) DEFAULT '미정'  
);

CREATE TABLE professor (
    prof_id  VARCHAR(10)  PRIMARY KEY, 
    name     VARCHAR(20)  NOT NULL, 
    email    VARCHAR(50)  NOT NULL UNIQUE, 
    dept_id  VARCHAR(10), 
    hire_year INT CHECK (hire_year >= 1980), 
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE student (
    student_id   VARCHAR(10) PRIMARY KEY, 
    name         VARCHAR(20) NOT NULL, 
    email        VARCHAR(50) UNIQUE,
    birth_year   INT CHECK (birth_year >= 1990 AND birth_year <= 2007), 
    dept_id      VARCHAR(10), 
    grade        INT CHECK (grade >= 1 AND grade <= 4),
    tuition_paid VARCHAR(1) DEFAULT 'N', 
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
)
;


CREATE TABLE course (
    course_id    VARCHAR(10) PRIMARY KEY, 
    title        VARCHAR(100) NOT NULL, 
    credit       INT NOT NULL CHECK(credit >= 1 AND credit <= 3), 
    prof_id      VARCHAR(10), 
    max_students INT DEFAULT 30, 
    FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
)
;

CREATE TABLE enrollment (
    student_id  VARCHAR(10),
    course_id   VARCHAR(10),
    enroll_date DATE NOT NULL,
    score       INT  CHECK (score >= 0 AND score <= 100),
    CONSTRAINT enrollment_pk PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id)  REFERENCES course(course_id)
);
