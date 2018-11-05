CREATE TABLE IF NOT EXISTS `java2d`.`lecture_info` (
  `lecture_code` VARCHAR(10) NOT NULL,
  `lecture_teacher_id` VARCHAR(15) NOT NULL,
  `lecture_name` VARCHAR(50) NOT NULL,
  `lecture_teacher_name` VARCHAR(6) NOT NULL,
  `lecture_intro` VARCHAR(1000) NULL,
  `lecture_student_current` INT NOT NULL DEFAULT 0,
  `lecture_student_limit` INT NOT NULL,
  `lecture_start_period` DATE NULL,
  `lecture_end_period` DATE NULL,
  `lecture_cost` INT NULL,
  `lecture_type` VARCHAR(30) NULL,
  `lecture_start_time` TIME NULL,
  `lecture_end_time` TIME NULL,
  `lecture_rating` DOUBLE NULL COMMENT '강의 평가도\n',
  `lecture_num` INT NULL DEFAULT 0 COMMENT '강의 평가 총 인원\n',
  PRIMARY KEY (`lecture_code`))
ENGINE = InnoDB


alter table lecture_info add lecture_image varchar(30);