-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2019 a las 23:48:20
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arisa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `dui` varchar(50) DEFAULT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `registroFiscal` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `empresa`, `telefono`, `celular`, `correo`, `dui`, `nit`, `direccion`, `registroFiscal`, `borradoLogico`) VALUES
(1, 'Jose', 'Perez', 'Jugueton S.A de C.V', '2698-9874', '7698-9841', 'joseJugeton@mail.com', '03025878-0', '0978-140991-687-9', 'Santa Tecla', 'MSH89SGDH4', 1),
(2, 'Pedro', 'Cazada', 'Bimbo S.A de C.V', '2025-9405', '7699-0087', 'pedroBimbo@mail.com', '00579874-5', '0112-041293-022-7', 'Santa Tecla', 'JUI881SDJ1', 1),
(3, 'Carmen', 'Guillen', 'Impresa Repuestos S.A de C.V', '2255-9800', '7056-4021', 'carmenImpRespuestos@mail.com', '01583247-5', '0132-010179-112-9', 'San Salvador', 'LPS984SJ4', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `fecha`, `cantidad`, `subtotal`, `idProveedor`, `borradoLogico`) VALUES
(1, '2019-11-11', 10, 273.5, 1, 1),
(2, '2019-11-14', 10, 159.8, 1, 1),
(3, '2019-11-15', 10, 886.9, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEstado1` int(11) DEFAULT NULL,
  `idTipoImpresion` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallematerial`
--

CREATE TABLE `detallematerial` (
  `idDetalleMaterial` int(11) NOT NULL,
  `idInventario` int(11) DEFAULT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado1`
--

CREATE TABLE `estado1` (
  `idEstado1` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado1`
--

INSERT INTO `estado1` (`idEstado1`, `nombre`, `borradoLogico`) VALUES
(1, 'Aprobado', 1),
(2, 'No Aprobado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado2`
--

CREATE TABLE `estado2` (
  `idEstado2` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado2`
--

INSERT INTO `estado2` (`idEstado2`, `nombre`, `borradoLogico`) VALUES
(1, 'En Espera', 1),
(2, 'En Proceso', 1),
(3, 'Terminada', 1),
(4, 'Entregada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `nombre`, `precio`, `stock`, `descripcion`, `idCompra`, `borradoLogico`) VALUES
(1, 'Producto X', 29.99, 10, 'Descripcion del Producto X', 1, 1),
(2, 'Producto Y', 17.99, 10, 'Descripcion del Producto Y', 2, 1),
(3, 'Producto Z', 92.99, 10, 'Descripcion del Producto Z', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestra`
--

CREATE TABLE `muestra` (
  `idMuestra` int(11) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  `idEstado1` int(11) NOT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `muestra`
--

INSERT INTO `muestra` (`idMuestra`, `url`, `comentarios`, `idEstado1`, `borradoLogico`) VALUES
(1, 'Reporte1.docx', 'N/A', 1, 1),
(2, 'diccionarios1.docx', 'N/A', 1, 1),
(3, 'sprint1.pdf', 'N/A', 1, 1),
(4, 'Carta_(4).docx', 'N/A', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `comentarios` varchar(50) DEFAULT NULL,
  `tamaño` varchar(50) DEFAULT NULL,
  `cArchivo` varchar(100) DEFAULT NULL,
  `idMuestra` int(11) DEFAULT NULL,
  `idEstado2` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombreInv` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `dui` varchar(50) DEFAULT NULL,
  `registroFiscal` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombreInv`, `empresa`, `telefono`, `nit`, `dui`, `registroFiscal`, `celular`, `correo`, `direccion`, `borradoLogico`) VALUES
(1, 'Juan Carlos', 'Telecom S.A de C.V', '2328-9889', '0315-141280-120-2', '01259874-0', 'MELM8305281H0', '7364-2157', 'juan@mail.com', 'San Julian', 1),
(2, 'Rocio Alejandra', 'Freund S.A de C.V', '2200-9367', '0585-100694-100-1', '05697310-8', 'LSJM8305281M2', '7995-2097', 'rocio@mail.com', 'San Salvador', 0),
(3, 'Producto X', 'Bodafin S.A de C.V', '2222222', '891687512783528735', '67476473763', 'c63vf6ef76', '71222134', 'juan@mail.com', 'San Juian', 1),
(4, 'Producto X', 'Bodafin S.A de C.V', '2222222', '891687512783528735', '67476473763', 'c63vf6ef76', '71222134', 'juan@mail.com', 'San Juian', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombre`, `borradoLogico`) VALUES
(1, 'Administrador', 1),
(2, 'Vendedor', 1),
(3, 'Diseñador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoimpresion`
--

CREATE TABLE `tipoimpresion` (
  `idTipoImpresion` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoimpresion`
--

INSERT INTO `tipoimpresion` (`idTipoImpresion`, `nombre`, `costo`, `borradoLogico`) VALUES
(1, 'Laser', 5, 1),
(2, 'digital', 1, 1),
(3, 'offset', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `idRol` int(11) DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUser`, `nombre`, `correo`, `pass`, `image`, `idRol`, `borradoLogico`) VALUES
(1, 'Jairo', 'admin@mail.com', '8cb2237d0679ca88db6464eac60da96345513964', '', 1, 1),
(2, 'Edgardo', 'edgard@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', 2, 1),
(3, 'Denis', 'denis@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', 3, 1),
(4, 'Rocío', 'rafajose251@live.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'AboutMe1.jpg', 1, 1),
(5, 'juan', 'juan.estrada18@itca.edu.sv', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3df127c3f9a76ad11a1b2202b2be7df21.jpg', 1, 1),
(6, 'Daniel', 'carlosestrada251@live.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Sykes.png', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idFactura` int(11) DEFAULT NULL,
  `idCotifacion` int(11) DEFAULT NULL,
  `subTotal` double DEFAULT NULL,
  `borradoLogico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`idCotizacion`),
  ADD KEY `idTipoImpresion` (`idTipoImpresion`),
  ADD KEY `idEstado1` (`idEstado1`);

--
-- Indices de la tabla `detallematerial`
--
ALTER TABLE `detallematerial`
  ADD PRIMARY KEY (`idDetalleMaterial`),
  ADD KEY `idInventario` (`idInventario`),
  ADD KEY `idCotizacion` (`idCotizacion`);

--
-- Indices de la tabla `estado1`
--
ALTER TABLE `estado1`
  ADD PRIMARY KEY (`idEstado1`);

--
-- Indices de la tabla `estado2`
--
ALTER TABLE `estado2`
  ADD PRIMARY KEY (`idEstado2`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `idCompra` (`idCompra`);

--
-- Indices de la tabla `muestra`
--
ALTER TABLE `muestra`
  ADD PRIMARY KEY (`idMuestra`),
  ADD KEY `idEstado1` (`idEstado1`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idMuestra` (`idMuestra`),
  ADD KEY `idCotizacion` (`idCotizacion`),
  ADD KEY `idEstado2` (`idEstado2`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tipoimpresion`
--
ALTER TABLE `tipoimpresion`
  ADD PRIMARY KEY (`idTipoImpresion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idFactura` (`idFactura`),
  ADD KEY `idCotifacion` (`idCotifacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `idCotizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallematerial`
--
ALTER TABLE `detallematerial`
  MODIFY `idDetalleMaterial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado1`
--
ALTER TABLE `estado1`
  MODIFY `idEstado1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado2`
--
ALTER TABLE `estado2`
  MODIFY `idEstado2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `muestra`
--
ALTER TABLE `muestra`
  MODIFY `idMuestra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoimpresion`
--
ALTER TABLE `tipoimpresion`
  MODIFY `idTipoImpresion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idTipoImpresion`) REFERENCES `tipoimpresion` (`idTipoImpresion`),
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idEstado1`) REFERENCES `estado1` (`idEstado1`);

--
-- Filtros para la tabla `detallematerial`
--
ALTER TABLE `detallematerial`
  ADD CONSTRAINT `detallematerial_ibfk_1` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`),
  ADD CONSTRAINT `detallematerial_ibfk_2` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compras` (`idCompras`);

--
-- Filtros para la tabla `muestra`
--
ALTER TABLE `muestra`
  ADD CONSTRAINT `muestra_ibfk_1` FOREIGN KEY (`idEstado1`) REFERENCES `estado1` (`idEstado1`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`idMuestra`) REFERENCES `muestra` (`idMuestra`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`),
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`idEstado2`) REFERENCES `estado2` (`idEstado2`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idCotifacion`) REFERENCES `cotizacion` (`idCotizacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
