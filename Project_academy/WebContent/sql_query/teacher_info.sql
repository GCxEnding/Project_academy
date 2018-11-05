CREATE TABLE IF NOT EXISTS `java2d`.`teacher_info` (
  `teacher_id` VARCHAR(15) NOT NULL,
  `teacher_password` VARCHAR(15) NOT NULL,
  `teacher_name` VARCHAR(6) NOT NULL,
  `teacher_first_address` VARCHAR(40) NOT NULL,
  `teacher_second_address` VARCHAR(40) NOT NULL,
  `teacher_postcode` VARCHAR(5) NOT NULL,
  `teacher_phone_number` VARCHAR(11) NOT NULL,
  `teacher_gender` CHAR(2) NOT NULL,
  `teacher_birthday` VARCHAR(8) NOT NULL,
  `teacher_email` VARCHAR(30) NOT NULL,
  `teacher_image` VARCHAR(20) NULL,
  `teacher_introduction` VARCHAR(1000) NULL,
  `teacher_subject` VARCHAR(30) NULL,
  `teacher_position` VARCHAR(10) NOT NULL COMMENT '직장에서의 계급',
  `teacher_salary` INT NULL COMMENT '강사연봉(월급)',
  PRIMARY KEY (`teacher_id`))
ENGINE = InnoDB