DROP TABLE IF EXISTS evaluations;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
    student_id INT(4) UNSIGNED NOT NULL,
    student_name VARCHAR(32) NOT NULL,
    student_class INT(4) NOT NULL, -- class of 2022, etc.
    PRIMARY KEY (student_id)
);

CREATE TABLE teachers(
    teacher_id INT(4) UNSIGNED NOT NULL,
    teacher_name VARCHAR(32) NOT NULL,
    teacher_wa INT NOT NULL, -- work age
    teacher_title VARCHAR(32), -- e.g. assistant professor, etc.
    PRIMARY KEY (teacher_id)
);

CREATE TABLE courses(
    course_id INT(4) UNSIGNED NOT NULL,
    course_title VARCHAR(32) NOT NULL,
    course_subj VARCHAR(16) NOT NULL, -- e.g. CSCI-UA
    course_code INT(4) NOT NULL, -- e.g. 101
    course_term CHAR(2) NOT NULL, -- e.g. FA
    course_year INT(4) NOT NULL,  -- e.g. 2019
    course_teacher INT UNSIGNED NOT NULL,
    PRIMARY KEY (course_id),
    CONSTRAINT FOREIGN KEY (course_teacher) REFERENCES teachers (teacher_id)
);

CREATE TABLE scores(
    score_id INT UNSIGNED NOT NULL,
    score_value INT(2) NOT NULL, -- e.g. 90
    score_student INT UNSIGNED NOT NULL,
    score_course INT UNSIGNED NOT NULL,
    PRIMARY KEY (score_id),
    CONSTRAINT FOREIGN KEY (score_student) REFERENCES students (student_id),
    CONSTRAINT FOREIGN KEY (score_course) REFERENCES courses (course_id)
);

CREATE TABLE evaluations(
    eval_id INT UNSIGNED NOT NULL,
    eval_value INT UNSIGNED NOT NULL, -- e.g. 9
    eval_student INT UNSIGNED NOT NULL,
    eval_course INT UNSIGNED NOT NULL,
    PRIMARY KEY (eval_id),
    CONSTRAINT FOREIGN KEY (eval_student) REFERENCES students (student_id),
    CONSTRAINT FOREIGN KEY (eval_course) REFERENCES courses (course_id)
);

INSERT INTO students VALUES(1001,"Trump",2023);
INSERT INTO students VALUES(1002,"Obama",2022);
INSERT INTO students VALUES(1003,"Bush",2022);
INSERT INTO students VALUES(1004,"Clinton",2022);
INSERT INTO students VALUES(1005,"Reagan",2022);
INSERT INTO students VALUES(1006,"Carter",2022);
INSERT INTO students VALUES(1007,"Ford",2022);
INSERT INTO students VALUES(1008,"Nixon",2022);
INSERT INTO students VALUES(1009,"Johnson",2022);
INSERT INTO students VALUES(1010,"Kennedy",2022);
INSERT INTO students VALUES(1011,"Eisenhower",2022);
INSERT INTO students VALUES(1012,"Truman",2022);
INSERT INTO students VALUES(1013,"Roosevelt",2022);
INSERT INTO students VALUES(1014,"Hoover",2022);
INSERT INTO students VALUES(1015,"Coolidge",2022);

INSERT INTO teachers VALUES(9001,"Amy",0,"Honors Professor");
INSERT INTO teachers VALUES(9002,"Bob",6,"Associate Professor");
INSERT INTO teachers VALUES(9003,"Cindy",5,"Assistant Professor");
INSERT INTO teachers VALUES(9004,"David",2,"Lecturer");

INSERT INTO courses VALUES(6001,"Intro to Fake News Recognition","JN",331,"FA",2018,9002);
INSERT INTO courses VALUES(6002,"Hotel Investment and Management","BU",317,"FA",2018,9002);
INSERT INTO courses VALUES(6003,"Analysis","MATH",301,"SP",2019,9003);
INSERT INTO courses VALUES(6004,"Programming","CS",101,"SP",2018,9004);

INSERT INTO scores VALUES(2001,99,1002,6001);
INSERT INTO scores VALUES(2002,93,1003,6001);
INSERT INTO scores VALUES(2003,77,1004,6001);
INSERT INTO scores VALUES(2004,87,1005,6001);
INSERT INTO scores VALUES(2005,84,1006,6001);
INSERT INTO scores VALUES(2006,95,1002,6002);
INSERT INTO scores VALUES(2007,73,1007,6002);
INSERT INTO scores VALUES(2008,94,1008,6002);
INSERT INTO scores VALUES(2009,74,1009,6002);
INSERT INTO scores VALUES(2010,75,1010,6002);
INSERT INTO scores VALUES(2011,80,1011,6003);
INSERT INTO scores VALUES(2012,85,1012,6003);
INSERT INTO scores VALUES(2013,78,1013,6003);
INSERT INTO scores VALUES(2014,79,1014,6003);
INSERT INTO scores VALUES(2015,96,1002,6003);
INSERT INTO scores VALUES(2016,97,1003,6004);
INSERT INTO scores VALUES(2017,83,1004,6004);
INSERT INTO scores VALUES(2018,91,1005,6004);
INSERT INTO scores VALUES(2019,86,1006,6004);
INSERT INTO scores VALUES(2020,81,1007,6004);

INSERT INTO evaluations VALUES(4001,10,1002,6001);
INSERT INTO evaluations VALUES(4002,7,1004,6001);
INSERT INTO evaluations VALUES(4003,9,1005,6001);
INSERT INTO evaluations VALUES(4004,8,1006,6001);
INSERT INTO evaluations VALUES(4005,10,1002,6002);
INSERT INTO evaluations VALUES(4006,7,1007,6002);
INSERT INTO evaluations VALUES(4007,6,1010,6002);
INSERT INTO evaluations VALUES(4008,8,1011,6003);
INSERT INTO evaluations VALUES(4009,9,1012,6003);
INSERT INTO evaluations VALUES(4010,7,1014,6003);
INSERT INTO evaluations VALUES(4011,10,1002,6003);
INSERT INTO evaluations VALUES(4012,10,1005,6004);
INSERT INTO evaluations VALUES(4013,8,1006,6004);

