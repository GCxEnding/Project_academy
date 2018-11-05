CREATE TABLE IF NOT EXISTS `java2d`.`reply_notice` (
  `reply_index` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reply_id` VARCHAR(15) NOT NULL,
  `reply_board_number` INT UNSIGNED NOT NULL,
  `reply_name` VARCHAR(6) NOT NULL,
  `reply_content` VARCHAR(200) NULL,
  `reply_date` DATETIME NOT NULL,
  INDEX `id_idx` (`reply_id` ASC),
  PRIMARY KEY (`reply_index`))
ENGINE = InnoDB