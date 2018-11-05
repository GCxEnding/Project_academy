CREATE TABLE IF NOT EXISTS `java2d`.`lecture_rating` (
  `lecture_rating_lec_code` VARCHAR(10) NOT NULL,
  `lecture_rating_st_id` VARCHAR(15) NOT NULL,
  `lecture_rating_teacher_id` VARCHAR(15) NOT NULL,
  `lecture_rating_score` TINYINT NULL,
  `teacher_rating_require` VARCHAR(300) NULL COMMENT '요구사항',
  PRIMARY KEY (`lecture_rating_st_id`, `lecture_rating_lec_code`, `lecture_rating_teacher_id`),
  INDEX `rating_st_id_idx` (`lecture_rating_st_id` ASC),
  INDEX `rating_teacher_id_idx` (`lecture_rating_teacher_id` ASC))
ENGINE = InnoDB