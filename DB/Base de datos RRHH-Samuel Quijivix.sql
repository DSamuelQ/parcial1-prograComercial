-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para rrhh
CREATE DATABASE IF NOT EXISTS `rrhh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rrhh`;

-- Volcando estructura para tabla rrhh.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(255) NOT NULL,
  `apellido_empleado` varchar(255) NOT NULL,
  `puesto_empleado` varchar(255) NOT NULL,
  `salario_empleado` decimal(10,0) NOT NULL,
  `email_empleado` varchar(255) NOT NULL,
  `telefono_empleado` varchar(255) NOT NULL,
  `direccion_empleado` varchar(255) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proyectoIdProyecto` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FK_17afc2a447bf13d97859a1326d8` (`proyectoIdProyecto`),
  CONSTRAINT `FK_17afc2a447bf13d97859a1326d8` FOREIGN KEY (`proyectoIdProyecto`) REFERENCES `proyectos` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla rrhh.empleados: ~26 rows (aproximadamente)
INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `apellido_empleado`, `puesto_empleado`, `salario_empleado`, `email_empleado`, `telefono_empleado`, `direccion_empleado`, `fechaNacimiento`, `estado`, `createdAt`, `updatedAt`, `proyectoIdProyecto`) VALUES
	(1, 'Juan', 'Pérez', 'Desarrollador', 8000, 'juan.perez@email.com', '5551234567', 'Calle 123', '1990-05-10', 1, '2025-08-22 18:18:33', '2025-08-22 18:21:04', 1),
	(2, 'Ana', 'García', 'Analista', 7000, 'ana.garcia@email.com', '5551000001', 'Calle 1', '1992-01-10', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 1),
	(3, 'Luis', 'Martínez', 'Desarrollador', 9000, 'luis.martinez@email.com', '5551000002', 'Calle 2', '1990-02-15', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 1),
	(4, 'María', 'López', 'Diseñadora', 8000, 'maria.lopez@email.com', '5551000003', 'Calle 3', '1993-03-20', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 1),
	(5, 'Carlos', 'Hernández', 'QA', 7500, 'carlos.hernandez@email.com', '5551000004', 'Calle 4', '1989-04-25', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 1),
	(6, 'Sofía', 'Ramírez', 'Scrum Master', 9500, 'sofia.ramirez@email.com', '5551000005', 'Calle 5', '1991-05-30', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 2),
	(7, 'Jorge', 'Torres', 'Product Owner', 10000, 'jorge.torres@email.com', '5551000006', 'Calle 6', '1988-06-05', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 2),
	(8, 'Lucía', 'Flores', 'Backend', 8500, 'lucia.flores@email.com', '5551000007', 'Calle 7', '1994-07-10', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 2),
	(9, 'Miguel', 'Santos', 'Frontend', 8200, 'miguel.santos@email.com', '5551000008', 'Calle 8', '1995-08-15', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 2),
	(10, 'Paula', 'Castro', 'DevOps', 8700, 'paula.castro@email.com', '5551000009', 'Calle 9', '1996-09-20', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 2),
	(11, 'Raúl', 'Vega', 'Soporte', 7000, 'raul.vega@email.com', '5551000010', 'Calle 10', '1997-10-25', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 3),
	(12, 'Valeria', 'Mendoza', 'Analista', 7200, 'valeria.mendoza@email.com', '5551000011', 'Calle 11', '1998-11-30', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 3),
	(13, 'Fernando', 'Jiménez', 'Desarrollador', 9300, 'fernando.jimenez@email.com', '5551000012', 'Calle 12', '1999-12-05', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 3),
	(14, 'Andrea', 'Ruiz', 'Diseñadora', 8100, 'andrea.ruiz@email.com', '5551000013', 'Calle 13', '1990-01-10', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 3),
	(15, 'Diego', 'Silva', 'QA', 7600, 'diego.silva@email.com', '5551000014', 'Calle 14', '1991-02-15', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 3),
	(16, 'Camila', 'Ortega', 'Scrum Master', 9600, 'camila.ortega@email.com', '5551000015', 'Calle 15', '1992-03-20', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 4),
	(17, 'Sebastián', 'Rojas', 'Product Owner', 10100, 'sebastian.rojas@email.com', '5551000016', 'Calle 16', '1993-04-25', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 4),
	(18, 'Isabel', 'Navarro', 'Backend', 8600, 'isabel.navarro@email.com', '5551000017', 'Calle 17', '1994-05-30', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 4),
	(19, 'Alejandro', 'Cruz', 'Frontend', 8300, 'alejandro.cruz@email.com', '5551000018', 'Calle 18', '1995-06-05', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 4),
	(20, 'Patricia', 'Morales', 'DevOps', 8800, 'patricia.morales@email.com', '5551000019', 'Calle 19', '1996-07-10', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 4),
	(21, 'Enrique', 'Serrano', 'Soporte', 7100, 'enrique.serrano@email.com', '5551000020', 'Calle 20', '1997-08-15', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 5),
	(22, 'Mónica', 'Paredes', 'Analista', 7300, 'monica.paredes@email.com', '5551000021', 'Calle 21', '1998-09-20', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 5),
	(23, 'Ricardo', 'Aguilar', 'Desarrollador', 9400, 'ricardo.aguilar@email.com', '5551000022', 'Calle 22', '1999-10-25', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 5),
	(24, 'Gabriela', 'Campos', 'Diseñadora', 8200, 'gabriela.campos@email.com', '5551000023', 'Calle 23', '1990-11-30', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 5),
	(25, 'Tomás', 'Delgado', 'QA', 7700, 'tomas.delgado@email.com', '5551000024', 'Calle 24', '1991-12-05', 1, '2025-08-22 18:38:18', '2025-08-22 18:39:20', 5),
	(26, 'Natalia', 'Fuentes', 'Scrum Master', 9700, 'natalia.fuentes@email.com', '5551000025', 'Calle 25', '1992-01-10', 1, '2025-08-22 18:38:18', '2025-08-22 18:38:18', NULL);

-- Volcando estructura para tabla rrhh.proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(255) NOT NULL,
  `descripcion_proyecto` varchar(255) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  `porcentajeCompletado` float NOT NULL DEFAULT '0',
  `estado` tinyint NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla rrhh.proyectos: ~0 rows (aproximadamente)
INSERT INTO `proyectos` (`id_proyecto`, `nombre_proyecto`, `descripcion_proyecto`, `fechaInicio`, `fechaFin`, `porcentajeCompletado`, `estado`, `createdAt`, `updatedAt`) VALUES
	(1, 'Proyecto A', 'Sistema de ventas', '2025-08-22', '2025-12-31', 50, 1, '2025-08-22 18:19:48', '2025-08-22 18:21:39'),
	(2, 'Proyecto Alpha', 'Sistema de inventario', '2025-01-01', '2025-06-30', 0, 1, '2025-08-22 18:38:55', '2025-08-22 18:38:55'),
	(3, 'Proyecto Beta', 'Plataforma de ventas', '2025-02-01', '2025-07-31', 0, 1, '2025-08-22 18:38:55', '2025-08-22 18:38:55'),
	(4, 'Proyecto Gamma', 'App móvil de clientes', '2025-03-01', '2025-08-31', 0, 1, '2025-08-22 18:38:55', '2025-08-22 18:38:55'),
	(5, 'Proyecto Delta', 'Web corporativa', '2025-04-01', '2025-09-30', 0, 1, '2025-08-22 18:38:55', '2025-08-22 18:38:55'),
	(6, 'Proyecto Épsilon', 'Sistema de RRHH', '2025-05-01', '2025-10-31', 0, 1, '2025-08-22 18:38:55', '2025-08-22 18:38:55'),
	(7, 'Proyecto Alpha', 'Sistema de inventario', '2025-01-01', '2025-06-30', 0, 1, '2025-08-22 18:39:20', '2025-08-22 18:39:20'),
	(8, 'Proyecto Beta', 'Plataforma de ventas', '2025-02-01', '2025-07-31', 0, 1, '2025-08-22 18:39:20', '2025-08-22 18:39:20'),
	(9, 'Proyecto Gamma', 'App móvil de clientes', '2025-03-01', '2025-08-31', 0, 1, '2025-08-22 18:39:20', '2025-08-22 18:39:20'),
	(10, 'Proyecto Delta', 'Web corporativa', '2025-04-01', '2025-09-30', 0, 1, '2025-08-22 18:39:20', '2025-08-22 18:39:20'),
	(11, 'Proyecto Épsilon', 'Sistema de RRHH', '2025-05-01', '2025-10-31', 0, 1, '2025-08-22 18:39:20', '2025-08-22 18:39:20');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
