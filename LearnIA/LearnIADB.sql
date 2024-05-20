-- MySQL Script generated by MySQL Workbench
-- Mon May 20 13:09:58 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LearnIA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LearnIA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LearnIA` DEFAULT CHARACTER SET utf8 ;
USE `LearnIA` ;

-- -----------------------------------------------------
-- Table `LearnIA`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `escuela` VARCHAR(45) NULL,
  `materias` VARCHAR(45) NULL,
  PRIMARY KEY (`idCarrera`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `escuela_UNIQUE` (`escuela` ASC) VISIBLE,
  UNIQUE INDEX `materias_UNIQUE` (`materias` ASC) VISIBLE,
  UNIQUE INDEX `idCarrera_UNIQUE` (`idCarrera` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LearnIA`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idCarrera` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `cursosCompletados` VARCHAR(45) NULL,
  `cursosInscritos` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstudiante`),
  UNIQUE INDEX `idEstudiante_UNIQUE` (`idEstudiante` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE,
  INDEX `idCarrera_idx` (`idCarrera` ASC) VISIBLE,
  CONSTRAINT `idCarrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `LearnIA`.`Carrera` (`nombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LearnIA`.`Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Quiz` (
  `idQuiz` INT NOT NULL,
  `feedback` VARCHAR(45) NOT NULL,
  `preguntas` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`idQuiz`),
  UNIQUE INDEX `idQuiz_UNIQUE` (`idQuiz` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LearnIA`.`Evaluaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Evaluaciones` (
  `idEvaluaciones` INT NOT NULL,
  `quizInicial` INT NOT NULL,
  `quiz1` INT NULL,
  `quiz2` INT NULL,
  `final` INT NULL,
  PRIMARY KEY (`idEvaluaciones`),
  UNIQUE INDEX `idEvaluaciones_UNIQUE` (`idEvaluaciones` ASC) VISIBLE,
  INDEX `quiz1_idx` (`quiz1` ASC) VISIBLE,
  INDEX `quizInicial_idx` (`quizInicial` ASC) VISIBLE,
  INDEX `quiz2_idx` (`quiz2` ASC) VISIBLE,
  INDEX `final_idx` (`final` ASC) VISIBLE,
  CONSTRAINT `quizInicial`
    FOREIGN KEY (`quizInicial`)
    REFERENCES `LearnIA`.`Quiz` (`idQuiz`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `quiz1`
    FOREIGN KEY (`quiz1`)
    REFERENCES `LearnIA`.`Quiz` (`idQuiz`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `quiz2`
    FOREIGN KEY (`quiz2`)
    REFERENCES `LearnIA`.`Quiz` (`idQuiz`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `final`
    FOREIGN KEY (`final`)
    REFERENCES `LearnIA`.`Quiz` (`idQuiz`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LearnIA`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Materia` (
  `idMateria` INT NOT NULL,
  `idCarrera` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `temas` VARCHAR(45) NULL,
  `semestre` INT NULL,
  PRIMARY KEY (`idMateria`),
  UNIQUE INDEX `idMateria_UNIQUE` (`idMateria` ASC) VISIBLE,
  INDEX `idCarrera_idx` (`idCarrera` ASC) VISIBLE,
  CONSTRAINT `idCarrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `LearnIA`.`Carrera` (`idCarrera`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LearnIA`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LearnIA`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `idEstudiante` INT NOT NULL,
  `idMateria` INT NOT NULL,
  `temasCompletados` VARCHAR(45) NULL,
  `temasCursar` VARCHAR(45) NULL,
  `plazo` VARCHAR(45) NULL,
  `idEvaluaciones` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  UNIQUE INDEX `idCurso_UNIQUE` (`idCurso` ASC) VISIBLE,
  UNIQUE INDEX `idEvaluaciones_UNIQUE` (`idEvaluaciones` ASC) VISIBLE,
  INDEX `idMateria_idx` (`idMateria` ASC) VISIBLE,
  CONSTRAINT `idEstudiante`
    FOREIGN KEY ()
    REFERENCES `LearnIA`.`Estudiante` ()
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idEvaluaciones`
    FOREIGN KEY ()
    REFERENCES `LearnIA`.`Evaluaciones` ()
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idMateria`
    FOREIGN KEY (`idMateria`)
    REFERENCES `LearnIA`.`Materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
