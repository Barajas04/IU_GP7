SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `IU2016`
--

--
-- Creación de la base de datos que usará el programa y creación del usuario que la usará.
--

DROP DATABASE IF EXISTS `IU2016`;
CREATE DATABASE IF NOT EXISTS `IU2016` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `IU2016`;


GRANT ALL PRIVILEGES ON `IU2016`.* TO 'iu2016'@'localhost' IDENTIFIED BY 'iu2016';

-- --------------------------------------------------------

--
-- Table structure for table `ACTIVIDAD`
--

CREATE TABLE IF NOT EXISTS `ACTIVIDAD` (
`ACTIVIDAD_ID` int(100) NOT NULL,
  `ACTIVIDAD_NOMBRE` varchar(50) NOT NULL,
  `ACTIVIDAD_PRECIO` decimal(10,2) NOT NULL,
  `ACTIVIDAD_DESCRIPCION` varchar(200) DEFAULT NULL,
  `CATEGORIA_ID` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ACTIVIDAD`
--

INSERT INTO `ACTIVIDAD` (`ACTIVIDAD_ID`, `ACTIVIDAD_NOMBRE`, `ACTIVIDAD_PRECIO`, `ACTIVIDAD_DESCRIPCION`, `CATEGORIA_ID`) VALUES
(1, 'Splash', 25.00, 'Con musica', 2),
(2, 'Maquinas', 15.00, 'Con maquinas', 4),
(3, 'Baile regional', 9.00, 'Bailes regionales', 2),
(4, 'Bachata', 12.90, 'Bachata', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ACTIVIDAD_ALBERGA_LUGAR`
--

CREATE TABLE IF NOT EXISTS `ACTIVIDAD_ALBERGA_LUGAR` (
  `ACTIVIDAD_ID` int(100) NOT NULL,
  `LUGAR_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ACTIVIDAD_ALBERGA_LUGAR`
--

INSERT INTO `ACTIVIDAD_ALBERGA_LUGAR` (`ACTIVIDAD_ID`, `LUGAR_ID`) VALUES
(3, 1),
(4, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `CAJA`
--

CREATE TABLE IF NOT EXISTS `CAJA` (
  `CAJA_ID` int(100) NOT NULL,
  `CAJA_FECHA` date NOT NULL,
  `CAJA_INGRESOS` decimal(65,2) NOT NULL,
  `CAJA_GASTOS` int(100) NOT NULL,
  `CAJA_BALANCE` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CAJA`
--

INSERT INTO `CAJA` (`CAJA_ID`, `CAJA_FECHA`, `CAJA_INGRESOS`, `CAJA_GASTOS`, `CAJA_BALANCE`) VALUES
(1, '2016-11-18', 1000.00, 500, 500),
(2, '2016-11-17', 2000.00, 1000, 1000),
(3, '2016-11-19', 1500.00, 1000, 500),
(4, '2016-11-20', 2000.00, 500, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `CATEGORIA`
--

CREATE TABLE IF NOT EXISTS `CATEGORIA` (
`CATEGORIA_ID` int(100) NOT NULL,
  `CATEGORIA_NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CATEGORIA`
--

INSERT INTO `CATEGORIA` (`CATEGORIA_ID`, `CATEGORIA_NOMBRE`) VALUES
(1, 'Actividad 3º Edad'),
(2, 'Bailes de Salon'),
(3, 'Bailes Comtemporaneos'),
(4, 'Gimnasio - Pesas');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE`
--

CREATE TABLE IF NOT EXISTS `CLIENTE` (
`CLIENTE_ID` int(100) NOT NULL,
  `CLIENTE_DNI` varchar(10) NOT NULL,
  `CLIENTE_NOMBRE` varchar(30) NOT NULL,
  `CLIENTE_APELLIDOS` varchar(50) NOT NULL,
  `CLIENTE_DIRECCION` varchar(60) NOT NULL,
  `CLIENTE_CORREO` varchar(70) DEFAULT NULL,
  `CLIENTE_FECH_NAC` date NOT NULL,
  `CLIENTE_TELEFONO` int(15) NOT NULL,
  `CLIENTE_PROFESION` varchar(50) DEFAULT NULL,
  `CLIENTE_COMENTARIOS` varchar(1000) DEFAULT NULL,
  `CLIENTE_ESTADO` enum('Activo','Inactivo') CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE`
--

INSERT INTO `CLIENTE` (`CLIENTE_ID`, `CLIENTE_DNI`, `CLIENTE_NOMBRE`, `CLIENTE_APELLIDOS`, `CLIENTE_DIRECCION`, `CLIENTE_CORREO`, `CLIENTE_FECH_NAC`, `CLIENTE_TELEFONO`, `CLIENTE_PROFESION`, `CLIENTE_COMENTARIOS`, `CLIENTE_ESTADO`) VALUES
(1, '12365487Z', 'Javier', 'Ibarra Ramos', 'Avenida de la Pola 3', 'jsierra@yahoo.es', '2000-11-01', 999999999, 'panadero', '', 'Activo'),
(2, '98765432W', 'Marcos', 'Rodríguez Fernández', ' Avenida de Marín 4', 'mrc@rty.com', '1994-08-01', 99999998, 'médico', '', 'Activo'),
(3, '89765644R', 'Raquel', 'Iglesias Iglesias', 'Plaza San Juan 22', 'rigle@hotmail.com', '1991-08-01', 999399999, 'profesora', '', 'Activo'),
(300, '44497152H', 'Martin', 'Puga Egea', 'Avda. Buenos Aires', 'mpugaeg@gmail.com', '1995-01-24', 666668862, 'ingeniero', 'Karateka', 'Activo');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE_ASISTE_ACTIVIDAD`
--

CREATE TABLE IF NOT EXISTS `CLIENTE_ASISTE_ACTIVIDAD` (
  `CLIENTE_ID` int(100) NOT NULL,
  `ACTIVIDAD_ID` int(100) NOT NULL,
  `FECHA_ASISTENCIA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE_ASISTE_ACTIVIDAD`
--

INSERT INTO `CLIENTE_ASISTE_ACTIVIDAD` (`CLIENTE_ID`, `ACTIVIDAD_ID`, `FECHA_ASISTENCIA`) VALUES
(1, 2, '2016-11-15'),
(1, 4, '2016-11-16'),
(2, 2, '2016-11-02'),
(3, 2, '2016-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE_EXTERNO`
--

CREATE TABLE IF NOT EXISTS `CLIENTE_EXTERNO` (
`CLIENTE_EXTERNO_ID` int(100) NOT NULL,
  `CLIENTE_EXTERNO_NIF` char(9) NOT NULL,
  `CLIENTE_EXTERNO_NOMBRE` varchar(20) NOT NULL,
  `CLIENTE_EXTERNO_APELLIDOS` varchar(50) DEFAULT NULL,
  `CLIENTE_EXTERNO_DIRECCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE_EXTERNO`
--

INSERT INTO `CLIENTE_EXTERNO` (`CLIENTE_EXTERNO_ID`, `CLIENTE_EXTERNO_NIF`, `CLIENTE_EXTERNO_NOMBRE`, `CLIENTE_EXTERNO_APELLIDOS`, `CLIENTE_EXTERNO_DIRECCION`) VALUES
(1, '11111111O', 'Isma', 'Vizcaya Vizcaya', 'ESEI 1'),
(2, '11112111O', 'Abraham', 'Groba Groba', 'ESEI 2'),
(3, '33332111O', 'Martin', 'Groba Groba', 'ESEI 7');

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE_INSCRIPCION_ACTIVIDAD`
--

CREATE TABLE IF NOT EXISTS `CLIENTE_INSCRIPCION_ACTIVIDAD` (
  `CLIENTE_ID` int(100) NOT NULL,
  `ACTIVIDAD_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE_INSCRIPCION_ACTIVIDAD`
--

INSERT INTO `CLIENTE_INSCRIPCION_ACTIVIDAD` (`CLIENTE_ID`, `ACTIVIDAD_ID`) VALUES
(1, 2),
(2, 2),
(3, 2),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE_PARTICIPA_EVENTO`
--

CREATE TABLE IF NOT EXISTS `CLIENTE_PARTICIPA_EVENTO` (
  `CLIENTE_ID` int(100) NOT NULL,
  `EVENTO_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE_PARTICIPA_EVENTO`
--

INSERT INTO `CLIENTE_PARTICIPA_EVENTO` (`CLIENTE_ID`, `EVENTO_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE_TIENE_DESCUENTO`
--

CREATE TABLE IF NOT EXISTS `CLIENTE_TIENE_DESCUENTO` (
  `CLIENTE_ID` int(100) NOT NULL,
  `DESCUENTO_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLIENTE_TIENE_DESCUENTO`
--

INSERT INTO `CLIENTE_TIENE_DESCUENTO` (`CLIENTE_ID`, `DESCUENTO_ID`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `DESCUENTO`
--

CREATE TABLE IF NOT EXISTS `DESCUENTO` (
`DESCUENTO_ID` int(100) NOT NULL,
  `DESCUENTO_VALOR` int(100) NOT NULL,
  `DESCUENTO_DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DESCUENTO`
--

INSERT INTO `DESCUENTO` (`DESCUENTO_ID`, `DESCUENTO_VALOR`, `DESCUENTO_DESCRIPCION`) VALUES
(1, 10, NULL),
(2, 15, 'Mas de 3 Actividades');

-- --------------------------------------------------------

--
-- Table structure for table `DOCUMENTO`
--

CREATE TABLE IF NOT EXISTS `DOCUMENTO` (
`DOCUMENTO_ID` int(100) NOT NULL,
  `DOCUMENTO_NOMBRE` varchar(50) NOT NULL,
  `CLIENTE_ID` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DOCUMENTO`
--

INSERT INTO `DOCUMENTO` (`DOCUMENTO_ID`, `DOCUMENTO_NOMBRE`, `CLIENTE_ID`) VALUES
(1, 'Documento relativo a.....', 1),
(2, 'Documento relativo a cosas', 2),
(3, 'Documento firmado LOPD', 3);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLEADOS`
--

CREATE TABLE IF NOT EXISTS `EMPLEADOS` (
  `EMP_USER` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `EMP_PASSWORD` varchar(128) COLLATE latin1_spanish_ci NOT NULL,
  `EMP_NOMBRE` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_APELLIDO` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_DNI` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_FECH_NAC` date DEFAULT NULL,
  `EMP_EMAIL` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_TELEFONO` int(15) DEFAULT NULL,
  `EMP_CUENTA` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_DIRECCION` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_COMENTARIOS` varchar(1000) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_TIPO` int(10) DEFAULT NULL,
  `EMP_ESTADO` enum('Activo','Inactivo') COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_FOTO` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EMP_NOMINA` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `EMPLEADOS`
--

INSERT INTO `EMPLEADOS` (`EMP_USER`, `EMP_PASSWORD`, `EMP_NOMBRE`, `EMP_APELLIDO`, `EMP_DNI`, `EMP_FECH_NAC`, `EMP_EMAIL`, `EMP_TELEFONO`, `EMP_CUENTA`, `EMP_DIRECCION`, `EMP_COMENTARIOS`, `EMP_TIPO`, `EMP_ESTADO`, `EMP_FOTO`, `EMP_NOMINA`) VALUES
('ADMIN', '73acd9a5972130b75066c82595a1fae3', 'Juan Manuel', 'Fernandez Novoa', '65938568Y', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Activo', NULL, NULL),
('monit', 'd9cfd4af77e33817de2160e0c1c7607c', 'Pepe', 'Perez', '70561875Z', '1957-10-31', 'pepe.perez@gmail.com', 666666666, NULL, NULL, NULL, 3, 'Activo', NULL, NULL),
('secret', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'Luis', 'Gomez', '44841787K', '1957-10-31', 'luis.gomez@gmail.com', 666656666, NULL, NULL, NULL, 2, 'Activo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
--

CREATE TABLE IF NOT EXISTS `EMPLEADOS_CAMBIOHORA_ACTIVIDAD` (
  `EMP_USER` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `FECHA_CAMBIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVIDAD_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
--

INSERT INTO `EMPLEADOS_CAMBIOHORA_ACTIVIDAD` (`EMP_USER`, `FECHA_CAMBIO`, `ACTIVIDAD_ID`) VALUES
('monit', '2016-11-08 07:28:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLEADOS_IMPARTE_ACTIVIDAD`
--

CREATE TABLE IF NOT EXISTS `EMPLEADOS_IMPARTE_ACTIVIDAD` (
  `EMP_USER` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ACTIVIDAD_ID` int(100) NOT NULL,
  `FECHA_IMPARTE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLEADOS_IMPARTE_ACTIVIDAD`
--

INSERT INTO `EMPLEADOS_IMPARTE_ACTIVIDAD` (`EMP_USER`, `ACTIVIDAD_ID`, `FECHA_IMPARTE`) VALUES
('monit', 1, '2016-11-10 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLEADOS_PAGINA`
--

CREATE TABLE IF NOT EXISTS `EMPLEADOS_PAGINA` (
  `EMP_USER` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `PAGINA_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLEADOS_PAGINA`
--

INSERT INTO `EMPLEADOS_PAGINA` (`EMP_USER`, `PAGINA_ID`) VALUES
('ADMIN', 1),
('ADMIN', 2),
('ADMIN', 3),
('ADMIN', 4),
('secret', 4),
('ADMIN', 5),
('secret', 5),
('ADMIN', 6),
('secret', 6),
('ADMIN', 7),
('ADMIN', 8),
('ADMIN', 9),
('ADMIN', 10),
('ADMIN', 11),
('ADMIN', 12),
('ADMIN', 13),
('ADMIN', 14),
('ADMIN', 15),
('ADMIN', 16),
('ADMIN', 17),
('ADMIN', 18),
('ADMIN', 19),
('ADMIN', 20),
('ADMIN', 21),
('ADMIN', 22),
('ADMIN', 23),
('ADMIN', 300),
('ADMIN', 301),
('ADMIN', 302),
('ADMIN', 303),
('ADMIN', 304),
('secret', 300),
('secret', 301),
('secret', 302),
('secret', 303),
('secret', 304);

-- --------------------------------------------------------

--
-- Table structure for table `EVENTO`
--

CREATE TABLE IF NOT EXISTS `EVENTO` (
`EVENTO_ID` int(100) NOT NULL,
  `EVENTO_NOMBRE` varchar(100) NOT NULL,
  `EVENTO_ORGANIZADOR` varchar(100) NOT NULL,
  `EVENTO_DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EVENTO`
--

INSERT INTO `EVENTO` (`EVENTO_ID`, `EVENTO_NOMBRE`, `EVENTO_ORGANIZADOR`, `EVENTO_DESCRIPCION`) VALUES
(1, 'Charla con ...', 'Manuel do Miñio', NULL),
(2, 'Coloquio sobre...', 'Ramon Espinar', NULL),
(3, 'Taller de....', 'Juan Sanchez', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `EVENTO_ALBERGA_LUGAR`
--

CREATE TABLE IF NOT EXISTS `EVENTO_ALBERGA_LUGAR` (
  `EVENTO_ID` int(100) NOT NULL,
  `LUGAR_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EVENTO_ALBERGA_LUGAR`
--

INSERT INTO `EVENTO_ALBERGA_LUGAR` (`EVENTO_ID`, `LUGAR_ID`) VALUES
(1, 1),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `FACTURA`
--

CREATE TABLE IF NOT EXISTS `FACTURA` (
`FACTURA_ID` int(100) NOT NULL,
  `CLIENTE_EXTERNO_ID` int(100) NOT NULL,
  `FACTURA_FECHA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FACTURA`
--

INSERT INTO `FACTURA` (`FACTURA_ID`, `CLIENTE_EXTERNO_ID`, `FACTURA_FECHA`) VALUES
(1, 1, '2016-11-17 09:13:38'),
(2, 1, '2016-11-18 14:18:14'),
(3, 2, '2016-11-19 09:27:37'),
(4, 3, '2016-11-20 17:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `FUNCIONALIDAD`
--

CREATE TABLE IF NOT EXISTS `FUNCIONALIDAD` (
`FUNCIONALIDAD_ID` int(10) NOT NULL,
  `FUNCIONALIDAD_NOM` varchar(80) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `FUNCIONALIDAD`
--

INSERT INTO `FUNCIONALIDAD` (`FUNCIONALIDAD_ID`, `FUNCIONALIDAD_NOM`) VALUES
(1, 'GESTION EMPLEADOS'),
(2, 'GESTION ROLES'),
(3, 'GESTION FUNCIONALIDADES'),
(4, 'GESTION PAGINAS'),
(5, 'CONSULTA EMPLEADOS'),
(300, 'GESTION PAGOS');

-- --------------------------------------------------------

--
-- Table structure for table `FUNCIONALIDAD_PAGINA`
--

CREATE TABLE IF NOT EXISTS `FUNCIONALIDAD_PAGINA` (
  `FUNCIONALIDAD_ID` int(10) NOT NULL,
  `PAGINA_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `FUNCIONALIDAD_PAGINA`
--

INSERT INTO `FUNCIONALIDAD_PAGINA` (`FUNCIONALIDAD_ID`, `PAGINA_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(5, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(300, 300),
(300, 301),
(300, 302),
(300, 303),
(300, 304);

-- --------------------------------------------------------

--
-- Table structure for table `LESION`
--

CREATE TABLE IF NOT EXISTS `LESION` (
`LESION_ID` int(100) NOT NULL,
  `LESION_NOM` varchar(100) NOT NULL,
  `LESION_DESC` varchar(200) DEFAULT NULL,
  `EMP_USER` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `CLIENTE_ID` int(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LESION`
--

INSERT INTO `LESION` (`LESION_ID`, `LESION_NOM`, `LESION_DESC`, `EMP_USER`, `CLIENTE_ID`) VALUES
(1, 'Rotura de Muñeca', NULL, 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `LINEA_FACTURA`
--

CREATE TABLE IF NOT EXISTS `LINEA_FACTURA` (
  `LINEA_FACTURA_ID` int(100) NOT NULL,
  `FACTURA_ID` int(100) NOT NULL,
  `LINEA_FACTURA_CONCEPTO` varchar(500) NOT NULL,
  `LINEA_FACTURA_UNIDADES` int(100) NOT NULL,
  `LINEA_FACTURA_PRECIOUD` decimal(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LINEA_FACTURA`
--

INSERT INTO `LINEA_FACTURA` (`LINEA_FACTURA_ID`, `FACTURA_ID`, `LINEA_FACTURA_CONCEPTO`, `LINEA_FACTURA_UNIDADES`, `LINEA_FACTURA_PRECIOUD`) VALUES
(1, 1, 'Proteinas', 5, 25.00),
(1, 2, 'Videojuegos', 3, 70.00),
(1, 3, 'Mancuernas', 10, 20.00),
(1, 4, 'Material escolar', 50, 10.00),
(2, 1, 'Botellas agua', 200, 1.00),
(2, 2, 'Bocadillos', 100, 2.00),
(2, 3, 'Bicicletas', 10, 100.00),
(2, 4, 'Zapatillas', 20, 50.00),
(3, 1, 'Camisetas', 20, 10.00),
(3, 2, 'Pantalones', 20, 30.00),
(3, 4, 'Chaquetas', 20, 50.00),
(4, 4, 'Calcetines', 30, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `LUGAR`
--

CREATE TABLE IF NOT EXISTS `LUGAR` (
`LUGAR_ID` int(100) NOT NULL,
  `LUGAR_NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LUGAR`
--

INSERT INTO `LUGAR` (`LUGAR_ID`, `LUGAR_NOMBRE`) VALUES
(1, 'Sala1'),
(2, 'Piscina'),
(3, 'Sala3');

-- --------------------------------------------------------

--
-- Table structure for table `PAGINA`
--

CREATE TABLE IF NOT EXISTS `PAGINA` (
`PAGINA_ID` int(10) NOT NULL,
  `PAGINA_LINK` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `PAGINA_NOM` varchar(80) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `PAGINA`
--

INSERT INTO `PAGINA` (`PAGINA_ID`, `PAGINA_LINK`, `PAGINA_NOM`) VALUES
(1, '../Views/EMPLEADO_ADD_Vista.php', 'EMPLEADO ADD'),
(2, '../Views/EMPLEADO_DELETE_Vista.php', 'EMPLEADO DELETE'),
(3, '../Views/EMPLEADO_EDIT_Vista.php', 'EMPLEADO EDIT'),
(4, '../Views/EMPLEADO_SHOW_ALL_Vista.php', 'EMPLEADO SHOW ALL'),
(5, '../Views/EMPLEADO_SHOW_CONSULT_Vista.php', 'EMPLEADO SHOW CONSULT'),
(6, '../Views/EMPLEADO_SHOW_Vista.php', 'EMPLEADO SHOW'),
(7, '../Views/FUNCIONALIDAD_ADD_Vista.php', 'FUNCIONALIDAD ADD'),
(8, '../Views/FUNCIONALIDAD_DELETE_Vista.php', 'FUNCIONALIDAD DELETE'),
(9, '../Views/FUNCIONALIDAD_EDIT_Vista.php', 'FUNCIONALIDAD EDIT'),
(10, '../Views/FUNCIONALIDAD_SHOW_ALL_Vista.php', 'FUNCIONALIDAD SHOW ALL'),
(11, '../Views/FUNCIONALIDAD_SHOW_PAGINAS_Vista.php', 'FUNCIONALIDAD SHOW PAGINAS'),
(12, '../Views/FUNCIONALIDAD_SHOW_Vista.php', 'FUNCIONALIDAD SHOW'),
(13, '../Views/PAGINA_ADD_Vista.php', 'PAGINA ADD'),
(14, '../Views/PAGINA_DELETE_Vista.php', 'PAGINA DELETE'),
(15, '../Views/PAGINA_EDIT_Vista.php', 'PAGINA EDIT'),
(16, '../Views/PAGINA_SHOW_ALL_Vista.php', 'PAGINA SHOW ALL'),
(17, '../Views/PAGINA_SHOW_Vista.php', 'PAGINA SHOW'),
(18, '../Views/ROL_ADD_Vista.php', 'ROL ADD'),
(19, '../Views/ROL_DELETE_Vista.php', 'ROL DELETE'),
(20, '../Views/ROL_EDIT_Vista.php', 'ROL EDIT'),
(21, '../Views/ROL_SHOW_ALL_Vista.php', 'ROL SHOW ALL'),
(22, '../Views/ROL_SHOW_FUNCIONES_Vista.php', 'ROL SHOW FUNCIONES'),
(23, '../Views/ROL_SHOW_Vista.php', 'ROL SHOW'),
(300, '../Views/PAGO_ADD_Vista.php', 'PAGO ADD'),
(301, '../Views/PAGO_DELETE_Vista.php', 'PAGO DELETE'),
(302, '../Views/PAGO_EDIT_Vista.php', 'PAGO EDIT'),
(303, '../Views/PAGO_SHOW_ALL_Vista.php', 'PAGO SHOW ALL'),
(304, '../Views/PAGO_SHOW_Vista.php', 'PAGO SHOW');

-- --------------------------------------------------------

--
-- Table structure for table `PAGO`
--

CREATE TABLE IF NOT EXISTS `PAGO` (
`PAGO_ID` int(100) NOT NULL,
`CLIENTE_ID` int(255) NOT NULL,
`PAGO_FECHA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`PAGO_CONCEPTO` varchar(200) DEFAULT NULL,
`PAGO_IMPORTE` decimal(10,2) NOT NULL,
-- `PAGO_IMPORTE` varchar(10) NOT NULL,
`PAGO_ESTADO` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PAGO`
--

INSERT INTO `PAGO` (`PAGO_ID`, `CLIENTE_ID`, `PAGO_FECHA`, `PAGO_CONCEPTO`, `PAGO_IMPORTE`, `PAGO_ESTADO`) VALUES
(1, 300, '2016-11-20 10:26:36', 'Curso de Karate', 500.00, 'PAGADO'),
(2, 300, '2016-11-21 11:00:12', 'Master en Meditacion', 270.90, 'PENDIENTE'),
(3, 300, '2016-12-24 12:30:15', 'Ropa de gimnasio', 217.95, 'PAGADO');

-- --------------------------------------------------------

--
-- Table structure for table `REGISTRO_CONSULTA_LESION`
--

CREATE TABLE IF NOT EXISTS `REGISTRO_CONSULTA_LESION` (
  `REGISTRO_CONSULTA_LESION_ID` int(100) NOT NULL,
  `REGISTRO_CONSULTA_LESION_FECHAHORA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LESION_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `REGISTRO_CONSULTA_LESION`
--

INSERT INTO `REGISTRO_CONSULTA_LESION` (`REGISTRO_CONSULTA_LESION_ID`, `REGISTRO_CONSULTA_LESION_FECHAHORA`, `LESION_ID`) VALUES
(1, '2016-11-20 10:26:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ROL`
--

CREATE TABLE IF NOT EXISTS `ROL` (
`ROL_ID` int(10) NOT NULL,
  `ROL_NOM` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `ROL`
--

INSERT INTO `ROL` (`ROL_ID`, `ROL_NOM`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'SECRETARIO'),
(3, 'MONITOR');

-- --------------------------------------------------------

--
-- Table structure for table `ROL_FUNCIONALIDAD`
--

CREATE TABLE IF NOT EXISTS `ROL_FUNCIONALIDAD` (
  `ROL_ID` int(10) NOT NULL,
  `FUNCIONALIDAD_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `ROL_FUNCIONALIDAD`
--

INSERT INTO `ROL_FUNCIONALIDAD` (`ROL_ID`, `FUNCIONALIDAD_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 300),
(2, 5),
(2, 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ACTIVIDAD`
--
ALTER TABLE `ACTIVIDAD`
 ADD PRIMARY KEY (`ACTIVIDAD_ID`), ADD KEY `CATEGORIA_ID` (`CATEGORIA_ID`);

--
-- Indexes for table `ACTIVIDAD_ALBERGA_LUGAR`
--
ALTER TABLE `ACTIVIDAD_ALBERGA_LUGAR`
 ADD PRIMARY KEY (`ACTIVIDAD_ID`,`LUGAR_ID`), ADD KEY `LUGAR_ID` (`LUGAR_ID`);

--
-- Indexes for table `CAJA`
--
ALTER TABLE `CAJA`
 ADD PRIMARY KEY (`CAJA_ID`);

--
-- Indexes for table `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
 ADD PRIMARY KEY (`CATEGORIA_ID`);

--
-- Indexes for table `CLIENTE`
--
ALTER TABLE `CLIENTE`
 ADD PRIMARY KEY (`CLIENTE_ID`);

--
-- Indexes for table `CLIENTE_ASISTE_ACTIVIDAD`
--
ALTER TABLE `CLIENTE_ASISTE_ACTIVIDAD`
 ADD PRIMARY KEY (`CLIENTE_ID`,`ACTIVIDAD_ID`), ADD KEY `ACTIVIDAD_ID` (`ACTIVIDAD_ID`);

--
-- Indexes for table `CLIENTE_EXTERNO`
--
ALTER TABLE `CLIENTE_EXTERNO`
 ADD PRIMARY KEY (`CLIENTE_EXTERNO_ID`);

--
-- Indexes for table `CLIENTE_INSCRIPCION_ACTIVIDAD`
--
ALTER TABLE `CLIENTE_INSCRIPCION_ACTIVIDAD`
 ADD PRIMARY KEY (`CLIENTE_ID`,`ACTIVIDAD_ID`), ADD KEY `ACTIVIDAD_ID` (`ACTIVIDAD_ID`);

--
-- Indexes for table `CLIENTE_PARTICIPA_EVENTO`
--
ALTER TABLE `CLIENTE_PARTICIPA_EVENTO`
 ADD PRIMARY KEY (`CLIENTE_ID`,`EVENTO_ID`), ADD KEY `EVENTO_ID` (`EVENTO_ID`);

--
-- Indexes for table `CLIENTE_TIENE_DESCUENTO`
--
ALTER TABLE `CLIENTE_TIENE_DESCUENTO`
 ADD PRIMARY KEY (`CLIENTE_ID`,`DESCUENTO_ID`), ADD KEY `DESCUENTO_ID` (`DESCUENTO_ID`);

--
-- Indexes for table `DESCUENTO`
--
ALTER TABLE `DESCUENTO`
 ADD PRIMARY KEY (`DESCUENTO_ID`);

--
-- Indexes for table `DOCUMENTO`
--
ALTER TABLE `DOCUMENTO`
 ADD PRIMARY KEY (`DOCUMENTO_ID`), ADD KEY `CLIENTE_ID` (`CLIENTE_ID`);

--
-- Indexes for table `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
 ADD PRIMARY KEY (`EMP_USER`), ADD KEY `EMP_TIPO` (`EMP_TIPO`);

--
-- Indexes for table `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
--
ALTER TABLE `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
 ADD PRIMARY KEY (`EMP_USER`,`ACTIVIDAD_ID`), ADD KEY `ACTIVIDAD_ID` (`ACTIVIDAD_ID`);

--
-- Indexes for table `EMPLEADOS_IMPARTE_ACTIVIDAD`
--
ALTER TABLE `EMPLEADOS_IMPARTE_ACTIVIDAD`
 ADD PRIMARY KEY (`EMP_USER`,`ACTIVIDAD_ID`), ADD KEY `ACTIVIDAD_ID` (`ACTIVIDAD_ID`);

--
-- Indexes for table `EMPLEADOS_PAGINA`
--
ALTER TABLE `EMPLEADOS_PAGINA`
 ADD PRIMARY KEY (`EMP_USER`,`PAGINA_ID`), ADD KEY `EMPLEADOS__PAGINA_ID_fk` (`PAGINA_ID`);

--
-- Indexes for table `EVENTO`
--
ALTER TABLE `EVENTO`
 ADD PRIMARY KEY (`EVENTO_ID`);

--
-- Indexes for table `EVENTO_ALBERGA_LUGAR`
--
ALTER TABLE `EVENTO_ALBERGA_LUGAR`
 ADD PRIMARY KEY (`EVENTO_ID`,`LUGAR_ID`), ADD KEY `LUGAR_ID` (`LUGAR_ID`);

--
-- Indexes for table `FACTURA`
--
ALTER TABLE `FACTURA`
 ADD PRIMARY KEY (`FACTURA_ID`), ADD KEY `CLIENTE_EXTERNO_ID` (`CLIENTE_EXTERNO_ID`);

--
-- Indexes for table `FUNCIONALIDAD`
--
ALTER TABLE `FUNCIONALIDAD`
 ADD PRIMARY KEY (`FUNCIONALIDAD_ID`);

--
-- Indexes for table `FUNCIONALIDAD_PAGINA`
--
ALTER TABLE `FUNCIONALIDAD_PAGINA`
 ADD PRIMARY KEY (`FUNCIONALIDAD_ID`,`PAGINA_ID`), ADD KEY `PAGINA_ID` (`PAGINA_ID`);

--
-- Indexes for table `LESION`
--
ALTER TABLE `LESION`
 ADD PRIMARY KEY (`LESION_ID`), ADD KEY `EMP_USER` (`EMP_USER`), ADD KEY `CLIENTE_ID` (`CLIENTE_ID`);

--
-- Indexes for table `LINEA_FACTURA`
--
ALTER TABLE `LINEA_FACTURA`
 ADD PRIMARY KEY (`LINEA_FACTURA_ID`,`FACTURA_ID`), ADD KEY `FACTURA_ID` (`FACTURA_ID`);

--
-- Indexes for table `LUGAR`
--
ALTER TABLE `LUGAR`
 ADD PRIMARY KEY (`LUGAR_ID`);

--
-- Indexes for table `PAGINA`
--
ALTER TABLE `PAGINA`
 ADD PRIMARY KEY (`PAGINA_ID`);

--
-- Indexes for table `PAGO`
--
ALTER TABLE `PAGO`
 ADD PRIMARY KEY (`PAGO_ID`), ADD KEY `CLIENTE_ID` (`CLIENTE_ID`);

--
-- Indexes for table `REGISTRO_CONSULTA_LESION`
--
ALTER TABLE `REGISTRO_CONSULTA_LESION`
 ADD PRIMARY KEY (`REGISTRO_CONSULTA_LESION_ID`), ADD KEY `LESION_ID` (`LESION_ID`);

--
-- Indexes for table `ROL`
--
ALTER TABLE `ROL`
 ADD PRIMARY KEY (`ROL_ID`);

--
-- Indexes for table `ROL_FUNCIONALIDAD`
--
ALTER TABLE `ROL_FUNCIONALIDAD`
 ADD PRIMARY KEY (`ROL_ID`,`FUNCIONALIDAD_ID`), ADD KEY `FUNCIONALIDAD_ID` (`FUNCIONALIDAD_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ACTIVIDAD`
--
ALTER TABLE `ACTIVIDAD`
MODIFY `ACTIVIDAD_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
MODIFY `CATEGORIA_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `CLIENTE`
--
ALTER TABLE `CLIENTE`
MODIFY `CLIENTE_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `CLIENTE_EXTERNO`
--
ALTER TABLE `CLIENTE_EXTERNO`
MODIFY `CLIENTE_EXTERNO_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `DESCUENTO`
--
ALTER TABLE `DESCUENTO`
MODIFY `DESCUENTO_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `DOCUMENTO`
--
ALTER TABLE `DOCUMENTO`
MODIFY `DOCUMENTO_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `EVENTO`
--
ALTER TABLE `EVENTO`
MODIFY `EVENTO_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `FACTURA`
--
ALTER TABLE `FACTURA`
MODIFY `FACTURA_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `FUNCIONALIDAD`
--
ALTER TABLE `FUNCIONALIDAD`
MODIFY `FUNCIONALIDAD_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `LESION`
--
ALTER TABLE `LESION`
MODIFY `LESION_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `LUGAR`
--
ALTER TABLE `LUGAR`
MODIFY `LUGAR_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PAGINA`
--
ALTER TABLE `PAGINA`
MODIFY `PAGINA_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `PAGO`
--
ALTER TABLE `PAGO`
MODIFY `PAGO_ID` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ROL`
--
ALTER TABLE `ROL`
MODIFY `ROL_ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ACTIVIDAD`
--
ALTER TABLE `ACTIVIDAD`
ADD CONSTRAINT `ACTIVIDAD_ibfk_1` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `CATEGORIA` (`CATEGORIA_ID`);

--
-- Constraints for table `ACTIVIDAD_ALBERGA_LUGAR`
--
ALTER TABLE `ACTIVIDAD_ALBERGA_LUGAR`
ADD CONSTRAINT `ACTIVIDAD_ALBERGA_LUGAR_ibfk_2` FOREIGN KEY (`LUGAR_ID`) REFERENCES `LUGAR` (`LUGAR_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `ACTIVIDAD_ALBERGA_LUGAR_ibfk_1` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDAD` (`ACTIVIDAD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `CLIENTE_ASISTE_ACTIVIDAD`
--
ALTER TABLE `CLIENTE_ASISTE_ACTIVIDAD`
ADD CONSTRAINT `CLIENTE_ASISTE_ACTIVIDAD_ibfk_2` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDAD` (`ACTIVIDAD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `CLIENTE_ASISTE_ACTIVIDAD_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `CLIENTE_INSCRIPCION_ACTIVIDAD`
--
ALTER TABLE `CLIENTE_INSCRIPCION_ACTIVIDAD`
ADD CONSTRAINT `CLIENTE_INSCRIPCION_ACTIVIDAD_ibfk_2` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDAD` (`ACTIVIDAD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `CLIENTE_INSCRIPCION_ACTIVIDAD_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `CLIENTE_PARTICIPA_EVENTO`
--
ALTER TABLE `CLIENTE_PARTICIPA_EVENTO`
ADD CONSTRAINT `CLIENTE_PARTICIPA_EVENTO_ibfk_2` FOREIGN KEY (`EVENTO_ID`) REFERENCES `EVENTO` (`EVENTO_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `CLIENTE_PARTICIPA_EVENTO_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `CLIENTE_TIENE_DESCUENTO`
--
ALTER TABLE `CLIENTE_TIENE_DESCUENTO`
ADD CONSTRAINT `CLIENTE_TIENE_DESCUENTO_ibfk_2` FOREIGN KEY (`DESCUENTO_ID`) REFERENCES `DESCUENTO` (`DESCUENTO_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `CLIENTE_TIENE_DESCUENTO_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `DOCUMENTO`
--
ALTER TABLE `DOCUMENTO`
ADD CONSTRAINT `DOCUMENTO_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`);

--
-- Constraints for table `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
ADD CONSTRAINT `EMPLEADOS_ibfk_1` FOREIGN KEY (`EMP_TIPO`) REFERENCES `ROL` (`ROL_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
--
ALTER TABLE `EMPLEADOS_CAMBIOHORA_ACTIVIDAD`
ADD CONSTRAINT `EMPLEADOS_CAMBIOHORA_ACTIVIDAD_ibfk_1` FOREIGN KEY (`EMP_USER`) REFERENCES `EMPLEADOS` (`EMP_USER`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `EMPLEADOS_CAMBIOHORA_ACTIVIDAD_ibfk_2` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDAD` (`ACTIVIDAD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `EMPLEADOS_IMPARTE_ACTIVIDAD`
--
ALTER TABLE `EMPLEADOS_IMPARTE_ACTIVIDAD`
ADD CONSTRAINT `EMPLEADOS_IMPARTE_ACTIVIDAD_ibfk_2` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDAD` (`ACTIVIDAD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `EMPLEADOS_IMPARTE_ACTIVIDAD_ibfk_1` FOREIGN KEY (`EMP_USER`) REFERENCES `EMPLEADOS` (`EMP_USER`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `EMPLEADOS_PAGINA`
--
ALTER TABLE `EMPLEADOS_PAGINA`
ADD CONSTRAINT `EMPLEADOS_PAGINA_EMPLEADOS_EMP_USER_fk` FOREIGN KEY (`EMP_USER`) REFERENCES `EMPLEADOS` (`EMP_USER`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `EMPLEADOS_PAGINA_PAGINA_PAGINA_ID_fk` FOREIGN KEY (`PAGINA_ID`) REFERENCES `PAGINA` (`PAGINA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EVENTO_ALBERGA_LUGAR`
--
ALTER TABLE `EVENTO_ALBERGA_LUGAR`
ADD CONSTRAINT `EVENTO_ALBERGA_LUGAR_ibfk_2` FOREIGN KEY (`LUGAR_ID`) REFERENCES `LUGAR` (`LUGAR_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `EVENTO_ALBERGA_LUGAR_ibfk_1` FOREIGN KEY (`EVENTO_ID`) REFERENCES `EVENTO` (`EVENTO_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `FACTURA`
--
ALTER TABLE `FACTURA`
ADD CONSTRAINT `FACTURA_ibfk_1` FOREIGN KEY (`CLIENTE_EXTERNO_ID`) REFERENCES `CLIENTE_EXTERNO` (`CLIENTE_EXTERNO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FUNCIONALIDAD_PAGINA`
--
ALTER TABLE `FUNCIONALIDAD_PAGINA`
ADD CONSTRAINT `FUNCIONALIDAD_PAGINA_ibfk_1` FOREIGN KEY (`FUNCIONALIDAD_ID`) REFERENCES `FUNCIONALIDAD` (`FUNCIONALIDAD_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FUNCIONALIDAD_PAGINA_ibfk_2` FOREIGN KEY (`PAGINA_ID`) REFERENCES `PAGINA` (`PAGINA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `LESION`
--
ALTER TABLE `LESION`
ADD CONSTRAINT `LESION_ibfk_1` FOREIGN KEY (`EMP_USER`) REFERENCES `EMPLEADOS` (`EMP_USER`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `LESION_ibfk_2` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `LINEA_FACTURA`
--
ALTER TABLE `LINEA_FACTURA`
ADD CONSTRAINT `LINEA_FACTURA_ibfk_1` FOREIGN KEY (`FACTURA_ID`) REFERENCES `FACTURA` (`FACTURA_ID`);

--
-- Constraints for table `PAGO`
--
ALTER TABLE `PAGO`
ADD CONSTRAINT `PAGO_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTE` (`CLIENTE_ID`);

--
-- Constraints for table `REGISTRO_CONSULTA_LESION`
--
ALTER TABLE `REGISTRO_CONSULTA_LESION`
ADD CONSTRAINT `REGISTRO_CONSULTA_LESION_ibfk_1` FOREIGN KEY (`LESION_ID`) REFERENCES `LESION` (`LESION_ID`);

--
-- Constraints for table `ROL_FUNCIONALIDAD`
--
ALTER TABLE `ROL_FUNCIONALIDAD`
ADD CONSTRAINT `ROL_FUNCIONALIDAD_ibfk_1` FOREIGN KEY (`ROL_ID`) REFERENCES `ROL` (`ROL_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ROL_FUNCIONALIDAD_ibfk_2` FOREIGN KEY (`FUNCIONALIDAD_ID`) REFERENCES `FUNCIONALIDAD` (`FUNCIONALIDAD_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
