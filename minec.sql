-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2022 a las 00:22:45
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_orden`
--

CREATE TABLE `acciones_orden` (
  `id_accion` int(11) NOT NULL,
  `fecha` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_accion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_ordenes_veteranos`
--

CREATE TABLE `acciones_ordenes_veteranos` (
  `id_orden_rec` int(11) NOT NULL,
  `correlativo_accion` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(15) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `tipo_acccion` varchar(50) NOT NULL,
  `ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aros`
--

CREATE TABLE `aros` (
  `id_aro` int(11) NOT NULL,
  `marca` varchar(75) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `color_varillas` varchar(100) NOT NULL,
  `color_frente` varchar(100) NOT NULL,
  `horizontal` varchar(10) NOT NULL,
  `vertical` varchar(10) NOT NULL,
  `puente` varchar(10) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_acciones_veteranos`
--

CREATE TABLE `detalle_acciones_veteranos` (
  `id_detalle_accion` int(11) NOT NULL,
  `codigo_orden` varchar(25) NOT NULL,
  `correlativo_accion` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden_rectificicacion`
--

CREATE TABLE `detalle_orden_rectificicacion` (
  `id_det_recti` int(11) NOT NULL,
  `codigo_recti` varchar(25) DEFAULT NULL,
  `codigo_orden` varchar(25) DEFAULT NULL,
  `paciente` varchar(150) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `pupilar_od` varchar(10) DEFAULT NULL,
  `pupilar_oi` varchar(10) DEFAULT NULL,
  `lente_od` varchar(10) DEFAULT NULL,
  `lente_oi` varchar(10) DEFAULT NULL,
  `marca_aro` varchar(10) DEFAULT NULL,
  `modelo_aro` varchar(10) DEFAULT NULL,
  `horizontal_aro` varchar(10) DEFAULT NULL,
  `vertical_aro` varchar(10) DEFAULT NULL,
  `puente_aro` varchar(10) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `dui` varchar(12) NOT NULL,
  `estado` varchar(3) NOT NULL,
  `fecha_correlativo` varchar(25) DEFAULT NULL,
  `tipo_lente` varchar(50) NOT NULL,
  `color_varilla` varchar(50) NOT NULL,
  `color_frente` varchar(50) NOT NULL,
  `img` varchar(200) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `estado_aro` varchar(2) NOT NULL,
  `dest_aro` varchar(50) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `usuario_lente` varchar(2) NOT NULL,
  `ocupacion` varchar(200) NOT NULL,
  `avsc` varchar(10) NOT NULL,
  `avfinal` varchar(10) NOT NULL,
  `avsc_oi` varchar(50) NOT NULL,
  `avfinal_oi` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `genero` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_bodega`
--

CREATE TABLE `movimientos_bodega` (
  `id_movimiento` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `esfera` varchar(10) NOT NULL,
  `cilindro` varchar(10) NOT NULL,
  `cantidad` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(12) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `tipo_movimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_lab`
--

CREATE TABLE `orden_lab` (
  `id_orden` int(11) NOT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `paciente` varchar(150) DEFAULT NULL,
  `fecha` varchar(25) DEFAULT NULL,
  `pupilar_od` varchar(10) DEFAULT NULL,
  `pupilar_oi` varchar(10) DEFAULT NULL,
  `lente_od` varchar(10) DEFAULT NULL,
  `lente_oi` varchar(10) DEFAULT NULL,
  `marca_aro` varchar(10) DEFAULT NULL,
  `modelo_aro` varchar(10) DEFAULT NULL,
  `horizontal_aro` varchar(10) DEFAULT NULL,
  `vertical_aro` varchar(10) DEFAULT NULL,
  `puente_aro` varchar(10) DEFAULT NULL,
  `usuario` varchar(25) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `dui` varchar(12) NOT NULL,
  `estado` varchar(3) NOT NULL,
  `fecha_correlativo` varchar(25) DEFAULT NULL,
  `tipo_lente` varchar(50) NOT NULL,
  `color_varilla` varchar(50) NOT NULL,
  `color_frente` varchar(50) NOT NULL,
  `img` varchar(200) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `estado_aro` varchar(2) NOT NULL,
  `dest_aro` varchar(50) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `usuario_lente` varchar(2) NOT NULL,
  `ocupacion` varchar(200) NOT NULL,
  `avsc` varchar(10) NOT NULL,
  `avfinal` varchar(10) NOT NULL,
  `avsc_oi` varchar(50) NOT NULL,
  `avfinal_oi` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `genero` varchar(5) NOT NULL,
  `depto` varchar(60) NOT NULL,
  `municipio` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_usuario`
--

CREATE TABLE `permisos_usuario` (
  `id_usuario_permiso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_permiso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rectificacion`
--

CREATE TABLE `rectificacion` (
  `id_rectifi` int(11) NOT NULL,
  `codigo_rectifi` varchar(25) DEFAULT NULL,
  `fecha` varchar(15) DEFAULT NULL,
  `hora` varchar(15) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `motivo` varchar(200) DEFAULT NULL,
  `estado_aro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rx_det_orden_recti`
--

CREATE TABLE `rx_det_orden_recti` (
  `id_rx_det_orden_recti` int(11) NOT NULL,
  `correlativo_recti` varchar(25) DEFAULT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `od_esferas` varchar(8) DEFAULT NULL,
  `od_cilindros` varchar(8) DEFAULT NULL,
  `od_eje` varchar(8) DEFAULT NULL,
  `od_adicion` varchar(8) DEFAULT NULL,
  `oi_esferas` varchar(8) DEFAULT NULL,
  `oi_cilindros` varchar(8) DEFAULT NULL,
  `oi_eje` varchar(8) DEFAULT NULL,
  `oi_adicion` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rx_orden_lab`
--

CREATE TABLE `rx_orden_lab` (
  `id_rx` int(11) NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `od_esferas` varchar(8) DEFAULT NULL,
  `od_cilindros` varchar(8) DEFAULT NULL,
  `od_eje` varchar(8) DEFAULT NULL,
  `od_adicion` varchar(8) DEFAULT NULL,
  `oi_esferas` varchar(8) DEFAULT NULL,
  `oi_cilindros` varchar(8) DEFAULT NULL,
  `oi_eje` varchar(8) DEFAULT NULL,
  `oi_adicion` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_terminados`
--

CREATE TABLE `stock_terminados` (
  `codigo` varchar(60) NOT NULL,
  `identificador` varchar(25) NOT NULL,
  `id_tabla_term` int(11) DEFAULT NULL,
  `esfera` varchar(15) DEFAULT NULL,
  `cilindro` varchar(15) DEFAULT NULL,
  `stock_min` varchar(5) DEFAULT NULL,
  `stock` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas_terminado`
--

CREATE TABLE `tablas_terminado` (
  `id_tabla_term` int(11) NOT NULL,
  `titulo` varchar(125) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `diseno` varchar(45) DEFAULT NULL,
  `min_cil` varchar(15) DEFAULT NULL,
  `max_cil` varchar(15) DEFAULT NULL,
  `min_esf` varchar(15) DEFAULT NULL,
  `max_esf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(250) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `dui` varchar(50) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `categoria` varchar(1) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `codigo_emp` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `telefono`, `correo`, `dui`, `direccion`, `usuario`, `pass`, `categoria`, `estado`, `codigo_emp`) VALUES
(1, 'Oscar Antonio Gonzalez', '0000000', '----', '-------', 'ss', 'oscar', 'oscar1411', '1', '1', 'LT-12021'),
(3, 'Andres Vasquez', '-', '-', '-------', '-', 'andvas', 'and20vas08', '1', '1', 'LT-12021'),
(20, 'Metrocentro', '---', '---', '---', '--', 'metro', 'metro', '1', '1', '001'),
(21, 'Cascadas', '--', '---', 'cascadas', '---', 'cascadas', 'cascadas', '1', '1', '002');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones_orden`
--
ALTER TABLE `acciones_orden`
  ADD PRIMARY KEY (`id_accion`);

--
-- Indices de la tabla `acciones_ordenes_veteranos`
--
ALTER TABLE `acciones_ordenes_veteranos`
  ADD PRIMARY KEY (`id_orden_rec`),
  ADD UNIQUE KEY `correlativo_accion` (`correlativo_accion`);

--
-- Indices de la tabla `aros`
--
ALTER TABLE `aros`
  ADD PRIMARY KEY (`id_aro`);

--
-- Indices de la tabla `detalle_acciones_veteranos`
--
ALTER TABLE `detalle_acciones_veteranos`
  ADD PRIMARY KEY (`id_detalle_accion`);

--
-- Indices de la tabla `detalle_orden_rectificicacion`
--
ALTER TABLE `detalle_orden_rectificicacion`
  ADD PRIMARY KEY (`id_det_recti`);

--
-- Indices de la tabla `movimientos_bodega`
--
ALTER TABLE `movimientos_bodega`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `orden_lab`
--
ALTER TABLE `orden_lab`
  ADD PRIMARY KEY (`id_orden`),
  ADD UNIQUE KEY `dui` (`dui`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  ADD PRIMARY KEY (`id_usuario_permiso`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `rectificacion`
--
ALTER TABLE `rectificacion`
  ADD PRIMARY KEY (`id_rectifi`),
  ADD UNIQUE KEY `codigo_rectifi` (`codigo_rectifi`);

--
-- Indices de la tabla `rx_det_orden_recti`
--
ALTER TABLE `rx_det_orden_recti`
  ADD PRIMARY KEY (`id_rx_det_orden_recti`);

--
-- Indices de la tabla `rx_orden_lab`
--
ALTER TABLE `rx_orden_lab`
  ADD PRIMARY KEY (`id_rx`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `stock_terminados`
--
ALTER TABLE `stock_terminados`
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD KEY `id_tabla_term` (`id_tabla_term`);

--
-- Indices de la tabla `tablas_terminado`
--
ALTER TABLE `tablas_terminado`
  ADD PRIMARY KEY (`id_tabla_term`),
  ADD UNIQUE KEY `titulo_UNIQUE` (`titulo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones_orden`
--
ALTER TABLE `acciones_orden`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acciones_ordenes_veteranos`
--
ALTER TABLE `acciones_ordenes_veteranos`
  MODIFY `id_orden_rec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aros`
--
ALTER TABLE `aros`
  MODIFY `id_aro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_acciones_veteranos`
--
ALTER TABLE `detalle_acciones_veteranos`
  MODIFY `id_detalle_accion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_orden_rectificicacion`
--
ALTER TABLE `detalle_orden_rectificicacion`
  MODIFY `id_det_recti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_bodega`
--
ALTER TABLE `movimientos_bodega`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_lab`
--
ALTER TABLE `orden_lab`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  MODIFY `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rectificacion`
--
ALTER TABLE `rectificacion`
  MODIFY `id_rectifi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rx_det_orden_recti`
--
ALTER TABLE `rx_det_orden_recti`
  MODIFY `id_rx_det_orden_recti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rx_orden_lab`
--
ALTER TABLE `rx_orden_lab`
  MODIFY `id_rx` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tablas_terminado`
--
ALTER TABLE `tablas_terminado`
  MODIFY `id_tabla_term` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  ADD CONSTRAINT `permisos_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `permisos_usuario_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
