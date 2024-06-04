-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2024 a las 20:16:47
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
-- Base de datos: `tareas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`) VALUES
(1, 'Juan Carlos Gomez'),
(2, 'Ana María Blanco'),
(3, 'Juan Fernando Perez'),
(4, 'Angela Díaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'En proceso'),
(3, 'Terminada'),
(4, 'En impedimento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridades`
--

CREATE TABLE `prioridades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prioridades`
--

INSERT INTO `prioridades` (`id`, `nombre`) VALUES
(1, 'Alta'),
(2, 'Media'),
(3, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text NOT NULL,
  `fechaEstimadaFinalizacion` date NOT NULL,
  `fechaFinalizacion` date DEFAULT NULL,
  `creadorTarea` varchar(250) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `idPrioridad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `titulo`, `descripcion`, `fechaEstimadaFinalizacion`, `fechaFinalizacion`, `creadorTarea`, `observaciones`, `idEmpleado`, `idEstado`, `idPrioridad`, `created_at`, `updated_at`) VALUES
(2, 'laboratorio', 'microservicios', '2024-06-15', NULL, 'carlos castro', 'sobreviviendo', 3, 2, 2, '2024-06-03 23:21:26', '2024-06-03 23:21:26'),
(3, 'electronica', 'laboratorio', '2024-06-04', NULL, 'carlos castro', 'mañana es el laboratorio', 1, 1, 1, '2024-06-04 08:11:22', '2024-06-04 08:11:22'),
(5, 'matematica pura', 'muy dificil para entregar mañana', '2024-06-05', NULL, 'daniel castro', 'funciones', 4, 2, 1, '2024-06-04 17:15:27', '2024-06-04 17:15:27'),
(6, 'prueba 1', 'asd', '2024-06-22', NULL, 'david cuevas', 'qwerras', 3, 2, 1, '2024-06-04 17:20:11', '2024-06-04 17:20:11'),
(7, 'teoria computacion', 'parcial mas tarde', '2024-06-04', NULL, 'alex cuevas', 'esta dificil', 2, 2, 1, '2024-06-04 17:40:50', '2024-06-04 17:40:50'),
(8, 'fisica', 'cuantica', '2024-06-21', NULL, 'daniel alberto', '123456', 2, 1, 1, '2024-06-04 18:03:36', '2024-06-04 18:03:36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prioridades`
--
ALTER TABLE `prioridades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empleados_tareas` (`idEmpleado`),
  ADD KEY `fk_estados_tareas` (`idEstado`),
  ADD KEY `fk_prioridades_tareas` (`idPrioridad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prioridades`
--
ALTER TABLE `prioridades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `fk_empleados_tareas` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_estados_tareas` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `fk_prioridades_tareas` FOREIGN KEY (`idPrioridad`) REFERENCES `prioridades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
