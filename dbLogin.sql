-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2022 a las 16:53:56
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblogin`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `allusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `allusers` (
`nIdUser` int(11)
,`user` varchar(10)
,`pass` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catpersonas`
--

CREATE TABLE `catpersonas` (
  `nIdPersona` int(11) NOT NULL,
  `txtNombreP` varchar(30) NOT NULL,
  `txtApellidos` varchar(60) DEFAULT NULL,
  `txtRFC` varchar(15) DEFAULT NULL,
  `txtCURP` varchar(20) DEFAULT NULL,
  `txtNSS` varchar(10) DEFAULT NULL,
  `feNacimiento` date DEFAULT NULL,
  `bActivo` tinyint(1) DEFAULT 0,
  `fhCreatedAt` datetime DEFAULT current_timestamp(),
  `fhUpdatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipop`
--

CREATE TABLE `cattipop` (
  `nIdTipoP` int(11) NOT NULL,
  `txtTipoP` varchar(10) NOT NULL,
  `txtDescripcion` varchar(50) NOT NULL,
  `bActivo` tinyint(1) DEFAULT 0,
  `fhCreatedAt` datetime DEFAULT current_timestamp(),
  `fhUpdatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusers`
--

CREATE TABLE `catusers` (
  `nIdUser` int(11) NOT NULL,
  `fkIdPersona` int(11) NOT NULL,
  `fkidTipoP` int(11) NOT NULL,
  `txtUser` varchar(10) NOT NULL,
  `txtPass` varchar(50) NOT NULL,
  `bActivo` tinyint(1) DEFAULT 0,
  `fhCreatedAt` datetime DEFAULT current_timestamp(),
  `fhUpdatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `userdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `userdata` (
`nIdUser` int(11)
,`txtName` varchar(30)
,`txtLastName` varchar(60)
,`txtRFC` varchar(15)
,`txtCURP` varchar(20)
,`txtNSS` varchar(10)
,`feNacimiento` date
,`userActive` tinyint(1)
,`nIdTipoP` int(11)
,`txtTipoP` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS SELECT `catusers`.`nIdUser` AS `nIdUser`, `catusers`.`txtUser` AS `user`, `catusers`.`txtPass` AS `pass` FROM `catusers` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `userdata`
--
DROP TABLE IF EXISTS `userdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userdata`  AS SELECT `u`.`nIdUser` AS `nIdUser`, `p`.`txtNombreP` AS `txtName`, `p`.`txtApellidos` AS `txtLastName`, `p`.`txtRFC` AS `txtRFC`, `p`.`txtCURP` AS `txtCURP`, `p`.`txtNSS` AS `txtNSS`, `p`.`feNacimiento` AS `feNacimiento`, `u`.`bActivo` AS `userActive`, `t`.`nIdTipoP` AS `nIdTipoP`, `t`.`txtTipoP` AS `txtTipoP` FROM ((`catpersonas` `p` join `catusers` `u` on(`p`.`nIdPersona` = `u`.`fkIdPersona`)) join `cattipop` `t` on(`u`.`fkidTipoP` = `t`.`nIdTipoP`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catpersonas`
--
ALTER TABLE `catpersonas`
  ADD PRIMARY KEY (`nIdPersona`);

--
-- Indices de la tabla `cattipop`
--
ALTER TABLE `cattipop`
  ADD PRIMARY KEY (`nIdTipoP`);

--
-- Indices de la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD PRIMARY KEY (`nIdUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catpersonas`
--
ALTER TABLE `catpersonas`
  MODIFY `nIdPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cattipop`
--
ALTER TABLE `cattipop`
  MODIFY `nIdTipoP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catusers`
--
ALTER TABLE `catusers`
  MODIFY `nIdUser` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
