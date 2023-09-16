set serveroutput on;

--Création des tables
CREATE TABLE subject (
  id INTEGER PRIMARY KEY,
  name VARCHAR2(30) NOT NULL
);

CREATE TABLE teacher (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) NOT NULL
);
CREATE TABLE field (
  id INTEGER PRIMARY KEY,
  name VARCHAR2(30) NOT NULL
);
CREATE TABLE student (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) NOT NULL,
  date_of_birth DATE NOT NULL,
  field_id INTEGER NOT NULL,
  FOREIGN KEY (field_id) REFERENCES field(id)
);
CREATE TABLE enrollment (
  student_id INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  grade FLOAT NOT NULL,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE teaching (
  subject_id INTEGER NOT NULL,
  teacher_id INTEGER NOT NULL,
  PRIMARY KEY (subject_id, teacher_id),
  FOREIGN KEY (subject_id) REFERENCES subject(id),
  FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE subject_field (
  subject_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  PRIMARY KEY (subject_id, field_id),
  FOREIGN KEY (subject_id) REFERENCES subject(id),
  FOREIGN KEY (field_id) REFERENCES field(id)
);
CREATE SEQUENCE seq_student
INCREMENT BY 1;
CREATE SEQUENCE seq_teacher
START WITH 100
INCREMENT BY 1;
CREATE SEQUENCE seq_field
START WITH 200
INCREMENT BY 1;
CREATE SEQUENCE seq_subject
START WITH 300
INCREMENT BY 1;

-- Insertion enseignant
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Fahd', 'Jbeli');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Sara', 'louati');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Mohamed', 'Karoui');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Yasmin', 'Azizi');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Imen', 'Ben mahmoud');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Aisha', 'Ben sliman');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Soumaya', 'Trabelsi');

INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Hichem', 'Mrabet');
INSERT INTO teacher (id, first_name, last_name)
VALUES (seq_teacher.nextval, 'Samia', 'Zidi');
--insertion matière

INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Business Law');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Operations Management');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Human Resource Management');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Organizational Behavior');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'International Business');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Data Mining');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Data Visualization');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Predictive Analytics');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Business Statistics');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Strategic Management');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Marketing Research');
---------
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Web Development');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Project Management');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Mobile Development');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'System Architecture');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Taxation');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Financial Management');
INSERT INTO subject (id, name)
VALUES (seq_subject.nextval, 'Financial Markets');
-- insertion spécialité

INSERT INTO field (id, name)
VALUES (seq_field.nextval, 'Marketing');
INSERT INTO field (id, name)
VALUES (seq_field.nextval, 'Management');
INSERT INTO field (id, name)
VALUES (seq_field.nextval, 'Business Intelligence');
INSERT INTO field (id, name)
VALUES (seq_field.nextval, 'Finance');
INSERT INTO field (id, name)
VALUES (seq_field.nextval, 'Business Computing');
update field set id=id-20;
--insertion étudiant
INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Hana', 'Ben Salem', '2000-01-01', 200);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Mohammed', 'Khemiri', '1999-02-15', 201);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Fatma', 'Zouaoui', '1998-03-31', 202);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Ali', 'Toumi', '2001-04-30', 203);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Leila', 'Karoui', '1998-05-15', 201);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Ahmed', 'Slim', '2002-06-30', 202);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Marwa', 'Ben Said', '2001-11-01', 200);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Mohammed', 'Melliti', '1998-03-15', 204);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Faycel', 'Sehli', '2000-03-01', 202);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Ali', 'Trabelsi', '2000-05-30', 203);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Leila', 'Neffati', '1999-06-25', 201);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Ahmed', 'Sliti', '2000-06-23', 202);
--------------------
INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Hazem', 'Akrimi', '1999-08-15', 204);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Seif', 'Jabri', '2001-03-21', 200);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Mohamed', 'Hachicha', '2002-05-20', 203);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Marwa', 'Abed', '1999-09-15', 201);

INSERT INTO student (id, first_name, last_name, date_of_birth, field_id)
VALUES (seq_student.nextval, 'Ahmed', 'Ben Amor', '2000-07-13', 202);

--insertion subject field
insert into subject_field (subject_id ,field_id)
values (300,200); 
insert into subject_field (subject_id ,field_id)
values (302,200); 
insert into subject_field (subject_id ,field_id)
values (304,200);
insert into subject_field (subject_id ,field_id)
values (308,200);
insert into subject_field (subject_id ,field_id)
values (310,200);
insert into subject_field (subject_id ,field_id)
values (312,200); 
insert into subject_field (subject_id ,field_id)
values (300,201); 
insert into subject_field (subject_id ,field_id)
values (301,201);
insert into subject_field (subject_id ,field_id)
values (302,201); 
insert into subject_field (subject_id ,field_id)
values (303,201); 
insert into subject_field (subject_id ,field_id)
values (304,201); 
insert into subject_field (subject_id ,field_id)
values (308,201);
insert into subject_field (subject_id ,field_id)
values (309,201); 
insert into subject_field (subject_id ,field_id)
values (312,201);
insert into subject_field (subject_id ,field_id)
values (305,202); 
insert into subject_field (subject_id ,field_id)
values (306,202); 
insert into subject_field (subject_id ,field_id)
values (307,202); 
insert into subject_field (subject_id ,field_id)
values (308,202);
insert into subject_field (subject_id ,field_id)
values (311,202); 
insert into subject_field (subject_id ,field_id)
values (312,202); 
insert into subject_field (subject_id ,field_id)
values (313,202); 
insert into subject_field (subject_id ,field_id)
values (300,203);
insert into subject_field (subject_id ,field_id)
values (303,203);
insert into subject_field (subject_id ,field_id)
values (304,203);
insert into subject_field (subject_id ,field_id)
values (308,203);
insert into subject_field (subject_id ,field_id)
values (315,203); 
insert into subject_field (subject_id ,field_id)
values (316,203); 
insert into subject_field (subject_id ,field_id)
values (317,203);
insert into subject_field (subject_id ,field_id)
values (304,204);
insert into subject_field (subject_id ,field_id)
values (308,204); 
insert into subject_field (subject_id ,field_id)
values (311,204); 
insert into subject_field (subject_id ,field_id)
values (312,204);
insert into subject_field (subject_id ,field_id)
values (313,204); 
insert into subject_field (subject_id ,field_id)
values (314,204); 
select s.name, f.name from subject s, field f, subject_field sf where sf.subject_id=s.id and sf.field_id=f.id order by f.name;
--insertion teaching
insert into teaching (subject_id ,teacher_id)
values (300,100);
insert into teaching (subject_id ,teacher_id)
values (315,100);
----
insert into teaching (subject_id ,teacher_id)
values (301,101);
insert into teaching (subject_id ,teacher_id)
values (302,101);
insert into teaching (subject_id ,teacher_id)
values (303,101);
insert into teaching (subject_id ,teacher_id)
values (304,101);
insert into teaching (subject_id ,teacher_id)
values (309,101);
insert into teaching (subject_id ,teacher_id)
values (312,101);
insert into teaching (subject_id ,teacher_id)
values (301,102);
insert into teaching (subject_id ,teacher_id)
values (302,102);
insert into teaching (subject_id ,teacher_id)
values (303,102);
insert into teaching (subject_id ,teacher_id)
values (304,102);
insert into teaching (subject_id ,teacher_id)
values (309,102);
insert into teaching (subject_id ,teacher_id)
values (312,102);
---------------------------
insert into teaching (subject_id ,teacher_id)
values (305,103);
insert into teaching (subject_id ,teacher_id)
values (306,103);
insert into teaching (subject_id ,teacher_id)
values (307,103);
insert into teaching (subject_id ,teacher_id)
values (308,103);
insert into teaching (subject_id ,teacher_id)
values (305,104);
insert into teaching (subject_id ,teacher_id)
values (306,104);
insert into teaching (subject_id ,teacher_id)
values (307,104);
insert into teaching (subject_id ,teacher_id)
values (308,104);
-----------------
insert into teaching (subject_id ,teacher_id)
values (314,105);
insert into teaching (subject_id ,teacher_id)
values (313,105);
insert into teaching (subject_id ,teacher_id)
values (311,105);
insert into teaching (subject_id ,teacher_id)
values (314,106);
insert into teaching (subject_id ,teacher_id)
values (313,106);
insert into teaching (subject_id ,teacher_id)
values (311,106);
---------------------
insert into teaching (subject_id ,teacher_id)
values (310,107);
-------------------
insert into teaching (subject_id ,teacher_id)
values (316,108);
insert into teaching (subject_id ,teacher_id)
values (317,108);

select s.name, t.first_name, t.last_name from subject s, teacher t, teaching tf where tf.subject_id=s.id and tf.teacher_id=t.id order by t.first_name, t.last_name;
select s.id, f.id as field, f.name from student s, field f where f.id=s.field_id order by field_id;
select s.name, sf.subject_id as sub, sf.field_id as field from subject_field sf, subject s where sf.subject_id=s.id order by field;

update student set field_id = 204 where id =12;
insert into enrollment(subject_id, student_id, grade) values (300,1,15);
insert into enrollment(subject_id, student_id, grade) values (304,1,10);
insert into enrollment(subject_id, student_id, grade) values (308,1,5);
insert into enrollment(subject_id, student_id, grade) values (310,1,16);
insert into enrollment(subject_id, student_id, grade) values (302,1,12);
insert into enrollment(subject_id, student_id, grade) values (312,1,6);
-------------
insert into enrollment(subject_id, student_id, grade) values (300,7,6);
insert into enrollment(subject_id, student_id, grade) values (304,7,20);
insert into enrollment(subject_id, student_id, grade) values (308,7,15);
insert into enrollment(subject_id, student_id, grade) values (310,7,10);
insert into enrollment(subject_id, student_id, grade) values (302,7,8.5);
insert into enrollment(subject_id, student_id, grade) values (312,7,16);
------------------------------
insert into enrollment(subject_id, student_id, grade) values (300,14,7.5);
insert into enrollment(subject_id, student_id, grade) values (304,14,17);
insert into enrollment(subject_id, student_id, grade) values (308,14,5.75);
insert into enrollment(subject_id, student_id, grade) values (310,14,11);
insert into enrollment(subject_id, student_id, grade) values (302,14,2);
insert into enrollment(subject_id, student_id, grade) values (312,14,14);
--------------------------------------
insert into enrollment(subject_id, student_id, grade) values (304,2,6);
insert into enrollment(subject_id, student_id, grade) values (303,2,20);
insert into enrollment(subject_id, student_id, grade) values (302,2,15);
insert into enrollment(subject_id, student_id, grade) values (301,2,10);
insert into enrollment(subject_id, student_id, grade) values (300,2,8.5);
insert into enrollment(subject_id, student_id, grade) values (312,2,16);
insert into enrollment(subject_id, student_id, grade) values (308,2,10);
insert into enrollment(subject_id, student_id, grade) values (309,2,8.5);
----------------------
insert into enrollment(subject_id, student_id, grade) values (304,5,6.75);
insert into enrollment(subject_id, student_id, grade) values (303,5,2.5);
insert into enrollment(subject_id, student_id, grade) values (302,5,11);
insert into enrollment(subject_id, student_id, grade) values (301,5,15);
insert into enrollment(subject_id, student_id, grade) values (300,5,12.5);
insert into enrollment(subject_id, student_id, grade) values (312,5,8);
insert into enrollment(subject_id, student_id, grade) values (308,5,20);
insert into enrollment(subject_id, student_id, grade) values (309,5,18.5);
-------------------------------------
insert into enrollment(subject_id, student_id, grade) values (304,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (303,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (302,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (301,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (300,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (312,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (309,11,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
---------------------------
insert into enrollment(subject_id, student_id, grade) values (304,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (303,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (302,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (301,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (300,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (312,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (309,16,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
-------------------------
insert into enrollment(subject_id, student_id, grade) values (312,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (305,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (313,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (306,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (307,3,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
-------------------------------------------------

insert into enrollment(subject_id, student_id, grade) values (312,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (305,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (313,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (306,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (307,6,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
-------------------------------------------

insert into enrollment(subject_id, student_id, grade) values (312,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (305,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (313,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (306,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (307,9,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
-------------------------------------------

insert into enrollment(subject_id, student_id, grade) values (312,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (305,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (313,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (306,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (307,17,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
---------------------------------------------------------------------

insert into enrollment(subject_id, student_id, grade) values (316,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (317,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (300,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (303,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (315,4,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
--------------------------------------------------------

insert into enrollment(subject_id, student_id, grade) values (316,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (317,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (300,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (303,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (315,10,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
--------------------------------------
insert into enrollment(subject_id, student_id, grade) values (316,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (317,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (300,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (303,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (315,15,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
---------------------------
insert into enrollment(subject_id, student_id, grade) values (313,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (312,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (314,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,8,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
-----------------------------------------
insert into enrollment(subject_id, student_id, grade) values (313,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (312,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (314,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,12,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
----------------------------------------------
insert into enrollment(subject_id, student_id, grade) values (313,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (312,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (308,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (314,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (311,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
insert into enrollment(subject_id, student_id, grade) values (304,13,TRUNC(DBMS_RANDOM.VALUE(0, 2000)) / 100);
------------------------------
select s.id,s.first_name, s.last_name,sub.id, sub.name ,e.grade from student s, subject sub , enrollment e where s.id=e.student_id and sub.id=e.subject_id ;


select * from student;
select * from teacher;
select * from subject_field;
select * from field;
create user imen identified by 0000;
grant all privileges to imen;