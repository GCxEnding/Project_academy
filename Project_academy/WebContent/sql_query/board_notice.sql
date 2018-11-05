CREATE TABLE IF NOT EXISTS `java2d`.`board_notice` (
  `board_notice_number` INT UNSIGNED NOT NULL DEFAULT 0,
  `board_notice_id` VARCHAR(15) NOT NULL,
  `board_notice_name` VARCHAR(6) NOT NULL,
  `board_notice_subject` VARCHAR(40) NOT NULL,
  `board_notice_content` VARCHAR(2000) NOT NULL,
  `board_notice_file` VARCHAR(45) NULL COMMENT '파일이름',
  `board_notice_readcount` INT UNSIGNED NULL DEFAULT 0,
  `board_notice_date` DATETIME NOT NULL,
  PRIMARY KEY (`board_notice_number`),
  INDEX `teacher_id_idx` (`board_notice_id` ASC))
ENGINE = InnoDB