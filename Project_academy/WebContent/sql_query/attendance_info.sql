CREATE TABLE IF NOT EXISTS `java2d`.`attendance_info` (
  `attendance_date` DATE NOT NULL,
  `attendance_student_id` VARCHAR(15) NOT NULL COMMENT '학생의 아이디',
  `attendance_lec_code` VARCHAR(10) NOT NULL,
  `attendance_state` VARCHAR(2) NOT NULL,
  `attendance_entrance` TIME NULL,
  `attendance_exit` TIME NULL,
  `attendance_reason` VARCHAR(50) NULL,
  PRIMARY KEY (`attendance_date`, `attendance_student_id`, `attendance_lec_code`,`attendance_state`),
  INDEX `attendance_id_idx` (`attendance_student_id` ASC))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `java2d`.`attendance_info` (
  `attendance_date` DATE NOT NULL,
  `attendance_student_id` VARCHAR(15) NOT NULL COMMENT '학생의 아이디',
  `attendance_lec_code` VARCHAR(10) NOT NULL,
  `attendance_state` VARCHAR(2) NOT NULL,
  `attendance_entrance` VARCHAR(9) NULL,
  `attendance_exit` VARCHAR(9) NULL,
  `attendance_reason` VARCHAR(50) NULL,
  PRIMARY KEY (`attendance_date`, `attendance_student_id`, `attendance_lec_code`),
  INDEX `attendance_id_idx` (`attendance_student_id` ASC))
ENGINE = InnoDB