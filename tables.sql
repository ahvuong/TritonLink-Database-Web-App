DROP TABLE IF EXISTS students CASCADE;

DROP TABLE IF EXISTS attendance_period  CASCADE; 

DROP TABLE IF EXISTS degree_earned CASCADE; 

DROP TABLE IF EXISTS probation_status CASCADE; 

DROP TABLE IF EXISTS undergraduate CASCADE;  

DROP TABLE IF EXISTS BS_MS CASCADE;

DROP TABLE IF EXISTS graduate CASCADE;

DROP TABLE IF EXISTS ms_student CASCADE;

DROP TABLE IF EXISTS PhD_candidates CASCADE;

DROP TABLE IF EXISTS degree CASCADE;

DROP TABLE IF EXISTS ms_degree CASCADE;

DROP TABLE IF EXISTS faculty CASCADE; 

DROP TABLE IF EXISTS classes CASCADE; 

DROP TABLE IF EXISTS meeting_sections CASCADE;  

DROP TABLE IF EXISTS weekly CASCADE;

DROP TABLE IF EXISTS review CASCADE;

DROP TABLE IF EXISTS courses CASCADE;

DROP TABLE IF EXISTS course_enrollment CASCADE;

DROP TABLE IF EXISTS past_classes CASCADE;

DROP TABLE IF EXISTS thesis_committee CASCADE;

DROP TABLE IF EXISTS teaching CASCADE;

DROP TABLE IF EXISTS advisor CASCADE;


CREATE TABLE students
(
    student_id serial PRIMARY KEY,
    ssn int,
    first_name varchar(256),
    middle_name varchar(256),
    last_name varchar(256),
    resident_status varchar(256),
    enrollment boolean
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

CREATE TABLE classes
(
    section_id serial PRIMARY KEY,
    title varchar(5),
    year int,
    quarter varchar(5),
    instructor_name varchar(5),
    enrollment_limit int,  
    FOREIGN KEY(title) references courses(new_number) ON DELETE CASCADE
);

CREATE TABLE faculty
(
    faculty_name varchar(5) PRIMARY KEY,
    member_name varchar(5),
    member_title varchar(5)
);

CREATE TABLE teaching
(
    faculty_name varchar(5),
    section_id serial,
    PRIMARY KEY(faculty_name),
    FOREIGN KEY(faculty_name) references faculty(faculty_name) ON DELETE CASCADE,
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE attendance_period
(
    student_id int PRIMARY KEY,
    begin varchar(10),
    complete varchar(20),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE degree_earned
(
    student_id int PRIMARY KEY,
    degree_id int,
    degree_type varchar(20),
    school varchar(20),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE probation_status
(
    student_id int PRIMARY KEY,
    start varchar(10),
    finish varchar(10),
    reason varchar(20),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE undergraduate
(
    student_id int PRIMARY KEY,
    major varchar(10),
    minor varchar(10),
    college varchar(10),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE BS_MS
(
    student_id int PRIMARY KEY,
    department varchar(10),
    major varchar(10),
    minor varchar(10),
    college varchar(10),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE graduate
(
    student_id int PRIMARY KEY,
    department varchar(10),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE ms_student
(
    student_id int PRIMARY KEY,
    department varchar(10),
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE PhD_candidates
(
    student_id int PRIMARY KEY,
    department varchar(10),
    PhD_candidate boolean,
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);

CREATE TABLE advisor
(
    student_id int,
    faculty_name varchar(5),
    PRIMARY KEY(student_id),
    FOREIGN KEY(faculty_name) references faculty(faculty_name) ON DELETE CASCADE,
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE
);


CREATE TABLE degree
(
    degree_id serial PRIMARY KEY,
    upper_units int,
    lower_unit int,
    total_units int,
    min_grade varchar(5)
);

CREATE TABLE ms_degree
(
    degree_id int PRIMARY KEY,
    concentration_min_grade varchar(5),
    concentration_courses varchar(5),
    concentration_total_units int,
    FOREIGN KEY(degree_id) references degree(degree_id) ON DELETE CASCADE
);

CREATE TABLE past_classes
(
    section_id serial PRIMARY KEY,
    title varchar(5),
    year int,
    quarter varchar(5),
    instructor_name varchar(5),
    grade varchar(5),
    FOREIGN KEY(title) references courses(new_number) ON DELETE CASCADE
);

CREATE TABLE meeting_sections
(
    section_id int PRIMARY KEY,
    date varchar(5),
    time timestamp,
    room varchar(5),
    building varchar(10),
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE weekly
(
    section_id int PRIMARY KEY,
    mandatory boolean,
    session_type varchar(10),
    date varchar(5),
    time timestamp,
    room varchar(5),
    building varchar(10),
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE review
(
    section_id int PRIMARY KEY,
    date varchar(5),
    time timestamp,
    room varchar(5),
    building varchar(10),
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

CREATE TABLE thesis_committee
(
    student_id int,
    instructor_name varchar(10),
    department varchar(10),
    PRIMARY KEY(department),
    FOREIGN KEY(student_id) references graduate(student_id) ON DELETE CASCADE,
    FOREIGN KEY(department) references faculty(faculty_name) ON DELETE CASCADE
);

CREATE TABLE course_enrollment
(
    student_id int,
    section_id serial PRIMARY KEY,
    class_name varchar(5),
    units int,
    grade varchar(5),
    year int,
    quarter int,
    FOREIGN KEY(student_id) references students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(section_id) references classes(section_id) ON DELETE CASCADE
);

