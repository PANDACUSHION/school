-- Create 'user' table
CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Create 'student' table
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    grade_level VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    parent_name VARCHAR(100) NOT NULL,
    parent_contact VARCHAR(15) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Create 'teacher' table
CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Create 'class' table
CREATE TABLE class (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    grade INTEGER NOT NULL,
    teacher_id INTEGER,
    schedule TEXT NOT NULL,
    room_number INTEGER NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher (id)
);

-- Create 'subject' table
CREATE TABLE subject (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    grade_level VARCHAR(50) NOT NULL
);

-- Create 'attendance_table'
CREATE TABLE attendance_table (
    id SERIAL PRIMARY KEY,
    class_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(10) NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (id),
    FOREIGN KEY (student_id) REFERENCES student (id)
);

-- Create 'exam_table'
CREATE TABLE exam_table (
    id SERIAL PRIMARY KEY,
    class_id INTEGER NOT NULL,
    exam_name VARCHAR(100) NOT NULL,
    exam_date DATE NOT NULL,
    marks INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (id)
);

-- Create 'result' table
CREATE TABLE result (
    id SERIAL PRIMARY KEY,
    exam_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    marks_obtained INTEGER NOT NULL,
    grade VARCHAR(10) NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES exam_table (id),
    FOREIGN KEY (student_id) REFERENCES student (id)
);

-- Create 'event_table'
CREATE TABLE event_table (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    description TEXT NOT NULL,
    organizer VARCHAR(255) NOT NULL
);

-- Create 'notices_table'
CREATE TABLE notices_table (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    posted_by INTEGER NOT NULL,
    posted_date DATE NOT NULL,
    FOREIGN KEY (posted_by) REFERENCES user (id)
);
