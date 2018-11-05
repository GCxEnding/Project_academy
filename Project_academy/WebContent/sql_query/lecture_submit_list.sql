CREATE TABLE IF NOT EXISTS `java2d`.`lecture_submit_list` (
  `submit_lecture_code` VARCHAR(10) NOT NULL,
  `submit_id` VARCHAR(15) NOT NULL,
  `submit_payment` TINYINT(1) DEFAULT 0,
  `submit_state` VARCHAR(4) DEFAULT '수강신청',
  `submit_st_memo` VARCHAR(300) NULL,
  INDEX `lecture_code_idx` (`submit_lecture_code` ASC),
  INDEX `submit_id_idx` (`submit_id` ASC),
  PRIMARY KEY (`submit_lecture_code`,`submit_id`))
ENGINE = InnoDB