-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2025 a las 07:57:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id`, `Nombre`) VALUES
(1, 'Electronica'),
(2, 'Accesorios '),
(3, 'oficina'),
(4, 'Muebles'),
(5, 'Audio'),
(6, 'celulares'),
(7, 'Almacenamiento'),
(8, 'Gaming'),
(9, 'Redes'),
(10, 'Iluminacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(40) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Correo` varchar(40) NOT NULL,
  `Teléfono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id`, `Nombre`, `Correo`, `Teléfono`) VALUES
(1, 'Juan Pérez', 'juanperez@gmail.com', 70112233),
(2, 'Paola Guardado', 'PaolaGuardado@gmail.com', 70112244),
(3, 'Daniela Chavez', 'DanielaChavez@gmail.com', 61112233),
(4, 'Ernesto Lara', 'ErnestoLara@gmail.com', 61442233),
(5, 'Fatima Herrera', 'FatimaHerrera@gmail.com', 78112241),
(6, 'Carlos Orellana', 'CarlosOrellana@gmail.com', 70554422),
(7, 'Diego Lopez', 'DiegoLopez@gmail.com', 62442233),
(8, 'Josue Villatoro', 'JosueVillatoro@gmail.com', 76552311),
(9, 'Sandra Sanchez', 'SandraSanchez@gmail.com', 67554422),
(10, 'Alejandra Zaldaña', 'AlejandraZaldaña@gmail.com', 78643131);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id` int(40) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `stock` int(50) NOT NULL,
  `Id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id`, `Nombre`, `Precio`, `stock`, `Id_categoria`) VALUES
(1, 'Laptop Lenovo', 750.00, 20, 1),
(2, 'Teclado Mecánico', 45.50, 50, 2),
(3, 'Mouse Inalámbrico', 30.00, 25, 2),
(4, 'Monitor Samsung', 150.00, 15, 1),
(5, 'Impresora HP', 150.00, 25, 3),
(6, 'Auriculares Sony', 125.00, 23, 5),
(7, 'Tablet Samsung', 300.00, 25, 1),
(8, 'Disco Duro 1TB', 85.00, 30, 7),
(9, 'Memoria USB 32GB', 12.00, 100, 7),
(10, 'Silla Gamer', 150.00, 12, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Id` int(40) NOT NULL,
  `id_cliente` int(50) NOT NULL,
  `id_producto` int(55) NOT NULL,
  `cantidad` int(30) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`Id`, `id_cliente`, `id_producto`, `cantidad`, `fecha`) VALUES
(1, 1, 1, 1, '2025-10-01'),
(2, 2, 2, 2, '2025-10-02'),
(3, 3, 3, 1, '2025-10-02'),
(4, 4, 4, 1, '2025-10-03'),
(5, 5, 5, 1, '2025-10-03'),
(6, 6, 6, 2, '2025-10-03'),
(7, 7, 7, 1, '2025-10-03'),
(8, 8, 8, 2, '2025-10-04'),
(9, 10, 9, 4, '2025-10-04'),
(10, 9, 10, 1, '2025-10-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_categoria` (`Id_categoria`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`Id_categoria`) REFERENCES `categoria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
