CREATE TABLE IF NOT EXISTS `java2d`.`examInfo` (
  `examInfo_lec_code` VARCHAR(10) NOT NULL,
  `examInfo_teacher_id` VARCHAR(15) NOT NULL,
  `examInfo_student_id` VARCHAR(15) NOT NULL,
  `examInfo_exam_type` VARCHAR(20) NOT NULL,
  `examInfo_date` DATE NOT NULL,
  `examInfo_score` INT DEFAULT 0,
  PRIMARY KEY (`examInfo_lec_code`,`examInfo_teacher_id`,`examInfo_student_id`,`examInfo_exam_type`,`examInfo_date`)
)
ENGINE = InnoDB