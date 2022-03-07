-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2022 a las 16:41:42
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

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
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--
-- Error leyendo la estructura de la tabla dblogin.documentos: #1932 - Table 'dblogin.documentos' doesn't exist in engine
-- Error leyendo datos de la tabla dblogin.documentos: #1064 - Algo está equivocado en su sintax cerca 'FROM `dblogin`.`documentos`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--
-- Error leyendo la estructura de la tabla dblogin.noticias: #1932 - Table 'dblogin.noticias' doesn't exist in engine
-- Error leyendo datos de la tabla dblogin.noticias: #1064 - Algo está equivocado en su sintax cerca 'FROM `dblogin`.`noticias`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--
-- Error leyendo la estructura de la tabla dblogin.personas: #1932 - Table 'dblogin.personas' doesn't exist in engine
-- Error leyendo datos de la tabla dblogin.personas: #1064 - Algo está equivocado en su sintax cerca 'FROM `dblogin`.`personas`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `userdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `userdata` (
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
-- Error leyendo la estructura de la tabla dblogin.users: #1932 - Table 'dblogin.users' doesn't exist in engine
-- Error leyendo datos de la tabla dblogin.users: #1064 - Algo está equivocado en su sintax cerca 'FROM `dblogin`.`users`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwuserdocuments`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwuserdocuments` (
);

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS  select `users`.`userId` AS `userId`,`users`.`user` AS `user`,`users`.`pass` AS `pass` from `users` where `users`.`bActive` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `userdata`
--
DROP TABLE IF EXISTS `userdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userdata`  AS  select `p`.`personId` AS `personId`,`u`.`userId` AS `userId`,`p`.`personName` AS `Name`,`p`.`personLastName` AS `Lastname`,`p`.`personRFC` AS `RFC`,`p`.`bActive` AS `personActive`,`u`.`user` AS `user`,`u`.`userType` AS `userType`,`u`.`bActive` AS `userActive` from (`personas` `p` join `users` `u` on(`u`.`personId` = `p`.`personId`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwuserdocuments`
--
DROP TABLE IF EXISTS `vwuserdocuments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwuserdocuments`  AS  select `d`.`documentID` AS `documentID`,`d`.`documentName` AS `Document`,`d`.`documentURL` AS `URL`,`d`.`documentType` AS `Type`,`d`.`fCreatedAt` AS `fCreatedAt`,`p`.`personId` AS `personId`,concat(`p`.`Name`,' ',`p`.`Lastname`) AS `Editor`,`p`.`user` AS `user`,`p`.`userType` AS `userType` from (`documentos` `d` join `userdata` `p` on(`d`.`personId` = `p`.`personId`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
