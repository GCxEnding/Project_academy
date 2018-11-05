CREATE TABLE IF NOT EXISTS `java2d`.`student_info` (
  `student_id` VARCHAR(15) NOT NULL,
  `student_password` VARCHAR(15) NOT NULL,
  `student_name` VARCHAR(6) NOT NULL,
  `student_first_address` VARCHAR(40) NOT NULL,
  `student_second_address` VARCHAR(40) NOT NULL,
  `student_postcode` VARCHAR(5)	NOT NULL,
  `student_phone_number` VARCHAR(11) NOT NULL,
  `student_gender` CHAR(2) NOT NULL,
  `student_birthday` VARCHAR(8) NOT NULL,
  `student_email` VARCHAR(30) NOT NULL,
  `student_image` VARCHAR(20) NULL,
  `student_introduction` VARCHAR(1000) NULL,
  `student_grade_point` SMALLINT NULL,
  `student_payment` TINYINT(1) NULL,
  `student_consult` VARCHAR(2000) NULL,
  `student_teacher_memo` VARCHAR(2000) NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB