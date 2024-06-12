-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 12 jun 2024 om 14:04
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `climate_watch`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `citytemperatures`
--

CREATE TABLE `citytemperatures` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `avg_temp` float DEFAULT NULL,
  `avg_temp_uncert` float DEFAULT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `lat` point NOT NULL,
  `lng` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `countrytemperatures`
--

CREATE TABLE `countrytemperatures` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `avg_temp` float DEFAULT NULL,
  `avg_temp_uncert` float DEFAULT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globaltemperatures`
--

CREATE TABLE `globaltemperatures` (
  `id` int(255) NOT NULL,
  `dt` date NOT NULL,
  `land_avg_temp` float DEFAULT NULL,
  `land_avg_temp_uncert` float DEFAULT NULL,
  `land_max_temp` float DEFAULT NULL,
  `land_max_temp_uncert` float DEFAULT NULL,
  `land_min_temp` float DEFAULT NULL,
  `land_min_temp_uncert` float DEFAULT NULL,
  `land_ocean_avg_temp` float DEFAULT NULL,
  `land_ocean_avg_temp_uncert` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `majorcitytemperatures`
--

CREATE TABLE `majorcitytemperatures` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `avg_temp` float DEFAULT NULL,
  `avg_temp_uncert` float DEFAULT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `lat` point NOT NULL,
  `lng` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `statetemperatures`
--

CREATE TABLE `statetemperatures` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL,
  `avg_temp` float DEFAULT NULL,
  `avg_temp_uncert` float DEFAULT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `citytemperatures`
--
ALTER TABLE `citytemperatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `countrytemperatures`
--
ALTER TABLE `countrytemperatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `globaltemperatures`
--
ALTER TABLE `globaltemperatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `majorcitytemperatures`
--
ALTER TABLE `majorcitytemperatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `statetemperatures`
--
ALTER TABLE `statetemperatures`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `citytemperatures`
--
ALTER TABLE `citytemperatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `countrytemperatures`
--
ALTER TABLE `countrytemperatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `globaltemperatures`
--
ALTER TABLE `globaltemperatures`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6111;

--
-- AUTO_INCREMENT voor een tabel `majorcitytemperatures`
--
ALTER TABLE `majorcitytemperatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `statetemperatures`
--
ALTER TABLE `statetemperatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
