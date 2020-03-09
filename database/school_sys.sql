-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.19 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para school_sys
CREATE DATABASE IF NOT EXISTS `school_sys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `school_sys`;

-- Copiando estrutura para tabela school_sys.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `name_admin` varchar(100) DEFAULT NULL,
  `email_admin` varchar(100) DEFAULT NULL,
  `phone_admin` int DEFAULT NULL,
  `cellphone_admin` int DEFAULT NULL,
  `password_admin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.classes
CREATE TABLE IF NOT EXISTS `classes` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `description_class` varchar(20) DEFAULT NULL,
  `fk_schedule` int DEFAULT NULL,
  `fk_discipline` int DEFAULT NULL,
  PRIMARY KEY (`id_class`),
  KEY `fk_schedule` (`fk_schedule`),
  KEY `fk_discipline` (`fk_discipline`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`fk_schedule`) REFERENCES `schedules` (`id_schedule`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`fk_discipline`) REFERENCES `disciplines` (`id_discipline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.disciplines
CREATE TABLE IF NOT EXISTS `disciplines` (
  `id_discipline` int NOT NULL AUTO_INCREMENT,
  `discipline` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_discipline`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.enrollments
CREATE TABLE IF NOT EXISTS `enrollments` (
  `id_enrollment` int NOT NULL AUTO_INCREMENT,
  `number_enrollment` int DEFAULT NULL,
  `year_enrollment` int DEFAULT NULL,
  `fk_school` int DEFAULT NULL,
  `semester_enrollment` int DEFAULT NULL,
  PRIMARY KEY (`id_enrollment`),
  KEY `fk_school` (`fk_school`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`fk_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.persons
CREATE TABLE IF NOT EXISTS `persons` (
  `id_person` int NOT NULL AUTO_INCREMENT,
  `name_person` varchar(100) DEFAULT NULL,
  `email_person` varchar(100) DEFAULT NULL,
  `avatar_person` blob,
  `birth_person` date DEFAULT NULL,
  `rg_person` int DEFAULT NULL,
  `cpf_person` int DEFAULT NULL,
  `nacionality_person` varchar(100) DEFAULT NULL,
  `type_blood_person` char(2) DEFAULT NULL,
  `cep_person` int DEFAULT NULL,
  `address_person` varchar(100) DEFAULT NULL,
  `number_person` int DEFAULT NULL,
  `neighborhood_person` varchar(100) DEFAULT NULL,
  `city_person` varchar(50) DEFAULT NULL,
  `state_person` varchar(20) DEFAULT NULL,
  `phone_person` int DEFAULT NULL,
  `cellphone_person` int DEFAULT NULL,
  `password_person` varchar(8) DEFAULT NULL,
  `fk_type_person` int DEFAULT NULL,
  PRIMARY KEY (`id_person`),
  KEY `fk_type_person` (`fk_type_person`),
  CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`fk_type_person`) REFERENCES `type_persons` (`id_type_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.presences
CREATE TABLE IF NOT EXISTS `presences` (
  `id_presence` int NOT NULL AUTO_INCREMENT,
  `presence` tinyint(1) DEFAULT NULL,
  `fk_discipline` int DEFAULT NULL,
  PRIMARY KEY (`id_presence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.responsibles
CREATE TABLE IF NOT EXISTS `responsibles` (
  `id_responsible` int NOT NULL AUTO_INCREMENT,
  `family_level_resposible` varchar(30) DEFAULT NULL,
  `fk_person` int DEFAULT NULL,
  PRIMARY KEY (`id_responsible`),
  KEY `fk_person` (`fk_person`),
  CONSTRAINT `responsibles_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `persons` (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id_schedule` int NOT NULL AUTO_INCREMENT,
  `day_schedule` date DEFAULT NULL,
  `hour_schedule` time DEFAULT NULL,
  PRIMARY KEY (`id_schedule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.schools
CREATE TABLE IF NOT EXISTS `schools` (
  `id_school` int NOT NULL AUTO_INCREMENT,
  `name_school` varchar(100) DEFAULT NULL,
  `email_school` varchar(100) DEFAULT NULL,
  `phone_school` int DEFAULT NULL,
  `phone_extension_school` int DEFAULT NULL,
  `cellphone_school` int DEFAULT NULL,
  `cep_school` int DEFAULT NULL,
  `address_person` varchar(100) DEFAULT NULL,
  `number_person` varchar(100) DEFAULT NULL,
  `neighborhood_person` varchar(100) DEFAULT NULL,
  `city_person` varchar(100) DEFAULT NULL,
  `state_person` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.series
CREATE TABLE IF NOT EXISTS `series` (
  `id_serie` int NOT NULL AUTO_INCREMENT,
  `level_serie` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `year_serie` int DEFAULT NULL,
  PRIMARY KEY (`id_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.students
CREATE TABLE IF NOT EXISTS `students` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `shift_school_student` varchar(6) DEFAULT NULL,
  `medicine_student` varchar(100) DEFAULT NULL,
  `fk_person` int DEFAULT NULL,
  `fk_school` int DEFAULT NULL,
  `fk_enrollment` int DEFAULT NULL,
  `fk_responsible` int DEFAULT NULL,
  `fk_teacher` int DEFAULT NULL,
  `fk_class` int DEFAULT NULL,
  `fk_presence` int DEFAULT NULL,
  `fk_student_grade` int DEFAULT NULL,
  `fk_serie` int DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `fk_person` (`fk_person`),
  KEY `fk_school` (`fk_school`),
  KEY `fk_enrollment` (`fk_enrollment`),
  KEY `fk_responsible` (`fk_responsible`),
  KEY `fk_teacher` (`fk_teacher`),
  KEY `fk_class` (`fk_class`),
  KEY `fk_presence` (`fk_presence`),
  KEY `fk_student_grade` (`fk_student_grade`),
  KEY `fk_serie` (`fk_serie`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `persons` (`id_person`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`fk_school`) REFERENCES `schools` (`id_school`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`fk_enrollment`) REFERENCES `enrollments` (`id_enrollment`),
  CONSTRAINT `students_ibfk_4` FOREIGN KEY (`fk_responsible`) REFERENCES `responsibles` (`id_responsible`),
  CONSTRAINT `students_ibfk_5` FOREIGN KEY (`fk_teacher`) REFERENCES `teachers` (`id_teacher`),
  CONSTRAINT `students_ibfk_6` FOREIGN KEY (`fk_class`) REFERENCES `classes` (`id_class`),
  CONSTRAINT `students_ibfk_7` FOREIGN KEY (`fk_presence`) REFERENCES `presences` (`id_presence`),
  CONSTRAINT `students_ibfk_8` FOREIGN KEY (`fk_student_grade`) REFERENCES `students_grades` (`id_student_grade`),
  CONSTRAINT `students_ibfk_9` FOREIGN KEY (`fk_serie`) REFERENCES `series` (`id_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.students_grades
CREATE TABLE IF NOT EXISTS `students_grades` (
  `id_student_grade` int NOT NULL AUTO_INCREMENT,
  `final_grade_student_grade` int DEFAULT NULL,
  `n1_student_grade` int DEFAULT NULL,
  `n2_student_grade` int DEFAULT NULL,
  `n3_student_grade` int DEFAULT NULL,
  `n4_student_grade` int DEFAULT NULL,
  `n5_student_grade` int DEFAULT NULL,
  `fk_discipline` int DEFAULT NULL,
  PRIMARY KEY (`id_student_grade`),
  KEY `fk_discipline` (`fk_discipline`),
  CONSTRAINT `students_grades_ibfk_1` FOREIGN KEY (`fk_discipline`) REFERENCES `disciplines` (`id_discipline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id_teacher` int NOT NULL AUTO_INCREMENT,
  `fk_person` int DEFAULT NULL,
  `fk_class` int DEFAULT NULL,
  PRIMARY KEY (`id_teacher`),
  KEY `fk_person` (`fk_person`),
  KEY `fk_class` (`fk_class`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `persons` (`id_person`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`fk_class`) REFERENCES `classes` (`id_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela school_sys.type_persons
CREATE TABLE IF NOT EXISTS `type_persons` (
  `id_type_person` int NOT NULL AUTO_INCREMENT,
  `description_type_person` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
