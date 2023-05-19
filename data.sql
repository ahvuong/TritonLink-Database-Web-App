-- NOTE: --faculty-- : faculty_name should be duplicated but member_name should NOT
-----------------Undergraduate students Info-----------------
INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('1', '1', 'Benjamin', 'Ben', 'B', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, major, minor, college) 
VALUES ('1', 'DSC', 'Math', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('2', '2', 'Alex', 'Al', 'T', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, major, minor, college) 
VALUES ('2', 'DSC', 'Math', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('3', '3', 'Daniel', 'Dan', 'F', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('3', 'CSE', 'Math', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('4', '4', 'Helen', 'He', 'V', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, major, minor, college) 
VALUES ('4', 'DSC', 'Math', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('5', '5', 'Julie', '', 'C', 'Non-California Resident', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('5', 'CSE', '', 'Revell');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('6', '6', 'Kevin', '', 'L', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('6', 'MAE', '', 'Revell');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('7', '7', 'Michael', '', 'B', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('7', 'SE', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('8', '8', 'Joseph', 'Jo', 'J', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('8', 'MAE', 'COGS', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment)
VALUES ('9', '9', 'Devin', 'De', 'P', 'International Student', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('9', 'MAE', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('10', '10', 'Logan', '', 'F', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('10', 'DSC', '', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('11', '11', 'Vikram', 'Vi', 'N', 'California Resident', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('11', 'ECE', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('12', '12', 'Rachel', 'Ra', 'Z', 'International Student', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('12', 'ECE', 'Math', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('13', '13', 'Zach', 'Za', 'M', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('13', 'ECE', 'COGS', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('14', '14', 'Justin', 'Ju', 'H', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('14', 'COGS', 'Math', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment)
VALUES ('15', '15', 'Rahul', '', 'R', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('15', 'COGS', 'Math', 'Warren');

-----------------MS students Info-----------------
INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('16', '16', 'Dave', 'Da', 'C', 'Non-California Resident', 'No');
INSERT INTO graduate(student_id, department) 
VALUES ('16', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('16', 'CE');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('17', '17', 'Nelson', 'Ne', 'H', 'California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('17', 'MAE');
INSERT INTO ms_student(student_id, department) VALUES ('17', 'CSE');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('18', '18', 'Andrew', 'An', 'P', 'Non-California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('18', 'ECE');
INSERT INTO ms_student(student_id, department) VALUES ('18', 'ME');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('19', '19', 'Nathan', '', 'S', 'California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('19', 'SE');
INSERT INTO ms_student(student_id, department) VALUES ('19', 'CE');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('20', '20', 'John', 'Jo', 'H', 'International Student', 'No');
INSERT INTO graduate(student_id, department) 
VALUES ('20', 'SE');
INSERT INTO ms_student(student_id, department) VALUES ('20', 'DS');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('21', '21', 'Anwell', '', 'W', 'California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('21', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('21', 'DS');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('22', '22', 'Tim', 'Ti', 'K', 'International Student', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('22', 'ECE');
INSERT INTO ms_student(student_id, department) VALUES ('22', 'COGS');


-----------------Faculty Info-----------------
INSERT INTO faculty(faculty_name, member_name, member_title) 
VALUES ('COGS', 'Justin_Smith', 'Associate Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('CSE', 'Flo_Rence', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('MAE', 'Ada_Riz', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('ECE', 'Taylor_Swan', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('DSC', 'Robert_Clarkson', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('NANO', 'Adam_Cao', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('SE', 'Tim_Asreal', 'Professor');

-----------------Course Info-----------------
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade) 
VALUES('CSE132A', 'CSE132', 4, 'CSE', 'BOTH', 'Not_Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade) 
VALUES('CSE132B', 'CSE132', 4, 'CSE', 'BOTH', 'Not_Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('CSE142', 'CSE143', 4, 'CSE', 'BOTH', 'Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('DSC120', 'DS120A', 4, 'DSC', 'BOTH', 'Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('ECE108', 'ECE108A', 4, 'ECE', 'BOTH', 'Not_Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('COGS101A', 'COGS101', 2, 'COGS', 'BOTH', 'Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('DSC104', 'DS105', 4, 'DSC', 'BOTH', 'Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('MAE180A', 'MAE180', 4, 'MAE', 'BOTH', 'Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('SE110B', 'SE110', 4, 'SE', 'BOTH', 'Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('NANO119', 'NANO119A', 1, 'NANO', 'BOTH', 'Not_Required', 'LETTER');

-----------------Class Info-----------------
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('1', 'CSE132B', 'Database', '2022', 'SP', 'Flo_Rence', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('2', 'CSE132A', 'Database', '2020', 'WI', 'Flo_Rence', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('3', 'CSE142', 'CompArch', '2021', 'FA', 'Flo_Rence', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('4', 'CSE142', 'CompArch', '2022', 'FA', 'Flo_Rence', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('5', 'DSC120', 'Data_Analysis', '2022', 'SP', 'Robert_Clarkson', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('6', 'DSC120', 'Data_Analysis', '2021', 'SP', 'Robert_Clarkson', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('7', 'ECE108', 'DigCir', '2021', 'WI', 'Taylor_Swan', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('8', 'ECE108', 'DigCir', '2022', 'WI', 'Taylor_Swan', '100');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('8', 'MAE180A', 'Spacecraft', '2022', 'SP', 'Ada_Riz', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('9', 'MAE180A', 'Spacecraft', '2021', 'FA', 'Ada_Riz', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('10', 'MAE180A', 'Spacecraft', '2020', 'SP', 'Ada_Riz', '100');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('11', 'SE110B', 'SolidMech', '2022', 'SP', 'Tim_Asreal', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('12', 'SE110B', 'SolidMech', '2021', 'WI', 'Tim_Asreal', '100');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('13', 'COGS101A', 'SenNPer', '2022', 'SP', 'Justin_Smith', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('14', 'COGS101A', 'SenNPer', '2020', 'FA', 'Justin_Smith', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('15', 'DSC104', 'Data_Management', '2021', 'FA', 'Robert_Clarkson', '100');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('16', 'NANO119', 'SysDesign', '2022', 'SP', 'Adam_Cao', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('17', 'NANO119', 'SysDesign', '2022', 'SP', 'Adam_Cao', '100');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('18', 'DSC104', 'Data_Management', '2022', 'SP', 'Robert_Clarkson', '100');

-----------------Course Enrollment Info-----------------
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('1', '1', 'CSE132B', '2022', 'SP', '4', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('2', '5', 'DSC120', '2022', 'SP', '4', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('3', '8', 'DSC120', '2022', 'SP', '4', 'S/U');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('4', '11', 'SE110B', '2022', 'SP', '4', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('5', '13', 'COGS101A', '2022', 'SP', '4', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('6', '16', 'NANO119', '2022', 'SP', '1', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('7', '17', 'NANO119', '2022', 'SP', '1', 'LETTER');
INSERT INTO course_enrollment(student_id, section_id, class_name, year, quarter, units, grade) 
VALUES('8', '18', 'DSC104', '2022', 'SP', '4', 'LETTER');

-----------------Classes Taken In The Past Info-----------------
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('1', '2', 'CSE132A', '2020', 'WI', 'Flo_Rence', 'A', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('2', '3', 'CSE142', '2021', 'FA', 'Flo_Rence', 'A-', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('3', '4', 'CSE142', '2022', 'FA', 'Flo_Rence', 'B+', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('4', '6', 'DSC120', '2021', 'SP', 'Robert_Clarkson', 'B', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('5', '7', 'ECE108', '2021', 'WI', 'Taylor_Swan', 'S', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('6', '9', 'MAE180A', '2021', 'FA', 'Ada_Riz', 'U', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('7', '10', 'MAE180A', '2020', 'SP', 'Ada_Riz', 'S', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('8', '12', 'SE110B', '2021', 'WI', 'Tim_Asreal', 'A+', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('9', '14', 'COGS101A', '2020', 'FA', 'Justin_Smith', 'C', '4');
INSERT INTO past_classes(student_id, section_id, title, year, quarter, instructor_name, grade, units) 
VALUES('10', '15', 'DSC104', '2022', 'FA', 'Robert_Clarkson', 'B-', '4');

-----------------Weekly Meeting Info-----------------
DO
$$
BEGIN
    FOR i IN 0..9 LOOP
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(1, 'LECTURE', '2016-01-04 10:00:00'::timestamp + (i * INTERVAL '7 DAYS') , '2016-01-04 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(1, 'LECTURE', '2016-01-06 10:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(1, 'LECTURE', '2016-01-08 10:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(2, 'LECTURE', '2016-01-04 10:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-04 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(2, 'LECTURE', '2016-01-06 10:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(2, 'LECTURE', '2016-01-08 10:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 11:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(3, 'LECTURE', '2016-01-04 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-04 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(3, 'LECTURE', '2016-01-06 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(3, 'LECTURE', '2016-01-08 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(4, 'LECTURE', '2016-01-04 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-04 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(4, 'LECTURE', '2016-01-06 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(4, 'LECTURE', '2016-01-08 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(5, 'LECTURE', '2016-01-04 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-04 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(5, 'LECTURE', '2016-01-06 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(5, 'LECTURE', '2016-01-08 12:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 13:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(6, 'LECTURE', '2016-01-05 14:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-05 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(6, 'LECTURE', '2016-01-07 14:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-07 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(6, 'DISCUSSION', '2016-01-08 18:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-08 19:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(7, 'LECTURE', '2016-01-05 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-05 16:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(7, 'LECTURE', '2016-01-07 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-07 16:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(8, 'LECTURE', '2016-01-05 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-05 16:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(8, 'LECTURE', '2016-01-07 15:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-07 16:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(9, 'LECTURE', '2016-01-05 17:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-05 18:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(9, 'LECTURE', '2016-01-07 17:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-07 18:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);

        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(10, 'LECTURE', '2016-01-05 17:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-05 18:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(10, 'LECTURE', '2016-01-07 17:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-07 18:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
        INSERT INTO WeeklyMeeting(section_id, meeting_type, start_datetime, end_datetime, location, required)
                VALUES(10, 'DISCUSSION', '2016-01-06 19:00:00'::timestamp + (i * INTERVAL '7 DAYS'), '2016-01-06 20:00:00'::timestamp + (i * INTERVAL '7 DAYS'), 'LOCATION', FALSE);
    END LOOP;
END
$$