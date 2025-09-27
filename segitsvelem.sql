-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Máj 04. 13:32
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `segitsvelem`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cipő', '2025-05-03 14:02:10', '2025-05-03 14:02:10'),
(2, 'Kabát', '2025-05-03 14:02:10', '2025-05-03 14:02:10'),
(3, 'Cipő', '2025-05-03 14:04:44', '2025-05-03 14:04:44'),
(4, 'Kabát', '2025-05-03 14:04:44', '2025-05-03 14:04:44'),
(5, 'Cipő', '2025-05-04 09:32:22', '2025-05-04 09:32:22'),
(6, 'Kabát', '2025-05-04 09:32:22', '2025-05-04 09:32:22');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000002_create_categories_table', 1),
(5, '2024_01_01_000003_create_products_table', 1),
(6, '2024_01_01_000004_create_orders_table', 1),
(7, '2024_01_01_000005_create_messages_table', 1),
(8, '2025_05_03_140653_add_is_admin_to_users_table', 1),
(9, '2025_05_03_155230_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'token', '8abaa8fdc148590a3056cdb8abae34af23be5ca43c6110a695962d890b78b114', '[\"*\"]', NULL, NULL, '2025-05-03 14:07:16', '2025-05-03 14:07:16'),
(2, 'App\\Models\\User', 3, 'token', '8f02837c678fdabc276014818f6576719844d688665786707026e4707f42c08b', '[\"*\"]', NULL, NULL, '2025-05-03 14:18:37', '2025-05-03 14:18:37'),
(3, 'App\\Models\\User', 5, 'token', '89b9a912d7c43f48dec5c306b409182fb32e6b6bb700672a4b27d2ae269c1f59', '[\"*\"]', NULL, NULL, '2025-05-03 14:37:49', '2025-05-03 14:37:49'),
(4, 'App\\Models\\User', 6, 'token', '09fce61035134cb43870668a682d77366dd464079f00c293823acd617889e57e', '[\"*\"]', NULL, NULL, '2025-05-03 14:38:36', '2025-05-03 14:38:36'),
(5, 'App\\Models\\User', 6, 'token', '719472f954e45ff1aeb2fa91eb9d9d49d9e2baed3796dc70a66f0994fe9603da', '[\"*\"]', NULL, NULL, '2025-05-03 14:39:26', '2025-05-03 14:39:26'),
(6, 'App\\Models\\User', 6, 'token', 'b8aa1f8fbe4c87176a61071d397f228ff21234c6519f628b6012f157dce79de8', '[\"*\"]', NULL, NULL, '2025-05-03 14:40:01', '2025-05-03 14:40:01'),
(7, 'App\\Models\\User', 3, 'token', '20af759b6f1f4037991df9a3a9a627d8ee3c7c1b25d60103c6cee51c39e3fb70', '[\"*\"]', NULL, NULL, '2025-05-03 14:42:52', '2025-05-03 14:42:52'),
(8, 'App\\Models\\User', 3, 'token', '60e91fa65f7af242f819c83c72ff48cc72cc68d8fa59bfe1a252634cba22351a', '[\"*\"]', NULL, NULL, '2025-05-03 14:55:14', '2025-05-03 14:55:14'),
(9, 'App\\Models\\User', 7, 'token', '271874c9eb3477b80809b469da7e2cfdc3bc6c6dddbf8b3a3bd4815e4e2c4e54', '[\"*\"]', NULL, NULL, '2025-05-03 14:59:49', '2025-05-03 14:59:49'),
(10, 'App\\Models\\User', 7, 'token', 'eb38528f5748d0a75d3a65c7aedae6c2b77649e0758045dff44ab56c3ff40880', '[\"*\"]', NULL, NULL, '2025-05-03 15:03:43', '2025-05-03 15:03:43'),
(11, 'App\\Models\\User', 7, 'token', 'f03d9277e9b5c9d5920c316f999826b9e8fc298ace52ca5a68170692d5682681', '[\"*\"]', NULL, NULL, '2025-05-03 15:03:45', '2025-05-03 15:03:45'),
(12, 'App\\Models\\User', 7, 'token', 'b2c1f5b472c87352392ad433f5f73c8be5a12ea99c85847b5536d28774195413', '[\"*\"]', NULL, NULL, '2025-05-03 15:03:46', '2025-05-03 15:03:46'),
(13, 'App\\Models\\User', 7, 'token', '3dc766133ea33b3b61e7fc48939b081a8446df9b75cf5bb61f844673b5e5f2f0', '[\"*\"]', NULL, NULL, '2025-05-03 15:06:51', '2025-05-03 15:06:51'),
(14, 'App\\Models\\User', 8, 'token', 'cfad2e2fb8a80f3e96e78b6ec09a5bd6e525ecd5b79879a1a45cad4b6fe9c377', '[\"*\"]', NULL, NULL, '2025-05-03 15:07:12', '2025-05-03 15:07:12'),
(15, 'App\\Models\\User', 9, 'token', '2c11b8226ea9920e582e140b938dd4746e78b4e16c99400f28152570426262ab', '[\"*\"]', NULL, NULL, '2025-05-03 15:12:25', '2025-05-03 15:12:25'),
(16, 'App\\Models\\User', 10, 'token', '7bd225f62a3206dba7163aac58936c3bfcb84c1020dfe75e168b9a0a676c5e47', '[\"*\"]', NULL, NULL, '2025-05-03 15:19:47', '2025-05-03 15:19:47'),
(17, 'App\\Models\\User', 11, 'token', 'be73a3744b80e4de2f3fa9a9ce24db132bcb86a5a488b49f7dee9c5159ec20ac', '[\"*\"]', NULL, NULL, '2025-05-04 02:29:14', '2025-05-04 02:29:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `goal_amount` int(11) NOT NULL DEFAULT 0,
  `collected_amount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `goal_amount`, `collected_amount`, `created_at`, `updated_at`) VALUES
(9, 'Sport cipő iskolás gyereknek', 'A mozgás öröme mindenkit megillet.', '/storage/images/cipo1.jpg', 12000, 4100, NULL, NULL),
(10, 'Téli kabát kisgyermekeknek', 'Védelem és meleg télen is.', '/storage/images/kabat1.jpg', 15000, 8000, NULL, NULL),
(11, 'Futóruha lányoknak', 'Kényelmes és rugalmas sportöltözet.', '/storage/images/futoruha.jpg', 10000, 2500, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('j6smZ2kjgFDoPMJY1cRAt0XMlFZE3OfqmoTFm6lu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUG00SmM1b3NTUHZ1MlhGMklnRXR2VFJmZGhTYTBCVlNpQ0ZzM2l0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746332147);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$1St4G5oJfJA75zwj8N.aEOAsf4vSxWoS.XKNXMwdJJxyEEO.W72l6', NULL, '2025-05-03 14:02:10', '2025-05-03 14:02:10', 0),
(3, 'Admin', 'admin@email.com', NULL, '$2y$12$eiGvhwvEWlfQmOfonaHkSeRaAPIm3Nn0qJo6snz/WaTpcDV38syvi', NULL, '2025-05-03 14:04:44', '2025-05-04 09:32:22', 1),
(4, 'hdfgs', 'horvathcsabael@gmail.com', NULL, '$2y$12$vMJbWgE1.rOd0WqXIMDjLuhQT/laTE5UTcH7TJTbs6ssk5.DWKy2e', NULL, '2025-05-03 14:07:16', '2025-05-03 14:07:16', 0),
(5, 'jkdf', 'wghj@gmail.com', NULL, '$2y$12$08lv/7qbwWnjy.y1q/ew5uetQqTmgY79N.yGXgxuJl1CY23v3QAB6', NULL, '2025-05-03 14:37:49', '2025-05-03 14:37:49', 0),
(6, 'habacs', 'habacs@gmail.com', NULL, '$2y$12$MKg/d.uGHTJ0mQAjr6.NK.uy9FsQFX9Jn7m./R4SygcXjiX0RutZO', NULL, '2025-05-03 14:38:36', '2025-05-03 14:38:36', 0),
(7, 'hahabacs', 'csaba@gmail.com', NULL, '$2y$12$MJT9vATZ8kWXfDRMXOIwbe.0ImtqV8y/dDavHo.V2ScvH6cy4etla', NULL, '2025-05-03 14:59:49', '2025-05-03 14:59:49', 0),
(8, 'ew', 'ccsaba@gmail.com', NULL, '$2y$12$oDmZEdWK8sk6Wk6FWvXC6e2IZ1MiC7.dEY3m6t8D35cihJLdPEP3.', NULL, '2025-05-03 15:07:12', '2025-05-03 15:07:12', 0),
(9, 'dsag', 'haha@gmail.com', NULL, '$2y$12$DiGuHwIIcgjI4wdh4lujLOuyPaakA9gHWCCFaze80EENMA7gvdq.i', NULL, '2025-05-03 15:12:25', '2025-05-03 15:12:25', 0),
(10, 'EARFW', 'valamiuj@email.com', NULL, '$2y$12$1NORRabcLF9DLx7VoAHvyuU1G8t7lMEO6y3eGFGNYQlZ6ujgpG822', NULL, '2025-05-03 15:19:47', '2025-05-03 15:19:47', 0),
(11, 'sad', 'sad@gmail.com', NULL, '$2y$12$RR3jc/q7vo75db0EVFjQ9umy8sDVKPoCzv0eNJuEMI36DatIOgAw.', NULL, '2025-05-04 02:29:14', '2025-05-04 02:29:14', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
