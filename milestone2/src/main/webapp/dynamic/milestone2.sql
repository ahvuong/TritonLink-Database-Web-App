DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS period CASCADE; 
DROP TABLE IF EXISTS degree_earned CASCADE; 
DROP TABLE IF EXISTS probation_status CASCADE; 
DROP TABLE IF EXISTS undergraduate CASCADE;  
DROP TABLE IF EXISTS BS_MS CASCADE;
DROP TABLE IF EXISTS graduate CASCADE;  
DROP TABLE IF EXISTS MS CASCADE;
DROP TABLE IF EXISTS PhD_candidates CASCADE;
DROP TABLE IF EXISTS Pre_candidacy CASCADE;
DROP TABLE IF EXISTS degree CASCADE;
DROP TABLE IF EXISTS MS_degree CASCADE;
DROP TABLE IF EXISTS other_degrees CASCADE;
DROP TABLE IF EXISTS faculty CASCADE; 
DROP TABLE IF EXISTS classes CASCADE;  
DROP TABLE IF EXISTS meeting_sections CASCADE;  
DROP TABLE IF EXISTS weekly CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS courses CASCADE;


CREATE TABLE student
(
    student_id serial PRIMARY KEY,
    ssn int,
    first_name varchar(256),
    middle_name varchar(256),
    last_name varchar(256),
    residency varchar(256)
);

CREATE TABLE period
(
    student_id int,
    begin varchar(10),
    end varchar(20),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE degree_earned
(
    student_id int,
    degree_id int,
    degree_type varchar(20),
    school varchar(20),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE probation_status
(
    student_id int,
    start varchar(10),
    finish varchar(10),
    reason varchar(20),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE undergraduate
(
    student_id int,
    major varchar(10),
    minor varchar(10),
    college varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE BS_MS
(
    student_id int,
    department varchar(10),
    major varchar(10),
    minor varchar(10),
    college varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE graduate
(
    student_id int,
    department varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE MS
(
    student_id int,
    department varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE PhD_candidates
(
    student_id int,
    department varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE Pre_candidacy
(
    student_id int,
    department varchar(10),
    FOREIGN KEY(student_id) references student(student_id) ON DELETE CASCADE
);

CREATE TABLE degree
(
    degree_id serial PRIMARY KEY,
    upper_units int,
    lower_unit int,
    min_grade varchar(5)
);

CREATE TABLE MS_degree
(
    degree_id int,
    concentration_min_grade varchar(5),
    concentration_courses varchar(5),
    concentration_total_units int,
    FOREIGN KEY(degree_id) references degree(degree_id) ON DELETE CASCADE
);

CREATE TABLE other_degrees
(
    degree_id int,
    FOREIGN KEY(degree_id) references degree(degree_id) ON DELETE CASCADE
);

CREATE TABLE faculty
(
    faculty_name varchar(5) PRIMARY KEY,
    member_names varchar(5),
    member_titles varchar(5)
);

CREATE TABLE classes
(
    section_id serial PRIMARY KEY,
    title varchar(5),
    year int,
    quarter varchar(5),
    enrollment_limit int
);

CREATE TABLE meeting_sections
(
    section_id int,
    date varchar(5),
    time timestamp,
    room varchar(5),
    building varchar(10),
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE weekly
(
    section_id int,
    mandatory boolean,
    discussion varchar(5),
    lecture varchar(5),
    lab varchar(10),
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE review
(
    section_id int,
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);


CREATE TABLE courses
(
    new_number varchar(5) PRIMARY KEY,
    old_number varchar(5),
    grade varchar(5),
    units int,
    department varchar(5), 
    prerequisites varchar(5), 
    lab_requirements varchar(5)
);