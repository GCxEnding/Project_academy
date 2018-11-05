CREATE TABLE IF NOT EXISTS `java2d`.`lecture_process` (
  `lec_process_name` VARCHAR(30) NOT NULL COMMENT '교육과정명',
  `lec_process_code` VARCHAR(10) NOT NULL,
  `lec_process_tea_id` VARCHAR(15) NOT NULL,
  `lec_process_start_period` DATE NOT NULL,
  `lec_process_end_period` DATE NOT NULL,
  INDEX `lec_process_tea_id_idx` (`lec_process_tea_id` ASC),
  PRIMARY KEY (`lec_process_name`, `lec_process_start_period`, `lec_process_end_period`))
ENGINE = InnoDB