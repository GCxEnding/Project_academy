CREATE TABLE current_st (
	lecture_code VARCHAR(10) NOT NULL,
	student_id VARCHAR(15) NOT NULL,
	st_counter TINYINT default 0,
	PRIMARY KEY (lecture_code)
);