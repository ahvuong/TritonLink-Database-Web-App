-- NOTE: --faculty-- : faculty_name should be duplicated but member_name should NOT
-----------------Undergraduate students Info-----------------
INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('1', '1', 'Benjamin', 'Ben', 'B', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, major, minor, college) 
VALUES ('1', 'DS', '', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('2', '2', 'Kristen', 'Ris', 'W', 'Non-California Resident', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('2', 'DS', 'Math', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('3', '3', 'Daniel', 'Dan', 'F', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('3', 'CS', 'Math', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('4', '4', 'Claire', 'Cla', 'J', 'International Student', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('4', 'CS', 'Math', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('5', '5', 'Julie', '', 'C', 'Non-California Resident', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('5', 'CS', '', 'Revell');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('6', '6', 'Kevin', '', 'L', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('6', 'ME', '', 'Revell');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('7', '7', 'Michael', '', 'B', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('7', 'ME', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('8', '8', 'Joseph', 'Jo', 'J', 'California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('8', 'ME', 'COGS', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment)
VALUES ('9', '9', 'Devin', 'De', 'P', 'International Student', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('9', 'ME', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('10', '10', 'Logan', '', 'F', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('10', 'ME', '', 'Muir');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('11', '11', 'Vikram', 'Vi', 'N', 'California Resident', 'No');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('11', 'CE', '', 'Warren');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('12', '12', 'Rachel', 'Ra', 'Z', 'International Student', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('12', 'CE', 'Math', 'Marshall');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('13', '13', 'Zach', 'Za', 'M', 'Non-California Resident', 'Yes');
INSERT INTO undergraduate(student_id, college, major, minor) 
VALUES ('13', 'CE', 'COGS', 'Warren');

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
VALUES ('17', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('17', 'CSE');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('18', '18', 'Andrew', 'An', 'P', 'Non-California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('18', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('18', 'ME');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('19', '19', 'Nathan', '', 'S', 'California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('19', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('19', 'CE');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('20', '20', 'John', 'Jo', 'H', 'International Student', 'No');
INSERT INTO graduate(student_id, department) 
VALUES ('20', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('20', 'DS');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('21', '21', 'Anwell', '', 'W', 'California Resident', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('21', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('21', 'DS');

INSERT INTO students(student_id, ssn, first_name, middle_name, last_name, resident_status, enrollment) 
VALUES ('22', '22', 'Tim', 'Ti', 'K', 'International Student', 'Yes');
INSERT INTO graduate(student_id, department) 
VALUES ('22', 'CSE');
INSERT INTO ms_student(student_id, department) VALUES ('22', 'COGS');


-----------------Faculty Info-----------------
INSERT INTO faculty(faculty_name, member_name, member_title) 
VALUES ('COGS', 'Justin_Smith', 'Associate Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('CS', 'Flo_Rence', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('ME', 'Ada_Riz', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('CE', 'Taylor_Swan', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('DS', 'Robert_Clarkson', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('EE', 'Adam_Cao', 'Professor');
INSERT INTO faculty(faculty_name, member_name, member_title)
VALUES ('CEE', 'Tim_Asreal', 'Professor');

-----------------Course Info-----------------
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade) 
VALUES('CSE132A', 'CSE132', 4, 'CSE', 'BOTH', 'Not_Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('CSE142', 'CSE143', 4, 'CSE', 'BOTH', 'Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('CE132A', 'CE132', 4, 'CE', 'BOTH', 'Not_Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('DS130', 'DS130A', 4, 'DS', 'BOTH', 'Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('CE108A', 'CE108', 4, 'CE', 'BOTH', 'Not_Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('COGS101', 'COGS103', 2, 'COGS', 'BOTH', 'Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('DS120', 'DS125', 4, 'DS', 'BOTH', 'Not_Required', 'LETTER');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('MAE180A', 'MAE180', 4, 'ME', 'BOTH', 'Required', 'S/U');
INSERT INTO courses(new_number, old_number, units, department, prerequisites, lab_requirements, grade)  
VALUES('MAE190', 'MAE189', 4, 'ME', 'BOTH', 'Not_Required', 'LETTER');

-----------------Class Info-----------------
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('1', 'CSE132A', 'Database', '2022', 'FA', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('2', 'CSE132A', 'Database', '2022', 'WI', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('3', 'CSE142', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('4', 'CSE142', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('5', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('6', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('7', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('8', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('8', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('9', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('10', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('11', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('12', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('13', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('14', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('15', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('16', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');
INSERT INTO classes(section_id, new_number, title, year, quarter, instructor_name, enrollment_limit) 
VALUES('17', 'CSE132A', 'Database', '2014', 'SP', 'Robert_Clarkson', '1');

-----------------Current Quarter Section Info-----------------
INSERT INTO Section(section_num, class_id, section_limit) VALUES('1', 26, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('2', 20, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('3', 15, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('4', 30, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('5', 20, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('6', 7, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('7', 34, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('8', 26, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('9', 20, 100);
INSERT INTO Section(section_num, class_id, section_limit) VALUES('10', 4, 100);

-----------------Current Quarter Enrollment Info-----------------
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('16', 2, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('17', 9, 4, 'S/U');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('18', 5, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('19', 2, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('20', 9, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('21', 5, 4, 'S/U');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('22', 3, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('16', 3, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('17', 3, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('1', 10, 4, 'S/U');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('5', 10, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('3', 10, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('7', 1, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('8', 1, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('9', 8, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('4', 6, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('12', 4, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('13', 7, 4, 'S/U');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('14', 4, 4, 'LETTER');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES('15', 7, 4, 'LETTER');

-----------------Past Classes Info-----------------
INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE8A_FA14_SECTION_1', 1, 100); -- section.id = 11
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('1', 11, 4, 'LETTER');  -- sectionenrollment.id = 21
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('1', 21, 'A-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('3', 11, 4, 'LETTER');  -- sectionenrollment.id = 22
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('3', 22, 'B+');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE8A_SP15_SECTION_1', 2, 100); -- section.id = 12
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('2', 12, 4, 'LETTER');  -- sectionenrollment.id = 23
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('2', 23, 'C-');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE8A_FA15_SECTION_1', 3, 100); -- section.id = 13
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('4', 13, 4, 'LETTER');  -- sectionenrollment.id = 24
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('4', 24, 'A-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('5', 13, 4, 'LETTER');  -- sectionenrollment.id = 25
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('5', 25, 'B');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE105_WI15_SECTION_1', 6, 100); -- section.id = 14
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('1', 14, 4, 'LETTER');  -- sectionenrollment.id = 26
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('1', 26, 'A-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('5', 14, 4, 'LETTER');  -- sectionenrollment.id = 27
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('5', 27, 'B+');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('4', 14, 4, 'LETTER');  -- sectionenrollment.id = 28
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('4', 28, 'C');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE250A_FA14_SECTION_1', 9, 100); -- section.id = 15
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('16', 15, 4, 'LETTER');  -- sectionenrollment.id = 29
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('16', 29, 'C');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE250A_FA15_SECTION_1', 10, 100); -- section.id = 16
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('22', 16, 4, 'LETTER');  -- sectionenrollment.id = 30
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('2', 30, 'B+');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('18', 16, 4, 'LETTER');  -- sectionenrollment.id = 31
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('18', 31, 'D');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('19', 16, 4, 'LETTER');  -- sectionenrollment.id = 32
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('19', 32, 'F');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE250B_WI15_SECTION_1', 12, 100); -- section.id = 17
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('17', 17, 4, 'LETTER');  -- sectionenrollment.id = 33
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('17', 33, 'A');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('19', 17, 4, 'LETTER');  -- sectionenrollment.id = 34
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('19', 34, 'A');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE255_FA15_SECTION_1', 14, 100); -- section.id = 18
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('20', 18, 4, 'LETTER');  -- sectionenrollment.id = 35
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('20', 35, 'B-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('18', 18, 4, 'LETTER');  -- sectionenrollment.id = 36
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('18', 36, 'B');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('21', 18, 4, 'LETTER');  -- sectionenrollment.id = 37
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('21', 37, 'F');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE232A_FA15_SECTION_1', 17, 100); -- section.id = 19
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('17', 19, 4, 'LETTER');  -- sectionenrollment.id = 38
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('17', 38, 'A-');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('CSE221_SP15_SECTION_1', 19, 100); -- section.id = 20
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('22', 20, 4, 'LETTER');  -- sectionenrollment.id = 39
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('22', 39, 'A');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('20', 20, 4, 'LETTER');  -- sectionenrollment.id = 40
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('20', 40, 'A');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('MAE107_SP15_SECTION_1', 22, 100); -- section.id = 21
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('10', 21, 4, 'LETTER');  -- sectionenrollment.id = 41
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('10', 41, 'B+');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('MAE108_FA14_SECTION_1', 24, 100); -- section.id = 22
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('8', 22, 2, 'LETTER');  -- sectionenrollment.id = 42
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('8', 42, 'B-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('7', 22, 2, 'LETTER');  -- sectionenrollment.id = 43
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('7', 43, 'A-');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('MAE108_WI15_SECTION_1', 25, 100); -- section.id = 23
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('6', 23, 2, 'LETTER');  -- sectionenrollment.id = 44
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('6', 44, 'B');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('10', 23, 2, 'LETTER');  -- sectionenrollment.id = 45
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('10', 45, 'B+');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('PHIL10_FA15_SECTION_1', 28, 100); -- section.id = 24
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('11', 24, 4, 'LETTER');  -- sectionenrollment.id = 46
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('11', 46, 'A');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('12', 24, 4, 'LETTER');  -- sectionenrollment.id = 47
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('12', 47, 'A');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('13', 24, 4, 'LETTER');  -- sectionenrollment.id = 48
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('13', 48, 'C-');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('14', 24, 4, 'LETTER');  -- sectionenrollment.id = 49
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('14', 49, 'C+');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('PHIL165_SP15_SECTION_1', 32, 100); -- section.id = 25
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('15', 25, 2, 'LETTER');  -- sectionenrollment.id = 50
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('15', 50, 'F');
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('12', 25, 2, 'LETTER');  -- sectionenrollment.id = 51
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('12', 51, 'D');

INSERT INTO Section(section_num, class_id, section_limit) VALUES('PHIL165_FA15_SECTION_1', 33, 100); -- section.id = 26
INSERT INTO SectionEnrollment(student_id, section_id, units_taking, grade_option) VALUES ('11', 26, 2, 'LETTER');  -- sectionenrollment.id = 52
INSERT INTO ClassesTaken(student_id, sectionenrollment_id, grade_received) VALUES ('11', 52, 'A-');

-----------------Teaching Info-----------------
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Justin Bieber', 1);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Flo Rida', 32);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Selena Gomez', 3);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Adele', 24);
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(6, 'Taylor Swift');
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Kelly Clarkson', 2);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Bjork', 9);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Bjork', 28);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Justin Bieber', 12);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Flo Rida', 14);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Selena Gomez', 25);
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(10, 'Adele');
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Taylor Swift', 6);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Kelly Clarkson', 17);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Adam Levine', 33);
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Bjork', 22);
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(3, 'Justin Bieber');
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(1, 'Selena Gomez');
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(8, 'Selena Gomez');
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(4, 'Adam Levine');
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Bjork', 10);
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(7, 'Taylor Swift');
INSERT INTO TeachingHistory(faculty_name, class_id) VALUES('Kelly Clarkson', 19);
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(2, 'Kelly Clarkson');
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(5, 'Kelly Clarkson');
INSERT INTO CurrentlyTeaching(section_id, faculty_name) VALUES(9, 'Kelly Clarkson');

-----------------Degree Info-----------------
INSERT INTO Degree(degree_name, degree_type, required_units) VALUES('Computer Science', 'BS', 40);
INSERT INTO Degree(degree_name, degree_type, required_units) VALUES('Philosophy', 'BA', 35);
INSERT INTO Degree(degree_name, degree_type, required_units) VALUES('Mechanical Engineering', 'BS', 50);
INSERT INTO Degree(degree_name, degree_type, required_units) VALUES('Computer Science', 'MS', 45);

INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(1, 1, 'Lower Division', 10, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(2, 1, 'Upper Division', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(3, 1, 'Upper Division', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(2, 1, 'Technical Elective', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(4, 1, 'Technical Elective', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(8, 1, 'Technical Elective', 15, 0.0);

INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(4, 4, 'Graduate Division', 45, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(5, 4, 'Graduate Division', 45, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(6, 4, 'Graduate Division', 45, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(7, 4, 'Graduate Division', 45, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(8, 4, 'Graduate Division', 45, 0.0);


INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(9, 3, 'Lower Division', 20, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(10, 3, 'Upper Division', 20, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(11, 3, 'Upper Division', 20, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(9, 3, 'Technical Elective', 10, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(10, 3, 'Technical Elective', 10, 0.0);

INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(12, 2, 'Lower Division', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(13, 2, 'Lower Division', 15, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(14, 2, 'Upper Division', 20, 0.0);
INSERT INTO CourseCategory(course_id, degree_id, category_name, required_units, min_gpa) VALUES(15, 2, 'Upper Division', 20, 0.0);

INSERT INTO CourseConcentration(course_id, degree_id, concentration_name, required_units, min_gpa) VALUES(7, 4,'Databases', 4, 3.0);
INSERT INTO CourseConcentration(course_id, degree_id, concentration_name, required_units, min_gpa) VALUES(6, 4,'AI', 8, 3.1);
INSERT INTO CourseConcentration(course_id, degree_id, concentration_name, required_units, min_gpa) VALUES(4, 4,'AI', 8, 3.1);
INSERT INTO CourseConcentration(course_id, degree_id, concentration_name, required_units, min_gpa) VALUES(8, 4,'Systems', 4, 3.3);

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