
-- creating database named module4_quiz
CREATE SCHEMA IF NOT EXISTS `module4_quiz` DEFAULT CHARACTER SET utf8mb4 ;

-- using the newly created database
USE `module4_quiz`;

-- creating Table `user`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birth_date` DATETIME NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NULL DEFAULT 'UNDEFINED',
  PRIMARY KEY (`user_id`));


-- creating Table `test`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`test` (
  `test_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`test_id`));

-- creating Table `question`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`question` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `fk_test_id` INT NOT NULL,
  `question` VARCHAR(250) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `fk_test_id_idx` (`fk_test_id` ASC) VISIBLE,
  CONSTRAINT `fk_test_id`
    FOREIGN KEY (`fk_test_id`)
    REFERENCES `module4_quiz`.`test` (`test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- creating Table `answer`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`answer` (
  `answer_id` INT NOT NULL AUTO_INCREMENT,
  `answer` BOOLEAN NOT NULL,
  `fk_question_id` INT NOT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `fk_question_id_idx` (`fk_question_id` ASC) VISIBLE,
  CONSTRAINT `fk_question_id`
    FOREIGN KEY (`fk_question_id`)
    REFERENCES `module4_quiz`.`question` (`question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- creating Table `user_has_answer`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`user_has_answer` (
  `fk_user_id` INT NOT NULL,
  `fk_answer_id` INT NOT NULL,
  `has_id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_user_has_answer_user_idx` (`fk_user_id` ASC) VISIBLE,
  INDEX `fk_answer_id_idx` (`fk_answer_id` ASC) VISIBLE,
  PRIMARY KEY (`has_id`),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `module4_quiz`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_id`
    FOREIGN KEY (`fk_answer_id`)
    REFERENCES `module4_quiz`.`answer` (`answer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- creating Table `takes`, only in case it does not exist yet, with columns and specifying the data types
CREATE TABLE IF NOT EXISTS `module4_quiz`.`takes` (
  `takes_id` INT NOT NULL AUTO_INCREMENT,
  `fk_user` INT,
  `fk_test` INT,
  PRIMARY KEY (`takes_id`),
  INDEX `fk_user_idx` (`fk_user` ASC) VISIBLE,
  INDEX `fk_test_idx` (`fk_test` ASC) VISIBLE,
  CONSTRAINT `fk_user`
    FOREIGN KEY (`fk_user`)
    REFERENCES `module4_quiz`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_test`
    FOREIGN KEY (`fk_test`)
    REFERENCES `module4_quiz`.`test` (`test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


