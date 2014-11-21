-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para banco
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco`;


-- Volcando estructura para tabla banco.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `dniCliente` varchar(50) NOT NULL,
  `nombreCliente` varchar(50) NOT NULL,
  `apellido1Cliente` varchar(50) DEFAULT NULL,
  `apellido2Cliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `dniCliente`, `nombreCliente`, `apellido1Cliente`, `apellido2Cliente`) VALUES
	(1, '123456789-R', 'Marti', 'Gomez', 'Fabia'),
	(2, '987654321-Q', 'Jona', 'Hidalgo', 'Mora'),
	(3, '123456789-A', 'Ivan', 'Sanchez', 'Aaaa'),
	(4, '123456789-B', 'Fran', 'Navarro', 'Flores'),
	(5, 'prueba', 'prueba', 'prueba', 'prueba');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Volcando estructura para tabla banco.cuentabancaria
CREATE TABLE IF NOT EXISTS `cuentabancaria` (
  `idCuentaBancaria` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCuentaBancaria` int(11) NOT NULL DEFAULT '0',
  `idEntidadBancaria` int(11) NOT NULL DEFAULT '0',
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCuentaBancaria`),
  KEY `FKidEntidadBancariaCuenta` (`idEntidadBancaria`),
  KEY `FKidCliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.cuentabancaria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentabancaria` DISABLE KEYS */;
INSERT INTO `cuentabancaria` (`idCuentaBancaria`, `numeroCuentaBancaria`, `idEntidadBancaria`, `idCliente`) VALUES
	(1, 123456789, 1, 2),
	(2, 987654321, 2, 2),
	(3, 0, 3, 2),
	(4, 789654123, 4, 3),
	(5, 444444444, 5, 2);
/*!40000 ALTER TABLE `cuentabancaria` ENABLE KEYS */;


-- Volcando estructura para tabla banco.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `dniEmpleado` varchar(50) DEFAULT '0',
  `nombreEmpleado` varchar(50) DEFAULT '0',
  `apellido1Empleado` varchar(50) DEFAULT '0',
  `apellido2Empleado` varchar(50) DEFAULT '0',
  `idSucursalBancaria` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEmpleado`),
  KEY `FKSucursalBancariaEmpleado` (`idSucursalBancaria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.empleado: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`idEmpleado`, `dniEmpleado`, `nombreEmpleado`, `apellido1Empleado`, `apellido2Empleado`, `idSucursalBancaria`) VALUES
	(1, '12345-A', 'Marti', 'Gomez', 'Fabia', 1),
	(2, '67890-B', 'Jona', 'Hidalgo', 'Mora', 2),
	(3, '12345-B', 'Ivan', 'Sanchez', 'Aaaa', 3),
	(4, '45678-C', 'Fran', 'Navarro', 'Flores', 4),
	(5, 'prueba', 'prueba', 'prueba', 'prueba', 5);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


-- Volcando estructura para tabla banco.entidadbancaria
CREATE TABLE IF NOT EXISTS `entidadbancaria` (
  `idEntidadBancaria` int(11) NOT NULL AUTO_INCREMENT,
  `codigoEntidadBancaria` varchar(50) DEFAULT NULL,
  `nombreEntidadBancaria` varchar(50) DEFAULT NULL,
  `fechaCreacionEntidadBancaria` date DEFAULT NULL,
  PRIMARY KEY (`idEntidadBancaria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.entidadbancaria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `entidadbancaria` DISABLE KEYS */;
INSERT INTO `entidadbancaria` (`idEntidadBancaria`, `codigoEntidadBancaria`, `nombreEntidadBancaria`, `fechaCreacionEntidadBancaria`) VALUES
	(1, 'SB', 'Sabadell', '2014-10-08'),
	(2, 'ST', 'Santander', '2014-10-08'),
	(3, 'BBVA', 'Banco Bilbao', '2014-10-17'),
	(4, 'BK', 'Bankia', '2014-10-17'),
	(5, 'prueba', 'prueba', '2014-10-17');
/*!40000 ALTER TABLE `entidadbancaria` ENABLE KEYS */;


-- Volcando estructura para tabla banco.movimientobancario
CREATE TABLE IF NOT EXISTS `movimientobancario` (
  `idMovimientoBancario` int(11) NOT NULL AUTO_INCREMENT,
  `idCuentaBancariaOrigen` int(11) NOT NULL,
  `idCuentaBancariaDestino` int(11) NOT NULL,
  `cantidadMovimientoBancario` decimal(10,2) DEFAULT '0.00',
  `conceptoMovimientoBancario` varchar(50) DEFAULT '0',
  PRIMARY KEY (`idMovimientoBancario`),
  KEY `FKCuentaBancariaMovimiento` (`idCuentaBancariaOrigen`),
  KEY `FKCuentaBancariaMovimiento2` (`idCuentaBancariaDestino`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.movimientobancario: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientobancario` DISABLE KEYS */;
INSERT INTO `movimientobancario` (`idMovimientoBancario`, `idCuentaBancariaOrigen`, `idCuentaBancariaDestino`, `cantidadMovimientoBancario`, `conceptoMovimientoBancario`) VALUES
	(1, 1, 2, 500.00, 'AAAAA'),
	(2, 1, 3, 500.00, 'BBBBB'),
	(3, 1, 4, 500.00, 'CCCCC'),
	(4, 2, 3, 500.00, 'DDDDD');
/*!40000 ALTER TABLE `movimientobancario` ENABLE KEYS */;


-- Volcando estructura para tabla banco.sucursalbancaria
CREATE TABLE IF NOT EXISTS `sucursalbancaria` (
  `idSucursalBancaria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSucursalBancaria` varchar(50) DEFAULT NULL,
  `direccionSucursalBancaria` varchar(50) DEFAULT NULL,
  `idEntidadBancaria` int(11) NOT NULL,
  PRIMARY KEY (`idSucursalBancaria`),
  KEY `FKEntidadBancariaSucursal` (`idEntidadBancaria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla banco.sucursalbancaria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursalbancaria` DISABLE KEYS */;
INSERT INTO `sucursalbancaria` (`idSucursalBancaria`, `nombreSucursalBancaria`, `direccionSucursalBancaria`, `idEntidadBancaria`) VALUES
	(1, 'Susursal1', 'Valencia', 1),
	(2, 'Sucursal2', 'Madrid', 2),
	(3, 'Susursal3', 'Valencia', 1),
	(4, 'Sucursal4', 'Barcelona', 1),
	(5, 'prueba', 'prueba', 3);
/*!40000 ALTER TABLE `sucursalbancaria` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
