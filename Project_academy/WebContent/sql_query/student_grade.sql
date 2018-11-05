CREATE TABLE IF NOT EXISTS `java2d`.`student_grade` (
  `st_grade_st_id` VARCHAR(15) NOT NULL,
  `st_grade_lec_code` VARCHAR(10) NOT NULL,
  `st_grade_date` DATE NOT NULL,
  `st_grade_student_rank` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`st_grade_st_id`, `st_grade_lec_code`, `st_grade_date`),
  INDEX `lecture_code_idx` (`st_grade_lec_code` ASC))
ENGINE = InnoDB