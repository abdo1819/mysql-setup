
-- DROP SCHEMA univ;
CREATE SCHEMA univ;
USE univ;
	

-- schema
-- Student(id,name)
-- Room(id,name,capacity)
-- Course(name,start_time,end_time,room_id)
-- Department(name,office)
-- Enrolled(student_id,course_name,credit_status)
-- MajorsIn(student_id,department_name)

-- create the tables
CREATE TABLE Student(
    id INT NOT NULL,
    r_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Room(
    id INT NOT NULL,
    r_name VARCHAR(50) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Course(
    c_name VARCHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (c_name),
    FOREIGN KEY (room_id) REFERENCES Room(id)
);

CREATE TABLE Department(
    d_name VARCHAR(50) NOT NULL,
    office VARCHAR(50) NOT NULL,
    PRIMARY KEY (d_name)
);

CREATE TABLE Enrolled(
    student_id INT NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    credit_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (student_id, course_name),
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (course_name) REFERENCES Course(c_name)
);

CREATE TABLE MajorsIn(
    student_id INT NOT NULL,
    department_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (student_id, department_name),
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (department_name) REFERENCES Department(d_name)
);




-- -----------------------------------------------------------
-- ----------------insert the data----------------------------
-- -----------------------------------------------------------

-- schema
-- Student(id,name)
-- Room(id,name,capacity)
-- Course(name,start_time,end_time,room_id)
-- Department(name,office)
-- Enrolled(student_id,course_name,credit_status)
-- MajorsIn(student_id,department_name)

-- constraints
-- Student.id is a primary key
-- Room.id is a primary key
-- Course.room_id is a foreign key referencing Room.id
-- Department.name is a primary key
-- Enrolled.student_id is a foreign key referencing Student.id
-- Enrolled.course_name is a foreign key referencing Course.name
-- MajorsIn.student_id is a foreign key referencing Student.id
-- MajorsIn.department_name is a foreign key referencing Department.name

-- insert data
-- studnet table
-- id       | name
-- 12345678 | Jill Jones
-- 25252525 | Alan Turing
-- 33566891 | Audrey Chu
-- 45678900 | Jose Delgado
-- 66666666 | Count Dracula

INSERT INTO Student VALUES (12345678, 'Jill Jones');
INSERT INTO Student VALUES (25252525, 'Alan Turing');
INSERT INTO Student VALUES (33566891, 'Audrey Chu');
INSERT INTO Student VALUES (45678900, 'Jose Delgado');
INSERT INTO Student VALUES (66666666, 'Count Dracula');

-- room table
-- id   | name           | capacity
-- 1000 |Sanders Theatre |1000
-- 2000 |Sever 111       |50
-- 3000 |Sever 213       |100
-- 4000 |Sci Ctr A       |300
-- 5000 |Sci Ctr B       |500
-- 6000 |Emerson 105     |500
-- 7000 |Sci Ctr 110     |30

INSERT INTO Room VALUES (1000, 'Sanders Theatre', 1000);
INSERT INTO Room VALUES (2000, 'Sever 111', 50);
INSERT INTO Room VALUES (3000, 'Sever 213', 100);
INSERT INTO Room VALUES (4000, 'Sci Ctr A', 300);
INSERT INTO Room VALUES (5000, 'Sci Ctr B', 500);
INSERT INTO Room VALUES (6000, 'Emerson 105', 500);
INSERT INTO Room VALUES (7000, 'Sci Ctr 110', 30);

-- course table
-- name       | start_time | end_time | room_id
-- cscie119   |19:35:00    |21:35:00  |4000
-- cscie268   |19:35:00    |21:35:00  |2000
-- cs165      |16:00:00    |17:30:00  |7000
-- cscie275   |17:30:00    |19:30:00  |7000

INSERT INTO Course VALUES ('cscie119', '19:35:00', '21:35:00', 4000);
INSERT INTO Course VALUES ('cscie268', '19:35:00', '21:35:00', 2000);
INSERT INTO Course VALUES ('cs165', '16:00:00', '17:30:00', 7000);
INSERT INTO Course VALUES ('cscie275', '17:30:00', '19:30:00', 7000);

-- department table
-- name       | office
-- comp sci   |MD 235
-- mathematics| Sci Ctr 520
-- the occult |The Dungeon
-- english    |Sever 125

INSERT INTO Department VALUES ('comp sci', 'MD 235');
INSERT INTO Department VALUES ('mathematics', 'Sci Ctr 520');
INSERT INTO Department VALUES ('the occult' ,'The Dungeon');
INSERT INTO Department VALUES ('english'    ,'Sever 125');

-- enrolled table
-- student_id course_name credit_status
-- 12345678 cscie268 ugrad
-- 25252525 cs165 ugrad
-- 45678900 cscie119 grad
-- 33566891 cscie268 non-credit
-- 45678900 cscie275 grad

INSERT INTO Enrolled VALUES (12345678, 'cscie268', 'ugrad');
INSERT INTO Enrolled VALUES (25252525, 'cs165', 'ugrad');
INSERT INTO Enrolled VALUES (45678900, 'cscie119', 'grad');
INSERT INTO Enrolled VALUES (33566891, 'cscie268', 'non-credit');
INSERT INTO Enrolled VALUES (45678900, 'cscie275', 'grad');

-- majorsin table
-- student_id department_name
-- 12345678 comp sci
-- 45678900 mathematics
-- 25252525 comp sci
-- 45678900 english
-- 66666666 the occult

INSERT INTO MajorsIn VALUES (12345678, 'comp sci');
INSERT INTO MajorsIn VALUES (45678900, 'mathematics');
INSERT INTO MajorsIn VALUES (25252525, 'comp sci');
INSERT INTO MajorsIn VALUES (45678900, 'english');
INSERT INTO MajorsIn VALUES (66666666, 'the occult');