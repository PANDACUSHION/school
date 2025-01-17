
user {
	id integer pk increments unique
	username character
	password character varying
	email character
	role character
}

student {
	id integer pk increments unique
	user_id integer > user.id
	first_name character
	last_name character
	date_of_birth integer
	gender character
	grade_level character
	address character
	contact_number character
	parent_name character
	parent_contact character
}

Teacher {
	id integer pk increments unique
	user_id character > user.id
	first_name character
	last_name character
	date_of_birth integer
	gender character
	subject character
	contact_number integer
	address character
}

class {
	id integer pk increments unique
	class_name character
	grade integer
	teacher_id integer > Teacher.null
	schedule character
	room_number integer
}

Subject {
	subject_id integer pk increments unique
	subject_name character
	grade_level character
}

attendance_table {
	id integer pk increments unique
	class_id integer > class.id
	student_id integer > student.id
	date integer
	status character
}

exam_table {
	id integer pk increments unique
	class_id integer > class.id
	exam_name character
	exam_date integer
	marks integer
}

result {
	id integer pk increments unique
	exam_id integer > exam_table.id
	student_id integer > student.id
	marks_obtained integer
	grade character
}

event_table {
	id integer pk increments unique
	event_name character
	event_date integer
	description character
	organizer character
}

notices_table {
	id integer pk increments unique
	title integer
	content integer
	posted_by integer > user.id
	posted_date integer
}

