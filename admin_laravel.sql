-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2021 at 07:35 AM
-- Server version: 10.5.8-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Billing', NULL, NULL),
(2, 'Support', NULL, NULL),
(3, 'Sales', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `ticket_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'what helo u want?', '2020-10-22 17:00:17', '2020-10-22 17:00:17'),
(2, 1, 3, 'ok thanks', '2020-11-01 09:02:08', '2020-11-01 09:02:08'),
(3, 1, 3, 'Can you check that out', '2020-11-01 10:46:54', '2020-11-01 10:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_users`
--

CREATE TABLE `company_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_tokens`
--

CREATE TABLE `confirmation_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `confirmation_tokens`
--

INSERT INTO `confirmation_tokens` (`id`, `user_id`, `token`, `expires_at`) VALUES
(1, 3, 'P0Zm1ohwMTPekMc0IfGmdJ97qLMTZt50qhi6fbyaV9tFLmm2xZUvvARQqhnyeJZPK8vjH1bmuXw7vzJTwKxZWKjHrxsXJq4FCtfYzL0GNUgfNb4sKEJwR3HVDANaJ5wibLdNRCL4e3cxkuTAUjd2152oDWwHeHrcRvKnZ3jDZVoHFIMNZ04ODtcyjosm3QXDE8OhcKUG', '2020-10-10 14:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent_off` double(8,2) NOT NULL,
  `duration` enum('forever','once','repeating') COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_in_months` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `gateway_id`, `percent_off`, `duration`, `duration_in_months`, `currency`, `created_at`, `updated_at`) VALUES
(1, 'Free100', 'Free100', 100.00, 'forever', NULL, NULL, '2020-10-22 17:05:26', '2020-10-22 17:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'database', 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"},\"telescope_uuid\":\"90ac2882-0d72-4a2c-9e2f-aa718fa8cba1\"}', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined function CreatyDev\\App\\Traits\\Eloquent\\Auth\\str_random() in C:\\laragon\\www\\saasweb\\app\\App\\Traits\\Eloquent\\Auth\\HasConfirmationToken.php:22\nStack trace:\n#0 C:\\laragon\\www\\saasweb\\app\\Domain\\Auth\\Listeners\\SendActivationEmail.php(21): CreatyDev\\Domain\\Users\\Models\\User->generateConfirmationToken()\n#1 [internal function]: CreatyDev\\Domain\\Auth\\Listeners\\SendActivationEmail->handle(Object(CreatyDev\\Domain\\Auth\\Events\\UserSignedUp))\n#2 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#3 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#4 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#5 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#7 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#8 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#9 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#10 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#11 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#12 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#14 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#15 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#16 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#18 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#19 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(368): Illuminate\\Queue\\Jobs\\Job->fire()\n#20 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(314): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(134): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#24 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#25 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#26 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(134): Illuminate\\Container\\Container->call(Array)\n#31 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(1001): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(271): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(147): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\laragon\\www\\saasweb\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 {main}', '2020-10-10 14:26:13'),
(2, 'database', 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"},\"telescope_uuid\":\"90b01ae0-1ba8-4e86-8957-f4ea4401fc8f\"}', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined function CreatyDev\\App\\Traits\\Eloquent\\Auth\\str_random() in C:\\laragon\\www\\saasweb\\app\\App\\Traits\\Eloquent\\Auth\\HasConfirmationToken.php:22\nStack trace:\n#0 C:\\laragon\\www\\saasweb\\app\\Domain\\Auth\\Listeners\\SendActivationEmail.php(21): CreatyDev\\Domain\\Users\\Models\\User->generateConfirmationToken()\n#1 [internal function]: CreatyDev\\Domain\\Auth\\Listeners\\SendActivationEmail->handle(Object(CreatyDev\\Domain\\Auth\\Events\\UserSignedUp))\n#2 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#3 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#4 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#5 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#7 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#8 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#9 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#10 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#11 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#12 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#14 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(130): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#15 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#16 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#18 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#19 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(368): Illuminate\\Queue\\Jobs\\Job->fire()\n#20 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(314): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(134): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#24 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#25 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#26 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(590): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(134): Illuminate\\Container\\Container->call(Array)\n#31 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(1001): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(271): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\laragon\\www\\saasweb\\vendor\\symfony\\console\\Application.php(147): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\laragon\\www\\saasweb\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\laragon\\www\\saasweb\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 {main}', '2020-10-10 14:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(5, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Account\\\\Mail\\\\PasswordUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:45:\\\"CreatyDev\\\\Domain\\\\Account\\\\Mail\\\\PasswordUpdated\\\":23:{s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";s:8:\\\"Face Key\\\";s:7:\\\"address\\\";s:18:\\\"mustafa@faceki.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1603094252, 1603094252),
(6, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1603095255, 1603095255),
(7, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1603101721, 1603101721),
(8, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1603731547, 1603731547),
(9, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"c2320b53-5ea0-44ac-9ed7-60807f2bbd39\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(10, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"c2320b53-5ea0-44ac-9ed7-60807f2bbd39\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(11, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"7d1ebe3d-c010-4e34-90d1-7d1b9e3b792e\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(12, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"7d1ebe3d-c010-4e34-90d1-7d1b9e3b792e\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(13, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"adf9be6b-a350-41f0-9771-6d2592e08523\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(14, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"adf9be6b-a350-41f0-9771-6d2592e08523\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(15, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"daa13b62-c270-4afd-b99f-384fdc429cb3\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(16, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"daa13b62-c270-4afd-b99f-384fdc429cb3\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(17, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"16828893-a7d5-483c-a70c-4e91b6ace0e5\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(18, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"16828893-a7d5-483c-a70c-4e91b6ace0e5\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(19, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"4efb7f9a-bf8b-4e67-b460-e39219f791f4\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(20, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"3btyhXEPZyiviFkD1ILfqsdSXgpj4ChwlkzSYe6U\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:24:\\\"A new update coming soon\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"4efb7f9a-bf8b-4e67-b460-e39219f791f4\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1603732213, 1603732213),
(21, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1604007247, 1604007247),
(22, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"7157f66e-ecd4-41d4-aecc-229e664a20a1\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(23, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"7157f66e-ecd4-41d4-aecc-229e664a20a1\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(24, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"41bf2e3a-101d-4424-8330-732de3c8de57\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(25, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"41bf2e3a-101d-4424-8330-732de3c8de57\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(26, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"2306bdad-9212-4222-ab45-37972859e203\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(27, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"2306bdad-9212-4222-ab45-37972859e203\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(28, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"43386812-5785-4749-93ae-59821410fbe2\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(29, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"43386812-5785-4749-93ae-59821410fbe2\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(30, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"89d5379d-e675-4829-810a-2b430de6993f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(31, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"89d5379d-e675-4829-810a-2b430de6993f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(32, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"e1e6a7a6-cadd-457d-a8fd-7c9e5ae7c366\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(33, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"e1e6a7a6-cadd-457d-a8fd-7c9e5ae7c366\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(34, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"3afd2138-563c-4cca-a99a-c52206684f63\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(35, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:42:\\\"CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\\":10:{s:51:\\\"\\u0000CreatyDev\\\\Domain\\\\Notifications\\\\Annoucement\\u0000message\\\";a:6:{s:6:\\\"_token\\\";s:40:\\\"oXySI9fvQL4IB1aZ93JJO4YF8fyqghTM6MmayHxC\\\";s:7:\\\"subject\\\";s:16:\\\"Update Coming Up\\\";s:4:\\\"body\\\";s:20:\\\"enjoy the new update\\\";s:6:\\\"action\\\";s:6:\\\"Update\\\";s:3:\\\"url\\\";N;s:6:\\\"thanks\\\";s:10:\\\"Thanks you\\\";}s:2:\\\"id\\\";s:36:\\\"3afd2138-563c-4cca-a99a-c52206684f63\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1604228842, 1604228842),
(36, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1604255008, 1604255008),
(37, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1605166919, 1605166919),
(38, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1605172299, 1605172299),
(39, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1605176700, 1605176700),
(40, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1605259701, 1605259701),
(41, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1607328075, 1607328075),
(42, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1608163161, 1608163161),
(43, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1608693886, 1608693886),
(44, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1609470960, 1609470960),
(45, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1609953110, 1609953110),
(46, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1610702533, 1610702533),
(47, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1611226781, 1611226781),
(48, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1611779140, 1611779140),
(49, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1611799049, 1611799049),
(50, 'default', '{\"displayName\":\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:51:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Listeners\\\\SendActivationEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:41:\\\"CreatyDev\\\\Domain\\\\Auth\\\\Events\\\\UserSignedUp\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:34:\\\"CreatyDev\\\\Domain\\\\Users\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', 0, NULL, 1611911703, 1611911703);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2016_09_12_99999_create_visitlogs_table', 1),
(9, '2018_01_29_140758_create_confirmation_tokens_table', 1),
(10, '2018_01_29_141343_add_activated_column_to_users_table', 1),
(11, '2018_01_29_150256_create_permissions_table', 1),
(12, '2018_01_29_150453_create_roles_table', 1),
(13, '2018_01_29_150943_create_user_permissions_table', 1),
(14, '2018_01_29_154234_create_role_permissions_table', 1),
(15, '2018_01_29_154356_create_user_roles_table', 1),
(16, '2018_02_28_130321_create_jobs_table', 1),
(17, '2018_02_28_130538_create_failed_jobs_table', 1),
(18, '2018_03_01_143743_create_plans_table', 1),
(19, '2018_03_03_103144_add_subscription_columns_to_users_table', 1),
(20, '2018_03_06_152357_create_teams_table', 1),
(21, '2018_03_06_223058_create_team_users_table', 1),
(22, '2018_03_08_205447_add_soft_deletes_to_users_table', 1),
(23, '2018_03_09_090754_create_two_factors_table', 1),
(24, '2018_04_27_114317_create_companies_table', 1),
(25, '2018_04_27_120315_create_company_users_table', 1),
(26, '2018_04_27_160948_create_projects_table', 1),
(27, '2018_06_19_143408_add_last_login_at_to_company_users_table', 1),
(28, '2018_08_08_100000_create_telescope_entries_table', 1),
(29, '2019_05_03_000002_create_subscriptions_table', 1),
(30, '2019_05_03_164018_create_tickets_table', 1),
(31, '2019_05_03_164303_create_comments_table', 1),
(32, '2019_05_03_164320_create_categories_table', 1),
(33, '2019_05_12_161258_create_coupons_table', 1),
(34, '2019_07_10_221351_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('405cf1c387e1019d5519fa25830dd2a9401fd61bc81818dfff2cb3282bae3fbd851e94c083989436', 12, 1, 'aaa', '[]', 1, '2020-11-13 14:13:48', '2020-11-13 14:13:48', '2021-11-13 14:13:48'),
('5ce2fac4f7f275b8664a7b098f9fb0d17c7c6a26915ff8ab42147d2fc789e93d7bdbb78c60ed10e6', 5, 1, 'P15', '[]', 0, '2020-11-02 05:00:07', '2020-11-02 05:00:07', '2021-11-02 05:00:07'),
('6b80751bb7ed31d9886b48df40ab078324adcd00868349e28cb27e0d15087601accec72d8bada4bb', 4, 1, 'name', '[]', 0, '2020-10-19 08:15:49', '2020-10-19 08:15:49', '2021-10-19 08:15:49'),
('6ee7ec5fbce24ecc95bd82378d4f4a6ba963994c5809a3fe206247fd55757ebda51080370551053f', 21, 1, 'Test', '[]', 0, '2021-01-28 02:00:04', '2021-01-28 02:00:04', '2022-01-28 02:00:04'),
('8a045bcc60d141b55537005d66bcb1d7e47c8845ab867922338b439e1f85375f55bf86f6dc1200e4', 4, 1, 'test', '[]', 0, '2020-10-19 08:16:19', '2020-10-19 08:16:19', '2021-10-19 08:16:19'),
('8f60ebf154ae5382efd79628d2cbc14d64771f66266ea6954924a01dc9f16c915d9e9db345fe4704', 5, 1, '4444', '[]', 1, '2020-10-19 10:11:41', '2020-10-19 10:11:41', '2021-10-19 10:11:41'),
('9238fea93d66990393403b1991ee97182e6c2ced08beb04f7f8046f82c49c6ccdc95365fecd882f8', 3, 1, 'test', '[]', 1, '2020-10-10 15:12:02', '2020-10-10 15:12:02', '2021-10-10 15:12:02'),
('f82372c2fe939e15062f6ef6b111c0d877aefb0a3e585fddc5e49773f1700b8cfdd37b7ddc011b5f', 6, 1, 'Name', '[]', 0, '2020-10-26 17:01:56', '2020-10-26 17:01:56', '2021-10-26 17:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SaasWeb Personal Access Client', 'DSzsOhWDXc6aF6h25vdk19br0ZKRQFWF8UICtRGr', 'http://localhost', 1, 0, 0, '2020-05-28 18:33:49', '2020-05-28 18:33:49'),
(2, NULL, 'SaasWeb Password Grant Client', 'FxBZL3YjvrmpJ4S092JkZRxWCX8tOPLKSKQVsK7f', 'http://localhost', 0, 1, 0, '2020-05-28 18:33:49', '2020-05-28 18:33:49'),
(3, 21, 'Heippi', '3CfCRJLpzgHfJQwzWY39XCXM4ZLdDo4h2dIOFegX', 'https://heippi.com', 0, 0, 0, '2021-01-28 02:11:25', '2021-01-28 02:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-28 18:33:49', '2020-05-28 18:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `usable`, `created_at`, `updated_at`) VALUES
(1, 'manage users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(2, 'manage roles', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(3, 'assign roles', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(4, 'create users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(5, 'update users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(6, 'delete users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(7, 'browse admin', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(8, 'manage roles', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(9, 'manage plans', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(10, 'manage users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(11, 'assign roles', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(12, 'create users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(13, 'update users', 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `teams_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `teams_limit` int(11) DEFAULT NULL,
  `trial_period_days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `gateway_id`, `interval`, `price`, `active`, `teams_enabled`, `teams_limit`, `trial_period_days`, `created_at`, `updated_at`) VALUES
(6, 'Freemium', 'Freemium', 'Freemium', 'year', '0.00', 1, 1, 4, 0, '2020-10-19 10:07:46', '2020-11-12 11:40:51'),
(7, 'Startup', 'Startup', 'Startup', 'month', '29.00', 1, 1, 10, 30, '2020-10-26 17:07:18', '2020-11-12 11:47:54'),
(8, 'Business', 'Business', 'Business', 'month', '99.00', 1, 1, 20, 30, '2020-11-12 11:47:10', '2020-11-12 11:47:10'),
(9, 'Enterprises', 'Enterprises', 'Enterprises', 'year', '1000.00', 1, 1, 100, 0, '2020-11-12 12:22:01', '2020-11-12 12:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `usable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `details`, `_lft`, `_rgt`, `parent_id`, `usable`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, 1, 4, NULL, 0, '2020-05-28 18:33:33', '2020-05-28 18:33:33'),
(2, 'Root', 'admin-root', NULL, 2, 3, 1, 1, '2020-05-28 18:33:33', '2020-05-28 18:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `stripe_plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'main', 'sub_HMZqquNFqEoVcZ', 'active', 'Plan_Bronze', 1, NULL, NULL, '2020-05-28 18:43:18', '2020-06-30 16:39:49'),
(2, 2, 'main', 'sub_HNJMw6zYcBjEd7', 'active', 'Plan_Bronze', 1, NULL, NULL, '2020-05-30 17:44:35', '2020-10-10 13:27:10'),
(3, 3, 'main', 'sub_IB5lCLDMmVlhiy', 'active', 'Plan_Bronze', 1, NULL, NULL, '2020-10-10 15:01:31', '2020-10-19 08:12:14'),
(4, 5, 'main', 'sub_IEOD4A2i19OuoO', 'active', 'Freemium', 1, NULL, NULL, '2020-10-19 10:18:02', '2020-11-12 07:40:39'),
(10, 12, 'main', 'sub_IEOD4A2i19OuoO', 'active', 'Freemium', 1, NULL, NULL, '2020-11-13 10:09:52', '2020-11-13 10:09:52'),
(11, 9, 'main', 'sub_IEOD4A2i19OuoO', 'active', 'Freemium', 1, NULL, NULL, '2020-11-15 18:11:23', '2020-11-16 12:13:25'),
(12, 10, 'main', 'sub_IEOD4A2i19OuoO', 'active', 'Freemium', 1, NULL, NULL, '2020-11-16 10:13:18', '2020-11-16 10:41:04'),
(13, 21, 'main', 'sub_IEOD4A2i19OuoO', 'active', 'Startup', 1, NULL, NULL, '2021-01-29 20:58:51', '2021-01-29 21:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Telemaque Dukens', '2020-05-28 18:34:43', '2020-05-28 18:34:43'),
(2, 2, 'SaaS Admin', '2020-05-30 17:39:55', '2020-05-30 17:39:55'),
(3, 3, 'Faceki', '2020-10-10 14:25:34', '2020-10-19 09:40:36'),
(4, 4, 'test test', '2020-10-19 08:14:15', '2020-10-19 08:14:15'),
(5, 5, 'Faceki', '2020-10-19 10:02:01', '2020-11-02 12:01:23'),
(6, 6, 'name name2', '2020-10-26 16:59:07', '2020-10-26 16:59:07'),
(7, 7, 'sdQMLfHgkPDcrG wTcdrZPynHgBXm', '2020-10-29 21:34:07', '2020-10-29 21:34:07'),
(8, 8, 'Aarfat Islam', '2020-11-01 18:23:28', '2020-11-01 18:23:28'),
(9, 9, 'Arsh Uddin', '2020-11-12 07:41:59', '2020-11-12 07:41:59'),
(10, 10, 'Krishna Mishra', '2020-11-12 09:11:39', '2020-11-12 09:11:39'),
(11, 11, 'Free User Test', '2020-11-12 10:25:00', '2020-11-12 10:25:00'),
(12, 12, 'name name', '2020-11-13 09:28:21', '2020-11-13 09:28:21'),
(13, 13, 'YVbITOvi HXEhyVesxcj', '2020-12-07 08:01:15', '2020-12-07 08:01:15'),
(14, 14, 'RIStOVgbXQLlu iqQMERUms', '2020-12-16 23:59:21', '2020-12-16 23:59:21'),
(15, 15, 'nXlGzpjsfbdSotIv KbIcvEkwRZFqtQ', '2020-12-23 03:24:46', '2020-12-23 03:24:46'),
(16, 16, 'epwkKMShPl lBShPLHgDAmWMy', '2021-01-01 03:16:00', '2021-01-01 03:16:00'),
(17, 17, 'ROpSYdilysa DtYiZeCxWKN', '2021-01-06 17:11:50', '2021-01-06 17:11:50'),
(18, 18, 'YFeOgitSJpqDcL rQWXpGJn', '2021-01-15 09:22:13', '2021-01-15 09:22:13'),
(19, 19, 'wfDHRVlescumBMyZ VmUaWsJpgXMkyDQG', '2021-01-21 10:59:41', '2021-01-21 10:59:41'),
(20, 20, 'Miguel Celis', '2021-01-27 20:25:40', '2021-01-27 20:25:40'),
(21, 21, 'Murphy Horta Camargo', '2021-01-28 01:57:29', '2021-01-28 01:57:29'),
(22, 22, 'fbwcpCFBrtsjd xNKaGzWw', '2021-01-29 09:15:03', '2021-01-29 09:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `team_users`
--

CREATE TABLE `team_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(2969, '90ee6c71-42aa-4226-9132-9b2d743bbd9b', '90ee6c71-8415-4a5d-972d-f71b6b13f6d0', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'saasweb\' and table_name = \'permissions\' and table_type = \'BASE TABLE\'\",\"time\":\"0.86\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\app\\\\App\\\\Providers\\\\PermissionsServiceProvider.php\",\"line\":20,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:09:19'),
(2970, '90ee6c71-457a-4563-8933-c10af9d4ff29', '90ee6c71-8415-4a5d-972d-f71b6b13f6d0', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `usable` = 1\",\"time\":\"0.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\app\\\\App\\\\Providers\\\\PermissionsServiceProvider.php\",\"line\":21,\"hash\":\"6b64a78ac34d19c39fd3bd5bbce8ce49\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:09:19'),
(2971, '90ee6c71-831f-481b-b62e-d55299ba3053', '90ee6c71-8415-4a5d-972d-f71b6b13f6d0', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `telescope_entries`\",\"time\":\"45.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\artisan\",\"line\":37,\"hash\":\"028161d6b6379f4e627c4ba6981fd441\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:09:19'),
(2972, '90ee6c71-838a-4e57-8cd1-bef38f238206', '90ee6c71-8415-4a5d-972d-f71b6b13f6d0', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `telescope_monitoring`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\artisan\",\"line\":37,\"hash\":\"93d47a4a096729228b0389a4805074ec\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:09:19'),
(2973, '90ee6c71-83f3-4a6f-8389-d862e9292ce1', '90ee6c71-8415-4a5d-972d-f71b6b13f6d0', NULL, 1, 'command', '{\"command\":\"telescope:clear\",\"exit_code\":0,\"arguments\":{\"command\":\"telescope:clear\"},\"options\":{\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:09:19'),
(2974, '90ee6d3d-7117-40e4-8ed0-501a76bf3cf3', '90ee6d3d-a9fc-44ef-978e-70059ea10f54', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'saasweb\' and table_name = \'permissions\' and table_type = \'BASE TABLE\'\",\"time\":\"0.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\app\\\\App\\\\Providers\\\\PermissionsServiceProvider.php\",\"line\":20,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:11:33'),
(2975, '90ee6d3d-73de-4b58-9370-50c8caab3d85', '90ee6d3d-a9fc-44ef-978e-70059ea10f54', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `permissions` where `usable` = 1\",\"time\":\"0.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\app\\\\App\\\\Providers\\\\PermissionsServiceProvider.php\",\"line\":21,\"hash\":\"6b64a78ac34d19c39fd3bd5bbce8ce49\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:11:33'),
(2976, '90ee6d3d-a964-4057-922a-2e532c567626', '90ee6d3d-a9fc-44ef-978e-70059ea10f54', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `telescope_entries` where `created_at` < \'2020-06-29 17:11:33\' limit 1000\",\"time\":\"0.75\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\saasweb\\\\artisan\",\"line\":37,\"hash\":\"7a2bb27e7eee509dd05eaaccb1b357d7\",\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:11:33'),
(2977, '90ee6d3d-a9d9-4678-9e66-2d8129c3a55b', '90ee6d3d-a9fc-44ef-978e-70059ea10f54', NULL, 1, 'command', '{\"command\":\"telescope:prune\",\"exit_code\":0,\"arguments\":{\"command\":\"telescope:prune\"},\"options\":{\"hours\":\"24\",\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"LAPTOP-3V98H7M7\"}', '2020-06-30 17:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `category_id`, `ticket_id`, `title`, `priority`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'R3E3EWSLW5', 'test', 'high', 'help', 'Open', '2020-10-22 16:59:05', '2020-10-22 16:59:05'),
(2, 3, 2, 'JE7VVSWDEN', 'test', 'medium', 'eede', 'Open', '2020-10-22 17:13:16', '2020-10-22 17:13:16'),
(3, 3, 2, '3JINWTPP9X', 'New problem.. can you help', 'medium', 'Test 1', 'Open', '2020-11-01 10:47:23', '2020-11-01 10:47:23'),
(4, 3, 2, '73CIMQXZZG', 'test', 'low', 'eee', 'Open', '2020-11-01 10:53:10', '2020-11-01 10:53:10'),
(5, 5, 1, 'QP651MEPOE', 'Small problem', 'medium', 'Test', 'Open', '2020-11-02 05:01:03', '2020-11-02 05:01:03'),
(6, 5, 1, 'BR7VFYFINJ', 'eee', 'low', 'eee', 'Open', '2020-11-02 11:23:15', '2020-11-02 11:23:15'),
(7, 5, 1, 'OLFPTCVTYM', 'eee', 'low', 'eee', 'Open', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(8, 5, 1, '9FGLVPF0ZK', 'eee', 'low', 'eee', 'Open', '2020-11-02 11:28:18', '2020-11-02 11:28:18'),
(9, 5, 1, '6030NDSKCB', 'eee', 'low', 'eee', 'Open', '2020-11-02 11:34:59', '2020-11-02 11:34:59'),
(10, 5, 2, 'EXBDPYO7RY', 'test', 'medium', 'eeee', 'Open', '2020-11-02 11:35:20', '2020-11-02 11:35:20'),
(11, 5, 2, 'D7JQYQMJEZ', 'testsss', 'medium', 'ssss', 'Open', '2020-11-02 11:37:11', '2020-11-02 11:37:11'),
(12, 5, 2, '4MLWDWC5CT', 'test', 'medium', 'eee', 'Open', '2020-11-02 11:40:06', '2020-11-02 11:40:06'),
(13, 5, 2, 'QE56RUQ5LV', 'test', 'high', 'eee', 'Open', '2020-11-02 11:42:43', '2020-11-02 11:42:43'),
(14, 3, 2, 'OKK2WABCYY', 'sdcd', 'low', 'cddc', 'Open', '2020-11-02 11:47:34', '2020-11-02 11:47:34'),
(15, 3, 2, 'R9C69KI9PD', 'dfe', 'low', 'eeec', 'Open', '2020-11-02 11:51:21', '2020-11-02 11:51:21'),
(16, 3, 2, 'B8D1X6RQ2D', 'sdcd', 'low', 'cddc', 'Open', '2020-11-02 11:56:03', '2020-11-02 11:56:03'),
(17, 3, 2, 'INOJWSMAHY', 'eee', 'medium', 'mmm', 'Open', '2020-11-02 11:56:29', '2020-11-02 11:56:29'),
(18, 3, 2, 'YSI1MSG8LD', 'hello', 'low', 'hi', 'Open', '2020-11-07 09:20:05', '2020-11-07 09:20:05'),
(19, 11, 2, 'UXRCKQ4YA0', 'Test Ticket 13.34', 'medium', 'problem', 'Open', '2020-11-12 10:35:00', '2020-11-12 10:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `two_factor`
--

CREATE TABLE `two_factor` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/uploads/images/avatar.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `profile_image`, `email`, `phone`, `password`, `activated`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `deleted_at`) VALUES
(1, 'Nebin', 'Civil', 'dukenst', '/uploads/images/_1590692737.jpg', 'dukenst2006@gmail.com', '17862285212', '$2y$10$.sPB.TFSpR0m5/8qyiWFi.QGqQoM4m52vJeGP/IrhKdyoVolK754C', 1, NULL, '2020-05-28 18:34:43', '2020-05-28 19:05:38', 'cus_HMZqXOWwTVmAzy', 'MasterCard', '5454', NULL, NULL),
(2, 'SaaS', 'Admin', 'admin', '/uploads/images/avatar.png', 'admin524@admin.com', NULL, '$2y$10$EGnZHYx.myVjI5TIOi.ete5RM.rGnF0IbVHai.PwIPtKFEcwIDL2K', 1, NULL, '2020-05-30 17:39:54', '2020-09-02 21:50:38', 'cus_HNJMV8uSHN5Ve9', 'Visa', '4242', NULL, NULL),
(3, 'Face', 'Key', 'Faceki', '/uploads/images/_1604227426.png', 'hello@faceki.com', '+97336599909', '$2y$10$5RPHb6LVyO/P4sOmyDDfiet6DWghwJ5Ja.dhpQtLkJOg0Yli8gJ7q', 1, 'P34SgHbwBKfZPIcrEkb8CJB3Qrc0EOrGAuQYjfFHmJeSt8XZUkjBEx3RQowO', '2020-10-10 14:25:34', '2020-11-01 10:43:46', 'cus_IB5hpTzoayYrti', 'MasterCard', '5454', NULL, NULL),
(4, 'test', 'test', 'terst', '/uploads/images/avatar.png', 'gbay212121@gmail.com', NULL, '$2y$10$QircCE3ZYax8kt7EZbenJOLnFwejSjPT9uKNZZQWcmcnCiemNYD4O', 1, NULL, '2020-10-19 08:14:15', '2020-10-19 08:14:15', NULL, NULL, NULL, NULL, NULL),
(5, 'name1', 'name2', 'name2', '/uploads/images/avatar.png', 'name@name.com', NULL, '$2y$10$Kwa6qc/E4fWR7jUV.WxFiek7IaE3cZxi1NszK3LXcFruc.u5TuPfC', 1, 'WKI4gGpPJZtzoiwqxIJQIgQAHlvWOuNQWsBRbga5zOsGLucdz60ajwDeIURp', '2020-10-19 10:02:01', '2020-10-19 10:18:01', 'cus_IEODRrkPQDPSKQ', 'Visa', '4242', NULL, NULL),
(6, 'name', 'name2', 'name3', '/uploads/images/avatar.png', 'gbay2121@gmail.com', NULL, '$2y$10$Qrv.iGxDAVpOwCujP7foyuzZoCBH6DTPrirkuYboQkFLZv38rvMba', 1, NULL, '2020-10-26 16:59:07', '2020-10-26 16:59:07', NULL, NULL, NULL, NULL, NULL),
(7, 'sdQMLfHgkPDcrG', 'wTcdrZPynHgBXm', 'eVxmkFBUlhfNaOv', '/uploads/images/avatar.png', 'mizuruhonshi@gmail.com', NULL, '$2y$10$eNqTMrHaM7m9hJn1fGkU0O.61uIpKi8J31LsvA.XPy9mTJrvH07.m', 1, NULL, '2020-10-29 21:34:07', '2020-10-29 21:34:07', NULL, NULL, NULL, NULL, NULL),
(8, 'Aarfat', 'Islam', 'arafat', '/uploads/images/avatar.png', 'arafat@yopmail.com', NULL, '$2y$10$PK6moaONgTemrNd47hJxkOwnJIvgZ49OmY.pry1FTWmt6TNOQRJTe', 1, 'GC4WlAW0S9P45Cj6zScNHhiWwRqG8soxsMLiJQQKb14n1mj5q6MVWOs48ELp', '2020-11-01 18:23:28', '2020-11-01 18:23:28', NULL, NULL, NULL, NULL, NULL),
(9, 'Arsh', 'Uddin', 'arsh', '/uploads/images/avatar.png', 'taqueears@gmail.com', NULL, '$2y$10$a6jqONZsvShDGBSc3IPW3uB4Z6vJdirgd9bcLPtPr9oP3pV0bcQ8G', 1, NULL, '2020-11-12 07:41:59', '2020-11-12 07:41:59', NULL, NULL, NULL, NULL, NULL),
(10, 'Krishna', 'Mishra', 'KrishnaMishra', '/uploads/images/avatar.png', 'er.krishna.mishra@gmail.com', NULL, '$2y$10$3PboaLIcVOqBuosg1DYh7OkKD5CZApCjvCPQY0Gwo.wzmKNGJVw4m', 1, NULL, '2020-11-12 09:11:39', '2020-11-12 09:53:06', 'cus_INNEcMvfFH6x3n', 'Visa', '4242', NULL, NULL),
(11, 'Free User', 'Test', 'FreeUser', '/uploads/images/avatar.png', 'hamza@live.it', '33221100', '$2y$10$A77ZGj6XRovgBnuYUB./0O/qP2FqAZ8Apqx5hWM7Twq5suxwrak0i', 1, NULL, '2020-11-12 10:25:00', '2020-11-12 10:31:11', NULL, NULL, NULL, NULL, NULL),
(12, 'name', 'name', 'name6', '/uploads/images/avatar.png', 'name2@name.com', NULL, '$2y$10$rluGSButPoKEjM.ANTrceuike8RFx6oDm2Qf5rKWSY.niazIrzCmK', 1, 'MyOd694Oqb7YUqX1mwUrE3g54lh7vmxr5w0rUuhuCKjVhlpwlo4qxz2n94R9', '2020-11-13 09:28:21', '2020-11-13 09:28:21', NULL, NULL, NULL, NULL, NULL),
(13, 'YVbITOvi', 'HXEhyVesxcj', 'dRsfJGLl', '/uploads/images/avatar.png', 'josephhoward5551@gmail.com', NULL, '$2y$10$wANOuMog2epoBhCVrFxLxu3WvNV18ADjnFbOJnxGKkj5sXGoHsOVu', 1, NULL, '2020-12-07 08:01:15', '2020-12-07 08:01:15', NULL, NULL, NULL, NULL, NULL),
(14, 'RIStOVgbXQLlu', 'iqQMERUms', 'myacoFRTSCLJ', '/uploads/images/avatar.png', 'barberanne555@gmail.com', NULL, '$2y$10$WwsmTYhkxiFl.IFVvrY2Q.nHZYVIX1k3vJmjSc1kAgybOXLQuOvV.', 1, NULL, '2020-12-16 23:59:21', '2020-12-16 23:59:21', NULL, NULL, NULL, NULL, NULL),
(15, 'nXlGzpjsfbdSotIv', 'KbIcvEkwRZFqtQ', 'yCEQqvTBidkWNOs', '/uploads/images/avatar.png', 'ronalddawson10426@gmail.com', NULL, '$2y$10$lzfHksTGoCtbc5BRpF.5Y.HwoG0Ig0h3rkB6Q00f8p4e/t0Z4XLIq', 1, NULL, '2020-12-23 03:24:46', '2020-12-23 03:24:46', NULL, NULL, NULL, NULL, NULL),
(16, 'epwkKMShPl', 'lBShPLHgDAmWMy', 'ROgPLiHnBbDG', '/uploads/images/avatar.png', 'reynarddavidson207@gmail.com', NULL, '$2y$10$8RdzhVoNMTXM9vJ/1uFcqOei98w8lAFFMHobaz2QKrY9LV5ArQ.p6', 1, NULL, '2021-01-01 03:16:00', '2021-01-01 03:16:00', NULL, NULL, NULL, NULL, NULL),
(17, 'ROpSYdilysa', 'DtYiZeCxWKN', 'iqzaNWfPn', '/uploads/images/avatar.png', 'shawpercival40@gmail.com', NULL, '$2y$10$z.KbcM99nnmWF2L/8hNaZel98AWF7lhgaI6lmWROC.29fD6cgLkTu', 1, NULL, '2021-01-06 17:11:50', '2021-01-06 17:11:50', NULL, NULL, NULL, NULL, NULL),
(18, 'YFeOgitSJpqDcL', 'rQWXpGJn', 'YBAmgSjT', '/uploads/images/avatar.png', 'shermancharles7887@gmail.com', NULL, '$2y$10$CGSxA/iaMO3PMUBBX5xokuQfRFMIah2eUjubN.ZUqAWEUVqADXIO.', 1, NULL, '2021-01-15 09:22:13', '2021-01-15 09:22:13', NULL, NULL, NULL, NULL, NULL),
(19, 'wfDHRVlescumBMyZ', 'VmUaWsJpgXMkyDQG', 'modOeiugZBTLc', '/uploads/images/avatar.png', 'shawnstafford31@gmail.com', NULL, '$2y$10$SnJndnYE1w4ulsxvbHHepOoZn9cSxi.bfKtWN8IkNJBuvV/f/GnoO', 1, NULL, '2021-01-21 10:59:41', '2021-01-21 10:59:41', NULL, NULL, NULL, NULL, NULL),
(20, 'Miguel', 'Celis', 'micelis', '/uploads/images/avatar.png', 'miguel.celisr@gmail.com', NULL, '$2y$10$EVFA4raE2uSnn2C77x.qJOGyetU5Au/cTfap54F4MTLRpz9kg9CHS', 1, 'LsWQV6O7Osvwn0MZwSPbTUFSbOB4zlJJospzfZD70JqjXosHD8P5qTHaxUyr', '2021-01-27 20:25:40', '2021-01-27 20:25:40', NULL, NULL, NULL, NULL, NULL),
(21, 'Murphy', 'Horta Camargo', 'Murphyhc', '/uploads/images/avatar.png', 'murphy.horta.c@gmail.com', NULL, '$2y$10$aUjxbC6Fk0f3Z0CKuf4Kc.0pl.QGh8rYHPKUhNNCdEQYxsyw.G/Pi', 1, 'O5arbhCw2uzM5lKgmYU374GnnGHaV7DlTWmakFTfkg7CBVdMwnU4rezqYOS1', '2021-01-28 01:57:29', '2021-01-28 01:57:29', NULL, NULL, NULL, NULL, NULL),
(22, 'fbwcpCFBrtsjd', 'xNKaGzWw', 'FUksYnxeZDr', '/uploads/images/avatar.png', 'aliciacooper7698@gmail.com', NULL, '$2y$10$XCPQtIquo7ZU9j7XdI1o/OAgnmz1RQJOZHrINHjW/MfN9Z4HsHHYK', 1, NULL, '2021-01-29 09:15:03', '2021-01-29 09:15:03', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, '2020-05-28 18:35:28', '2020-05-28 18:35:28'),
(2, 2, 2, NULL, '2020-05-30 17:47:08', '2020-05-30 17:47:08'),
(3, 3, 2, NULL, '2020-10-19 08:11:28', '2020-10-19 08:11:28'),
(4, 4, 2, NULL, '2020-10-19 09:37:08', '2020-10-19 09:37:08'),
(5, 6, 2, '2020-11-01 17:34:30', '2020-11-01 17:33:09', '2020-11-01 17:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `visitlogs`
--

CREATE TABLE `visitlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitlogs`
--

INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Chrome (85.0.4183.121)', 'Windows', '3', 'Dukens Thelemaque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-07-06 11:19:41', '2020-10-10 15:30:01'),
(2, '0.0.0.0', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-09-02 22:14:55', '2020-10-10 14:56:55'),
(3, '200.113.253.97', 'Chrome (86.0.4240.80)', 'Apple', '3', 'SaaS Admin', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-10-18 13:28:35', '2020-10-18 14:30:18'),
(4, '77.69.239.238', 'Chrome (86.0.4240.99)', 'Android', '3', 'SaaS Admin', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-18 13:28:57', '2020-10-18 14:28:43'),
(5, '199.10.31.203', 'Chrome (75.0.3770.100)', 'Linux', '0', 'Guest', 'CA', 'Canada', 'British Columbia', 'North Vancouver', 'V6C 1T1', NULL, '49.28503036499', '-123.11434936523', 0, '2020-10-18 13:36:04', '2020-10-18 13:36:09'),
(6, '37.131.102.5', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-18 13:55:27', '2020-10-18 13:55:27'),
(7, '54.221.27.173', 'Chrome (80.0.3987.149)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-18 14:46:53', '2021-02-07 18:41:19'),
(8, '159.89.109.98', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2020-10-18 15:05:54', '2020-10-18 15:05:55'),
(9, '77.69.132.55', 'Chrome (86.0.4240.99)', 'Android', '3', 'SaaS Admin', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-18 16:10:24', '2020-10-18 16:10:24'),
(10, '27.115.124.70', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-10-18 16:33:33', '2021-02-08 16:59:20'),
(11, '42.236.10.78', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Binhe', '473000', NULL, '32.98722076416', '112.51306152344', 0, '2020-10-18 16:34:18', '2020-10-18 16:34:23'),
(12, '180.163.220.66', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-10-18 16:34:26', '2020-10-18 16:34:28'),
(13, '2.58.29.151', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Blackheath', 'SE12', NULL, '51.450000762939', '0.050000000745058', 0, '2020-10-18 16:36:46', '2020-10-18 16:36:47'),
(14, '94.76.12.48', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-18 18:06:27', '2020-10-18 18:06:27'),
(15, '66.249.70.88', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-18 19:22:00', '2020-11-02 10:20:39'),
(16, '68.183.196.60', 'Chrome (41.0.2225.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-18 19:47:25', '2020-10-20 06:18:58'),
(17, '159.89.121.95', 'Chrome (41.0.2225.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-18 19:47:27', '2020-10-18 19:47:27'),
(18, '178.128.230.27', 'Chrome (41.0.2225.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-18 19:47:29', '2020-10-18 19:47:29'),
(19, '134.122.32.54', 'Chrome (40.0.2214.93)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-18 19:47:31', '2020-10-18 19:47:31'),
(20, '180.163.220.67', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-10-18 21:27:52', '2020-10-18 21:27:52'),
(21, '45.143.105.189', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'AM', 'Armenia', NULL, NULL, NULL, NULL, '40', '45', 0, '2020-10-18 22:26:01', '2020-10-18 22:26:01'),
(22, '34.240.13.39', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-19 00:53:37', '2020-10-19 00:53:37'),
(23, '52.158.231.99', 'Mozilla (5.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-10-19 05:17:09', '2020-10-19 05:17:09'),
(24, '131.220.6.152', 'Chrome (79.0.3945.79)', 'Linux', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Bonn', '53115', NULL, '50.727199554443', '7.0851001739502', 0, '2020-10-19 05:45:54', '2021-02-11 06:18:57'),
(25, '37.131.50.229', 'Chrome (86.0.4240.80)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-19 05:54:17', '2020-10-22 16:40:28'),
(26, '66.249.70.92', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-19 07:49:51', '2020-11-03 08:00:53'),
(27, '84.255.149.200', 'Chrome (86.0.4240.80)', 'Apple', '5', 'name1 name2', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-19 07:55:05', '2020-10-19 10:28:34'),
(28, '34.71.115.248', 'Chrome (85.0.4183.102)', 'Windows', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-10-19 08:07:10', '2020-10-19 08:07:12'),
(29, '95.211.211.232', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-10-19 08:53:52', '2020-10-19 08:53:53'),
(30, '42.236.10.117', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Binhe', '473000', NULL, '32.98722076416', '112.51306152344', 0, '2020-10-19 11:28:08', '2020-10-23 09:04:46'),
(31, '37.131.14.106', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-19 11:39:36', '2021-02-02 13:50:38'),
(32, '52.168.106.125', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.713001251221', '-78.158996582031', 0, '2020-10-19 13:18:19', '2020-10-19 13:18:21'),
(33, '195.154.63.222', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-19 13:37:07', '2020-11-10 15:35:02'),
(34, '159.138.1.215', 'unknown (unknown)', 'unknown', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-10-19 13:41:36', '2020-10-19 13:41:36'),
(35, '200.113.253.118', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-10-19 14:27:26', '2020-10-19 14:27:26'),
(36, '66.249.70.90', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-19 15:17:40', '2020-10-19 15:17:40'),
(37, '82.194.51.35', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-19 16:04:12', '2020-10-19 17:17:31'),
(38, '37.131.127.120', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-19 21:51:38', '2020-10-20 21:53:41'),
(39, '66.249.75.180', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-20 00:54:11', '2020-10-20 15:38:31'),
(40, '87.119.203.46', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Köln', '50672', NULL, '50.943901062012', '6.9362998008728', 0, '2020-10-20 02:20:22', '2020-10-20 02:20:22'),
(41, '165.231.54.26', 'Opera (53.0.2907.68)', 'Windows', '0', 'Guest', 'US', 'United States', 'Texas', 'West', '76691', NULL, '31.780069351196', '-97.100540161133', 0, '2020-10-20 03:11:29', '2021-01-01 14:44:27'),
(42, '193.36.118.247', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'Scotland', 'Edinburgh', 'EH1', NULL, '55.946388244629', '-3.2000000476837', 0, '2020-10-20 04:06:22', '2020-10-20 04:06:25'),
(43, '23.108.47.106', 'Chrome (80.0.3987.132)', 'Windows', '0', 'Guest', 'US', 'United States', 'Florida', 'Flagami', '33142', NULL, '25.812530517578', '-80.240440368652', 0, '2020-10-20 05:42:52', '2020-10-20 05:42:52'),
(44, '134.122.44.127', 'Chrome (41.0.2225.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Campbell', '95008', NULL, '37.2790184021', '-121.95668792725', 0, '2020-10-20 06:18:57', '2020-10-20 06:18:57'),
(45, '138.197.175.205', 'Chrome (41.0.2228.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-20 06:19:00', '2020-10-20 06:19:00'),
(46, '68.183.205.39', 'Chrome (36.0.1985.67)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-10-20 06:19:02', '2020-10-20 06:19:02'),
(47, '66.249.75.186', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-20 06:44:52', '2020-10-20 06:44:52'),
(48, '84.255.150.80', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-20 07:30:48', '2020-10-20 08:47:43'),
(49, '72.13.62.26', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Bern', 'Bern', '3000', NULL, '46.948020935059', '7.4482097625732', 0, '2020-10-20 09:05:54', '2020-10-20 09:05:54'),
(50, '66.249.75.184', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-20 09:41:09', '2020-10-20 09:41:09'),
(51, '66.249.75.182', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-20 09:56:12', '2020-10-20 18:59:21'),
(52, '128.90.135.25', 'Safari (11.1.2)', 'Apple', '0', 'Guest', 'US', 'United States', 'Texas', 'Austin', '78746', NULL, '30.295660018921', '-97.81372833252', 0, '2020-10-20 11:27:29', '2020-10-22 16:23:23'),
(53, '109.161.166.56', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-20 13:48:49', '2020-10-20 13:52:43'),
(54, '37.131.116.133', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-20 13:52:10', '2020-10-20 13:52:10'),
(55, '84.255.133.146', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-20 14:31:00', '2020-10-20 18:36:44'),
(56, '200.113.253.52', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-10-20 16:47:19', '2020-10-20 16:47:19'),
(57, '88.201.127.64', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-20 18:09:00', '2020-10-20 18:09:00'),
(58, '42.236.10.114', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Binhe', '473000', NULL, '32.98722076416', '112.51306152344', 0, '2020-10-20 21:42:41', '2021-02-08 16:55:48'),
(59, '66.249.66.158', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-21 01:40:32', '2020-10-24 10:20:28'),
(60, '139.59.99.14', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-10-21 03:14:03', '2020-10-21 03:14:04'),
(61, '66.249.66.128', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-21 04:11:23', '2020-10-28 12:10:29'),
(62, '62.151.182.176', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Kansas', 'Lenexa', '66220', NULL, '38.963401794434', '-94.818733215332', 0, '2020-10-21 05:15:47', '2020-10-21 05:15:49'),
(63, '66.42.117.229', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Illinois', 'Elk Grove Village', '60007', NULL, '42.011871337891', '-87.994956970215', 0, '2020-10-21 06:54:39', '2020-10-21 06:54:39'),
(64, '66.249.66.159', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-21 13:04:27', '2020-10-27 10:20:31'),
(65, '94.76.48.25', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 13:09:17', '2020-10-23 14:22:47'),
(66, '94.76.52.0', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 13:12:31', '2020-10-21 13:12:31'),
(67, '87.252.100.64', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 14:52:57', '2020-10-21 14:52:57'),
(68, '3.25.241.117', 'Chrome (84.0.4147.105)', 'Windows', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.868900299072', '151.20710754395', 0, '2020-10-21 16:13:31', '2020-10-21 16:13:31'),
(69, '89.148.0.67', 'iPhone (11.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 17:47:11', '2020-10-21 21:32:09'),
(70, '222.65.135.108', 'Chrome (19.0.1063.0)', 'Windows', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-10-21 18:24:05', '2020-10-21 18:24:05'),
(71, '163.172.149.104', 'Chrome (73.0.3683.86)', 'Apple', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-21 18:33:25', '2020-10-21 18:33:40'),
(72, '193.188.121.4', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 19:09:17', '2020-10-21 19:12:30'),
(73, '84.255.133.84', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 19:51:04', '2020-10-21 20:57:13'),
(74, '77.69.211.137', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-21 20:49:24', '2020-10-21 20:49:24'),
(75, '3.138.125.231', 'Chrome (85.0.4183.121)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-10-21 23:02:00', '2020-10-21 23:02:00'),
(76, '51.15.202.195', 'Chrome (74.0.3694.0)', 'Android', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-22 07:35:44', '2020-10-22 07:35:53'),
(77, '10.64.49.25', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-22 07:42:24', '2020-12-11 05:32:17'),
(78, '66.249.79.243', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-22 07:53:40', '2020-10-22 18:04:37'),
(79, '77.69.185.188', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-22 08:45:36', '2020-10-22 11:37:32'),
(80, '52.51.67.45', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-22 08:55:40', '2020-10-22 08:55:40'),
(81, '109.161.170.126', 'Chrome (85.0.4183.127)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-22 09:28:18', '2020-10-22 09:28:18'),
(82, '34.219.35.207', 'Firefox (57.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-10-22 09:38:53', '2020-10-22 09:38:53'),
(83, '54.195.4.177', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-22 09:56:24', '2020-10-22 09:56:24'),
(84, '78.138.117.137', 'Chrome (77.0.3865.120)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Niederkassel', '51149', NULL, '50.88883972168', '7.0570697784424', 0, '2020-10-22 11:18:19', '2020-10-22 11:18:19'),
(85, '87.119.203.39', 'Chrome (70.0.3538.102)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Köln', '50672', NULL, '50.943901062012', '6.9362998008728', 0, '2020-10-22 11:18:28', '2020-10-22 11:18:28'),
(86, '66.249.93.56', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-22 11:24:19', '2020-10-22 11:24:19'),
(87, '66.249.93.58', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-22 11:24:19', '2020-10-22 11:24:20'),
(88, '66.249.93.60', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-10-22 11:24:19', '2020-11-11 10:12:08'),
(89, '66.249.79.247', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-22 11:28:47', '2020-10-22 13:09:52'),
(90, '66.249.79.245', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-22 11:29:41', '2020-10-22 11:29:41'),
(91, '68.183.56.49', 'Chrome (85.0.4182.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-10-22 13:06:45', '2020-10-22 13:06:45'),
(92, '51.15.138.224', 'Chrome (73.0.3683.86)', 'Apple', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-22 13:07:14', '2020-10-22 13:07:15'),
(93, '77.69.130.205', 'Chrome (86.0.4240.75)', 'Windows', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-22 15:39:07', '2020-10-22 20:55:56'),
(94, '109.161.131.185', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-22 15:56:48', '2020-10-22 15:56:55'),
(95, '24.86.180.34', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'CA', 'Canada', 'British Columbia', 'North Vancouver', 'V5K 1A1', NULL, '49.292709350586', '-123.04773712158', 0, '2020-10-22 15:58:49', '2020-10-22 15:58:49'),
(96, '94.76.8.98', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-22 18:19:44', '2020-10-22 18:19:44'),
(97, '77.247.127.140', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'Flevoland', 'Zeewolde', NULL, NULL, '52.299999237061', '5.4499998092651', 0, '2020-10-22 20:27:34', '2020-10-23 17:30:07'),
(98, '199.244.88.132', 'Chrome (35.0.1916.47)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Streamwood', '60107', NULL, '42.020801544189', '-88.181159973145', 0, '2020-10-22 20:38:19', '2021-01-27 18:31:24'),
(99, '73.217.80.163', 'Chrome (85.0.4183.121)', 'Apple', '0', 'Guest', 'US', 'United States', 'Colorado', 'Denver', '80205', NULL, '39.753391265869', '-104.96804046631', 0, '2020-10-22 21:27:30', '2020-10-22 21:27:30'),
(100, '54.234.30.173', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-22 21:27:41', '2020-10-22 21:27:41'),
(101, '207.173.31.180', 'Chrome (85.0.4183.121)', 'Apple', '0', 'Guest', 'US', 'United States', 'Colorado', 'Centennial', '80124', NULL, '39.516971588135', '-104.93578338623', 0, '2020-10-22 21:30:36', '2020-10-22 21:30:37'),
(102, '51.158.64.21', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-23 01:29:46', '2020-10-23 01:29:46'),
(103, '180.163.220.3', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-10-23 05:04:09', '2020-10-23 05:04:09'),
(104, '42.236.10.125', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Binhe', '473000', NULL, '32.98722076416', '112.51306152344', 0, '2020-10-23 05:04:44', '2020-10-23 05:04:49'),
(105, '66.205.156.117', 'Internet Explorer (7.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Rosemont', '95835', NULL, '38.665531158447', '-121.49427032471', 0, '2020-10-23 07:02:19', '2020-10-23 07:02:19'),
(106, '52.114.6.38', 'Mozilla (5.0)', 'Windows', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-10-23 07:34:44', '2020-11-12 07:24:42'),
(107, '77.69.188.95', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-23 07:37:41', '2020-10-23 09:13:52'),
(108, '203.98.96.4', 'Chrome (84.0.4147.135)', 'Windows', '0', 'Guest', 'IN', 'India', 'Odisha', 'Bhubaneshwar', '751001', NULL, '20.296100616455', '85.824501037598', 0, '2020-10-23 08:05:10', '2020-10-23 08:05:10'),
(109, '46.39.224.198', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'RU', 'Russia', 'Moscow', 'Moscow', '117105', NULL, '55.690769195557', '37.619060516357', 0, '2020-10-23 10:05:02', '2020-10-23 10:05:02'),
(110, '103.208.70.155', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'IN', 'India', 'Delhi', 'New Delhi', '110029', NULL, '28.59049987793', '77.203102111816', 0, '2020-10-23 10:31:23', '2020-10-23 10:31:23'),
(111, '103.195.201.25', 'Chrome (85.0.4183.83)', 'Apple', '0', 'Guest', 'IN', 'India', 'Karnataka', 'Bengaluru', '560001', NULL, '12.971599578857', '77.594596862793', 0, '2020-10-23 10:32:35', '2020-10-23 10:32:35'),
(112, '49.44.82.164', 'Chrome (85.0.4183.83)', 'Windows', '0', 'Guest', 'IN', 'India', 'Tamil Nadu', 'Saint Thomas Mount', '600001', NULL, '13.052399635315', '80.250801086426', 0, '2020-10-23 10:55:29', '2020-10-23 10:55:29'),
(113, '34.245.89.138', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-23 15:54:59', '2020-10-23 15:54:59'),
(114, '52.209.40.246', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-23 17:00:42', '2020-10-23 17:00:42'),
(115, '37.131.125.90', 'Chrome (78.0.3904.108)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-23 18:15:33', '2020-10-23 18:15:33'),
(116, '31.13.127.14', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-23 18:15:34', '2020-10-23 18:15:34'),
(117, '173.252.87.119', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-10-23 18:20:24', '2020-10-23 18:20:24'),
(118, '89.148.42.28', 'Chrome (85.0.4183.127)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-23 18:23:19', '2020-10-23 18:23:19'),
(119, '52.186.120.234', 'Chrome (11.0.696.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.713001251221', '-78.158996582031', 0, '2020-10-23 22:27:29', '2020-10-24 03:16:28'),
(120, '54.78.81.67', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-24 02:12:58', '2020-10-24 02:12:58'),
(121, '199.16.157.183', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Georgia', 'Atlanta', '30308', NULL, '33.769119262695', '-84.376449584961', 0, '2020-10-24 08:30:42', '2020-10-24 08:30:42'),
(122, '34.82.38.254', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-10-24 08:30:43', '2020-10-24 08:30:43'),
(123, '35.199.180.205', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-10-24 08:30:43', '2020-10-24 08:30:43'),
(124, '116.179.32.154', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-24 14:18:43', '2020-10-24 14:18:43'),
(125, '116.179.32.158', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-24 14:18:46', '2020-10-24 14:18:46'),
(126, '77.69.183.93', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-24 14:53:48', '2020-10-24 14:53:48'),
(127, '185.165.178.236', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-24 20:12:26', '2020-10-24 20:12:26'),
(128, '138.246.253.15', 'Chrome (40.0.2214.85)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Garching bei München', '85748', NULL, '48.248828887939', '11.651120185852', 0, '2020-10-24 21:11:26', '2020-11-14 03:05:37'),
(129, '167.86.104.186', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2020-10-25 07:09:15', '2020-10-25 07:09:15'),
(130, '46.42.66.83', 'Chrome (86.0.4240.111)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-25 07:40:56', '2020-10-26 17:14:00'),
(131, '157.55.39.200', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-10-25 13:57:34', '2020-10-25 13:57:34'),
(132, '54.174.56.170', 'Chrome (51.0.2704.103)', 'Linux', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-25 18:20:40', '2020-10-25 18:20:40'),
(133, '54.174.53.78', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-25 18:55:43', '2020-10-25 18:55:55'),
(134, '54.174.54.112', 'Chrome (51.0.2704.103)', 'Linux', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-25 18:55:54', '2020-10-25 18:56:03'),
(135, '54.174.58.234', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-25 18:55:57', '2020-10-25 18:55:57'),
(136, '34.222.57.38', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-10-25 18:55:58', '2020-10-25 18:55:58'),
(137, '107.158.86.127', 'Chrome (65.0.3325.162)', 'Apple', '0', 'Guest', 'US', 'United States', 'Arizona', 'Tempe Junction', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2020-10-25 21:16:37', '2020-12-05 19:52:52'),
(138, '111.231.225.71', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-25 22:50:21', '2020-10-25 22:50:30'),
(139, '47.75.219.87', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-10-26 02:34:48', '2020-10-26 02:34:48'),
(140, '114.116.154.110', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-26 02:34:49', '2020-10-26 02:34:49'),
(141, '101.201.37.94', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-10-26 02:34:51', '2020-10-26 02:34:51'),
(142, '47.254.149.215', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2020-10-26 02:34:51', '2020-10-26 02:34:51'),
(143, '111.231.189.99', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-26 03:27:12', '2020-10-26 03:27:12'),
(144, '54.92.191.83', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-10-26 04:52:31', '2020-10-26 04:52:31'),
(145, '88.201.51.215', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-26 07:09:18', '2020-10-26 07:09:18'),
(146, '77.69.210.82', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-26 13:27:01', '2020-10-26 13:36:22'),
(147, '54.78.202.16', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-26 14:38:54', '2020-10-26 14:38:54'),
(148, '77.69.171.72', 'Chrome (86.0.4240.75)', 'Windows', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-26 16:18:29', '2020-10-26 17:07:41'),
(149, '45.95.26.169', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'FR', 'France', 'Nouvelle-Aquitaine', 'Mérignac', '33700', NULL, '44.841770172119', '-0.64780002832413', 0, '2020-10-26 17:34:32', '2020-10-26 17:34:32'),
(150, '162.243.166.30', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-10-26 22:18:37', '2020-10-26 22:18:39'),
(151, '180.101.214.148', 'Chrome (47.0.2526.80)', 'Apple', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Nanjing', '210000', NULL, '32.045829772949', '118.78417205811', 0, '2020-10-27 01:39:58', '2020-11-02 01:40:14'),
(152, '173.252.83.113', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-10-27 04:32:27', '2020-10-27 04:32:27'),
(153, '173.252.83.14', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-10-27 04:32:30', '2020-10-27 04:32:30'),
(154, '51.158.166.126', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-10-27 04:58:56', '2020-10-27 04:58:56'),
(155, '193.27.229.26', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2020-10-27 07:39:39', '2020-11-10 05:52:37'),
(156, '3.15.189.127', 'Chrome (85.0.4183.121)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-10-27 08:03:07', '2020-10-27 08:03:07'),
(157, '173.212.233.72', 'Firefox (70.0)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2020-10-27 08:43:31', '2020-10-27 08:43:31'),
(158, '84.255.148.151', 'Chrome (86.0.4240.80)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-27 08:48:11', '2020-10-27 12:34:59'),
(159, '212.47.228.252', 'Chrome (73.0.3683.86)', 'Apple', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-10-27 10:46:50', '2020-10-27 10:47:14'),
(160, '207.46.13.23', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-10-27 11:24:49', '2020-10-27 11:24:49'),
(161, '200.113.253.121', 'Chrome (86.0.4240.111)', 'Apple', '3', 'Face Key', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-10-27 12:29:54', '2020-10-27 12:32:12'),
(162, '52.16.63.64', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-27 12:39:07', '2020-10-27 12:39:07'),
(163, '192.42.116.17', 'Chrome (36.0.1985.125)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1013', NULL, '52.388008117676', '4.8827300071716', 0, '2020-10-27 13:53:25', '2020-10-27 13:53:25'),
(164, '82.221.131.5', 'Chrome (36.0.1985.125)', 'Windows', '0', 'Guest', 'IS', 'Iceland', 'Capital Region', 'Reykjavík', '101', NULL, '64.142150878906', '-21.943170547485', 0, '2020-10-27 13:54:32', '2020-10-27 13:54:32'),
(165, '54.171.176.180', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-27 16:03:52', '2020-10-27 16:03:52'),
(166, '34.246.199.248', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-10-27 17:13:04', '2020-10-27 17:13:04'),
(167, '220.181.108.120', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100032', NULL, '39.912288665771', '116.36586761475', 0, '2020-10-27 20:11:52', '2020-10-27 20:11:52'),
(168, '118.127.15.84', 'Chrome (35.0.1916.47)', 'Apple', '0', 'Guest', 'AU', 'Australia', 'Queensland', 'Brisbane', '4000', NULL, '-27.467580795288', '153.02789306641', 0, '2020-10-27 21:38:10', '2020-10-27 21:38:10'),
(169, '62.209.14.235', 'Chrome (86.0.4240.93)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-27 22:48:56', '2020-10-27 22:48:56'),
(170, '3.101.43.66', 'Chrome (40.0.2214.93)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-10-27 23:24:19', '2020-12-07 09:46:08'),
(171, '18.144.43.128', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-10-27 23:24:29', '2020-10-27 23:24:43'),
(172, '3.101.58.110', 'Chrome (77.0.3835.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-10-27 23:24:30', '2020-10-27 23:24:30'),
(173, '178.150.47.62', 'Chrome (59.0.3071.115)', 'Apple', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv City', 'Kyiv', '01000', NULL, '50.433330535889', '30.516670227051', 0, '2020-10-28 01:24:49', '2020-10-28 01:24:52'),
(174, '161.97.98.251', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2020-10-28 02:41:45', '2020-10-28 02:41:45'),
(175, '82.194.44.54', 'Chrome (86.0.4240.80)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-28 08:12:32', '2020-10-28 08:12:32'),
(176, '54.213.1.193', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-10-28 10:12:24', '2020-10-28 10:12:24'),
(177, '88.201.58.115', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-28 13:02:22', '2020-10-28 13:02:22'),
(178, '110.227.114.148', 'Chrome (85.0.4183.121)', 'Apple', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Lucknow', '226012', NULL, '26.781499862671', '80.915199279785', 0, '2020-10-28 14:39:58', '2020-10-28 14:39:58'),
(179, '99.82.144.1', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', NULL, NULL, '26.227779388428', '50.584720611572', 0, '2020-10-28 15:26:29', '2020-10-28 15:26:29'),
(180, '77.69.211.93', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-28 18:32:38', '2020-10-28 18:32:38'),
(181, '173.252.107.24', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-10-28 19:56:39', '2020-10-28 19:56:41'),
(182, '51.222.43.147', 'Chrome (45.0.2454.94)', 'Android', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-10-28 19:58:19', '2020-11-28 01:46:33'),
(183, '51.77.246.199', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-28 20:08:04', '2020-10-28 20:08:04'),
(184, '221.229.218.152', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Nanjing', '210000', NULL, '32.045829772949', '118.78417205811', 0, '2020-10-28 20:24:11', '2020-10-28 20:24:12'),
(185, '207.46.13.110', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-10-29 08:00:15', '2020-10-29 08:00:15'),
(186, '165.227.252.43', 'Chrome (72.0.3626.121)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-10-29 13:29:56', '2020-10-29 13:29:56'),
(187, '109.161.166.229', 'Chrome (79.0.3945.136)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-29 15:06:59', '2020-10-29 15:06:59'),
(188, '88.201.118.129', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-29 16:52:43', '2020-10-29 16:53:34'),
(189, '91.219.166.205', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Moscow Oblast', 'Skhodnya', '115280', NULL, '55.708980560303', '37.646751403809', 0, '2020-10-29 21:33:58', '2020-10-29 21:35:25'),
(190, '66.249.74.20', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-29 21:43:04', '2020-10-30 10:20:35'),
(191, '167.114.226.133', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Grand Est', 'Strasbourg', '67000', NULL, '48.582931518555', '7.7437500953674', 0, '2020-10-29 23:44:30', '2021-01-11 08:25:18'),
(192, '91.76.245.91', 'Chrome (68.0.3440.84)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Moscow', 'Moscow', '123001', NULL, '55.762760162354', '37.593360900879', 0, '2020-10-29 23:53:45', '2020-10-29 23:53:50'),
(193, '139.155.2.190', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-30 00:14:15', '2020-10-30 00:14:41'),
(194, '180.101.214.20', 'Chrome (47.0.2526.80)', 'Apple', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Nanjing', '210000', NULL, '32.045829772949', '118.78417205811', 0, '2020-10-30 01:42:56', '2020-10-30 01:42:56'),
(195, '84.255.151.62', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-10-30 15:31:07', '2020-10-30 15:31:07'),
(196, '39.51.6.144', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'PK', 'Pakistan', 'Sindh', 'Karachi', '74000', NULL, '24.882999420166', '67.057998657227', 0, '2020-10-30 15:32:33', '2020-10-30 15:32:33'),
(197, '200.113.253.80', 'Chrome (86.0.4240.111)', 'Apple', '3', 'Face Key', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-10-30 15:52:49', '2020-10-30 15:52:49'),
(198, '66.249.74.24', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-10-30 16:05:39', '2020-10-30 16:05:39'),
(199, '185.200.117.169', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-10-30 16:07:09', '2020-10-30 16:07:10'),
(200, '116.179.32.178', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-10-30 20:12:04', '2020-10-30 20:12:04'),
(201, '96.77.43.233', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Florida', 'Oakland Park', '33317', NULL, '26.110870361328', '-80.227317810059', 0, '2020-10-30 20:51:58', '2020-10-30 20:51:58'),
(202, '202.57.37.197', 'Opera (3.0)', 'Windows', '0', 'Guest', 'PH', 'Philippines', 'Metro Manila', 'Manila', '0900', NULL, '14.595560073853', '120.98082733154', 0, '2020-10-30 20:55:41', '2020-10-30 20:55:41'),
(203, '54.174.53.233', 'Chrome (51.0.2704.103)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-30 23:38:53', '2020-10-30 23:38:53'),
(204, '13.66.139.0', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-31 03:47:49', '2020-11-12 13:27:56'),
(205, '3.129.250.17', 'Chrome (85.0.4183.102)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-31 13:00:47', '2020-10-31 13:00:49'),
(206, '18.184.195.200', 'Chrome (41.0.2272.89)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-10-31 20:15:19', '2020-12-15 22:33:13'),
(207, '180.101.214.147', 'Chrome (47.0.2526.80)', 'Apple', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Nanjing', '210000', NULL, '32.045829772949', '118.78417205811', 0, '2020-11-01 01:29:08', '2020-11-01 01:29:08'),
(208, '34.243.185.15', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-01 02:33:42', '2020-11-01 02:33:42'),
(209, '52.152.232.117', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.713001251221', '-78.158996582031', 0, '2020-11-01 02:38:52', '2020-11-01 03:08:14'),
(210, '104.131.187.71', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-11-01 03:17:41', '2020-11-01 03:17:41'),
(211, '44.229.15.192', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-01 06:29:57', '2020-11-01 06:29:57'),
(212, '77.69.223.204', 'Chrome (86.0.4240.111)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-01 07:34:49', '2020-11-01 12:36:33'),
(213, '89.148.37.172', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-01 08:32:09', '2020-11-01 08:39:29'),
(214, '37.131.122.18', 'Chrome (86.0.4240.111)', 'Apple', '5', 'name1 name2', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-01 08:37:33', '2020-11-02 12:58:57'),
(215, '3.138.116.132', 'Chrome (85.0.4183.121)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-11-01 12:52:56', '2020-11-01 12:52:56'),
(216, '38.122.112.147', 'Chrome (35.0.1916.47)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60605', NULL, '41.873779296875', '-87.624252319336', 0, '2020-11-01 13:46:58', '2020-11-01 13:46:58'),
(217, '77.69.205.139', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-01 17:17:25', '2020-11-01 18:18:54'),
(218, '88.201.15.4', 'Chrome (84.0.4147.135)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-01 17:17:52', '2020-11-01 17:17:52'),
(219, '34.74.53.156', 'Chrome (80.0.3987.132)', 'Windows', '0', 'Guest', 'US', 'United States', 'South Carolina', 'North Charleston', '29418', NULL, '32.890079498291', '-80.058937072754', 0, '2020-11-01 17:38:27', '2020-11-01 17:38:27'),
(220, '103.66.79.52', 'Chrome (86.0.4240.111)', 'Windows', '5', 'name1 name2', 'IN', 'India', 'Kerala', 'Ottappālam', '679101', NULL, '10.770400047302', '76.377098083496', 0, '2020-11-01 17:38:36', '2020-11-01 18:04:35'),
(221, '35.229.106.203', 'Chrome (80.0.3987.132)', 'Windows', '0', 'Guest', 'US', 'United States', 'South Carolina', 'North Charleston', '29418', NULL, '32.890079498291', '-80.058937072754', 0, '2020-11-01 17:38:38', '2020-11-01 17:38:38'),
(222, '39.53.207.253', 'Chrome (86.0.4240.111)', 'Windows', '5', 'name1 name2', 'PK', 'Pakistan', 'Sindh', 'Karachi', '74000', NULL, '24.882999420166', '67.057998657227', 0, '2020-11-01 17:39:47', '2020-11-01 17:48:31'),
(223, '37.111.221.129', 'Chrome (86.0.4240.111)', 'Windows', '8', 'Aarfat Islam', 'BD', 'Bangladesh', 'Dhaka', 'Paltan', '1000', NULL, '23.810300827026', '90.412498474121', 0, '2020-11-01 18:19:54', '2020-11-01 18:23:47'),
(224, '111.119.187.1', 'Chrome (85.0.4183.101)', 'Android', '0', 'Guest', 'PK', 'Pakistan', 'Sindh', 'Karachi', '74000', NULL, '24.882999420166', '67.057998657227', 0, '2020-11-01 19:43:25', '2020-11-01 19:43:25'),
(225, '41.79.219.203', 'Chrome (83.0.4103.61)', 'Linux', '5', 'name1 name2', 'BJ', 'Benin', 'Littoral', 'Cotonou', NULL, NULL, '6.3519401550293', '2.460000038147', 0, '2020-11-01 21:54:31', '2020-11-01 21:55:56'),
(226, '35.189.199.205', 'Firefox (52.0)', 'Apple', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2020-11-02 00:08:30', '2020-11-02 00:08:30'),
(227, '62.210.111.42', 'Firefox (59.0.2)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-02 01:31:37', '2021-01-24 13:03:44'),
(228, '14.167.1.72', 'Chrome (86.0.4240.111)', 'Windows', '0', 'Guest', 'VN', 'Vietnam', 'Hanoi', 'Hanoi', '100000', NULL, '21.021999359131', '105.83999633789', 0, '2020-11-02 02:42:13', '2020-11-02 04:20:18'),
(229, '27.34.31.163', 'Chrome (86.0.4240.111)', 'Apple', '5', 'name1 name2', 'NP', 'Nepal', 'Province 3', 'Kathmandu', '44600', NULL, '27.700000762939', '85.333297729492', 0, '2020-11-02 05:59:16', '2020-11-02 05:59:34'),
(230, '34.83.170.101', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-02 06:29:32', '2021-02-04 13:58:34'),
(231, '77.69.189.155', 'Chrome (86.0.4240.111)', 'Apple', '5', 'name1 name2', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-02 07:33:17', '2020-11-02 12:01:07'),
(232, '18.203.244.182', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-02 08:59:59', '2020-11-02 08:59:59'),
(233, '66.56.81.213', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'US', 'United States', 'Nevada', 'Paradise', '89147', NULL, '36.112079620361', '-115.27905273438', 0, '2020-11-02 09:55:30', '2020-11-02 09:55:30'),
(234, '54.229.227.225', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-02 11:32:19', '2020-11-02 11:32:19');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(235, '109.161.160.227', 'Chrome (86.0.4240.110)', 'Android', '5', 'name1 name2', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-02 12:37:12', '2020-11-02 12:37:29'),
(236, '116.179.32.221', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-03 01:24:25', '2020-11-03 01:24:25'),
(237, '188.247.72.116', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'JO', 'Jordan', 'Amman', 'Amman', '11000', NULL, '31.963329315186', '35.930000305176', 0, '2020-11-03 04:23:33', '2020-11-03 04:23:33'),
(238, '34.82.192.151', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-03 07:25:07', '2021-02-08 13:52:46'),
(239, '77.69.206.148', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-03 08:38:44', '2020-11-03 08:38:44'),
(240, '31.13.103.12', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-03 11:40:41', '2020-11-03 11:40:41'),
(241, '193.188.121.188', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-03 11:40:41', '2020-11-03 11:40:41'),
(242, '86.120.82.56', 'Opera (52.0.2871.27)', 'Apple', '0', 'Guest', 'RO', 'Romania', 'Bucureşti', 'Bucharest', '010011', NULL, '44.436550140381', '26.099349975586', 0, '2020-11-03 18:23:02', '2020-11-03 18:23:02'),
(243, '34.83.151.140', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-04 00:47:05', '2021-01-30 14:27:23'),
(244, '119.29.111.220', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-04 08:37:31', '2020-11-04 08:41:40'),
(245, '66.249.79.46', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-11-04 13:56:03', '2020-11-04 13:56:03'),
(246, '37.131.101.253', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-04 15:22:15', '2020-11-04 20:01:39'),
(247, '138.197.202.197', 'Firefox (33.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-11-04 15:22:15', '2020-11-14 21:07:39'),
(248, '159.203.42.143', 'Firefox (33.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-11-04 19:32:21', '2020-11-04 19:32:21'),
(249, '77.69.221.107', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-04 19:59:39', '2020-11-04 19:59:39'),
(250, '139.162.116.133', 'unknown (unknown)', 'unknown', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Tokyo', '162-0843', NULL, '35.696281433105', '139.7385559082', 0, '2020-11-04 21:33:20', '2021-02-06 23:34:33'),
(251, '162.142.125.36', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-04 23:40:33', '2020-11-04 23:40:33'),
(252, '209.17.97.74', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Florida', 'Flagami', '33144', NULL, '25.762859344482', '-80.311958312988', 0, '2020-11-05 00:47:35', '2020-11-05 00:47:35'),
(253, '209.17.96.2', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-11-05 01:05:30', '2020-11-05 01:05:30'),
(254, '216.218.206.69', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-05 02:32:42', '2021-01-29 04:08:43'),
(255, '150.109.183.239', 'Chrome (83.0.4103.116)', 'Linux', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-05 04:46:09', '2020-11-05 04:46:09'),
(256, '162.142.125.51', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-05 06:41:52', '2020-11-05 06:41:52'),
(257, '162.243.128.131', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-05 06:54:05', '2020-11-05 06:54:05'),
(258, '35.194.212.41', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'TW', 'Taiwan', 'Taiwan', 'Taipei', '100', NULL, '25.042139053345', '121.51986694336', 0, '2020-11-05 07:10:13', '2020-12-25 18:15:47'),
(259, '80.82.68.68', 'Chrome (72.0.3626.121)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-05 07:40:27', '2020-11-05 07:40:28'),
(260, '77.69.239.70', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-05 08:02:12', '2020-11-05 10:47:14'),
(261, '74.120.14.35', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-05 08:36:07', '2020-11-08 08:02:16'),
(262, '91.241.19.84', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '197375', NULL, '59.939041137695', '30.315790176392', 0, '2020-11-05 09:30:11', '2020-12-18 22:57:59'),
(263, '193.118.53.138', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2020-11-05 09:53:02', '2021-02-01 22:15:05'),
(264, '66.249.79.42', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-11-05 10:20:43', '2020-11-05 10:20:43'),
(265, '77.69.235.20', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-05 11:02:41', '2020-11-05 12:29:52'),
(266, '54.78.181.239', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-05 11:12:37', '2020-11-05 11:12:37'),
(267, '159.203.81.93', 'Firefox (33.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-11-05 12:29:52', '2020-12-15 05:43:19'),
(268, '54.37.85.26', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-11-05 12:54:41', '2020-11-05 13:07:41'),
(269, '83.97.20.29', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RO', 'Romania', 'Bucureşti', 'Bucharest', '020331', NULL, '44.477481842041', '26.114009857178', 0, '2020-11-05 15:44:26', '2021-02-09 10:56:44'),
(270, '143.110.158.193', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-05 15:53:33', '2020-11-05 15:53:33'),
(271, '162.142.125.34', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-05 16:31:02', '2020-11-05 16:31:03'),
(272, '128.14.133.58', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-05 16:59:41', '2021-02-07 02:02:57'),
(273, '193.118.53.202', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2020-11-05 22:21:49', '2021-02-11 01:38:41'),
(274, '157.230.93.95', 'Internet Explorer (9.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-11-05 23:15:57', '2020-11-05 23:15:57'),
(275, '216.218.206.68', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-06 00:24:57', '2021-02-02 05:20:14'),
(276, '74.120.14.52', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-06 00:54:10', '2020-11-06 00:54:12'),
(277, '95.123.41.94', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'ES', 'Spain', 'Madrid', 'Madrid', '28001', NULL, '40.426181793213', '-3.6851398944855', 0, '2020-11-06 01:32:37', '2021-02-10 11:56:12'),
(278, '196.52.43.53', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-06 02:03:12', '2021-01-15 14:40:05'),
(279, '92.118.161.17', 'unknown (unknown)', 'unknown', '0', 'Guest', 'GR', 'Greece', 'Attica', 'Athens', '114 76', NULL, '37.969989776611', '23.719989776611', 0, '2020-11-06 02:30:27', '2020-11-06 02:30:27'),
(280, '23.92.36.3', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20148', NULL, '39.001491546631', '-77.515586853027', 0, '2020-11-06 05:43:16', '2020-11-06 05:43:16'),
(281, '167.248.133.52', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-06 06:34:32', '2020-11-07 21:45:22'),
(282, '193.118.53.210', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2020-11-06 09:05:17', '2021-02-06 12:27:50'),
(283, '167.248.133.36', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-06 11:19:13', '2020-11-06 11:19:15'),
(284, '192.241.225.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-11-06 14:58:53', '2020-11-06 14:58:53'),
(285, '162.247.74.213', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Connecticut', 'Mansfield City', '06232', NULL, '41.731918334961', '-72.373878479004', 0, '2020-11-06 19:11:46', '2020-11-06 19:11:46'),
(286, '34.107.37.155', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2020-11-06 22:00:50', '2020-11-07 05:56:41'),
(287, '164.52.24.162', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-11-07 03:23:20', '2021-02-07 00:43:24'),
(288, '184.105.247.252', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-07 05:40:57', '2021-02-10 06:43:01'),
(289, '77.69.151.104', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-07 08:06:42', '2020-11-07 08:18:22'),
(290, '77.69.187.153', 'Chrome (86.0.4240.111)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-07 09:19:15', '2020-11-07 09:19:47'),
(291, '46.42.64.197', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-07 10:34:54', '2020-11-07 10:34:54'),
(292, '193.118.53.194', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2020-11-07 12:06:22', '2021-02-02 04:02:12'),
(293, '191.96.248.138', 'Chrome (66.0.3359.170)', 'Apple', '0', 'Guest', 'BR', 'Brazil', 'São Paulo', 'São Paulo', '01001-000', NULL, '-23.551519393921', '-46.633140563965', 0, '2020-11-07 13:37:42', '2020-11-07 13:37:42'),
(294, '89.108.88.240', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Moscow', 'Moscow', '125476', NULL, '55.840549468994', '37.405330657959', 0, '2020-11-07 14:51:02', '2020-11-07 14:51:03'),
(295, '37.131.55.248', 'Chrome (86.0.4240.183)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-07 16:32:25', '2020-11-07 19:22:48'),
(296, '66.249.70.95', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-11-07 18:01:32', '2021-02-04 22:27:13'),
(297, '192.241.234.202', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-07 18:45:05', '2020-11-22 13:03:25'),
(298, '34.210.40.122', 'Chrome (76.0.3809.100)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-07 18:57:02', '2020-11-07 18:57:03'),
(299, '213.32.122.82', 'Chrome (41.0.2228.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Courbevoie', '92400', NULL, '48.896831512451', '2.2565100193024', 0, '2020-11-07 21:31:10', '2021-02-06 17:51:40'),
(300, '198.12.123.132', 'Chrome (66.0.3359.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Georgia', 'Atlanta', '30303', NULL, '33.752880096436', '-84.392433166504', 0, '2020-11-07 23:41:34', '2020-11-07 23:41:37'),
(301, '202.47.43.208', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'PK', 'Pakistan', 'Punjab', 'Rawalpindi', '46000', NULL, '33.61888885498', '73.056938171387', 0, '2020-11-08 06:01:29', '2021-01-28 06:40:55'),
(302, '128.14.134.134', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-08 08:24:28', '2021-02-10 21:42:55'),
(303, '139.162.113.204', 'unknown (unknown)', 'unknown', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Tokyo', '162-0843', NULL, '35.696281433105', '139.7385559082', 0, '2020-11-08 09:12:57', '2021-02-10 12:32:27'),
(304, '68.183.235.33', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-08 12:47:38', '2020-11-08 12:47:43'),
(305, '37.131.116.229', 'Chrome (86.0.4240.193)', 'Apple', '5', 'name1 name2', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-08 13:33:16', '2020-11-12 14:08:29'),
(306, '34.82.103.126', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-08 16:07:01', '2020-12-30 08:11:01'),
(307, '153.36.134.140', 'Safari (11.1.1)', 'Apple', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Nanjing', '210000', NULL, '32.045829772949', '118.78417205811', 0, '2020-11-08 17:11:43', '2020-11-08 17:11:43'),
(308, '66.249.66.135', 'Chrome (88.0.4324.113)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-08 19:24:09', '2021-01-31 03:17:40'),
(309, '91.134.27.252', 'Chrome (65.0.3325.181)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Islington', 'EC3R', NULL, '51.533298492432', '-0.10000000149012', 0, '2020-11-08 22:18:02', '2020-12-30 08:08:15'),
(310, '192.241.231.35', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-08 22:37:15', '2020-11-08 22:37:15'),
(311, '207.244.70.35', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Shaw', '20026', NULL, '38.906898498535', '-77.028396606445', 0, '2020-11-09 00:12:11', '2020-11-09 00:12:11'),
(312, '3.249.96.198', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-09 02:37:20', '2020-11-09 02:37:20'),
(313, '74.120.14.36', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-09 03:24:26', '2020-11-09 03:24:26'),
(314, '74.82.47.5', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-09 04:41:33', '2021-02-08 05:22:24'),
(315, '167.248.133.51', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-09 07:21:59', '2020-11-09 07:22:01'),
(316, '37.131.50.166', 'Chrome (86.0.4240.183)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-09 10:19:21', '2020-11-09 10:19:21'),
(317, '185.142.236.40', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-09 11:00:41', '2020-12-18 04:52:37'),
(318, '88.201.58.39', 'Chrome (86.0.4240.99)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-09 11:14:17', '2020-11-09 11:15:31'),
(319, '34.245.83.7', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-09 11:22:19', '2020-11-09 11:22:19'),
(320, '77.69.162.182', 'Chrome (86.0.4240.111)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-09 11:28:54', '2020-11-09 11:28:54'),
(321, '205.169.39.8', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Santa Clara', '95054', NULL, '37.396308898926', '-121.96140289307', 0, '2020-11-09 11:43:40', '2021-02-07 10:54:55'),
(322, '205.169.39.51', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Santa Clara', '95054', NULL, '37.396308898926', '-121.96140289307', 0, '2020-11-09 11:46:48', '2020-11-09 11:46:48'),
(323, '107.175.158.92', 'Chrome (66.0.3359.139)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-11-09 14:29:21', '2020-12-15 11:22:38'),
(324, '72.13.62.27', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Bern', 'Bern', '3000', NULL, '46.948020935059', '7.4482097625732', 0, '2020-11-09 15:35:02', '2020-11-09 15:35:02'),
(325, '23.129.64.191', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-11-09 16:54:13', '2020-11-09 16:54:13'),
(326, '84.255.161.95', 'Chrome (86.0.4240.183)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-09 17:03:33', '2020-11-09 17:03:33'),
(327, '178.211.40.96', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'TR', 'Turkey', 'Istanbul', 'Istanbul', '34010', NULL, '41.013889312744', '28.960279464722', 0, '2020-11-09 18:43:09', '2020-11-09 18:43:09'),
(328, '32.210.124.11', 'Chrome (86.0.4240.183)', 'Windows', '0', 'Guest', 'US', 'United States', 'Connecticut', 'Hartford', '06105', NULL, '41.772548675537', '-72.694389343262', 0, '2020-11-09 18:51:10', '2020-11-09 18:51:10'),
(329, '116.232.112.31', 'Firefox (16.0)', 'Windows', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-11-09 20:17:55', '2020-11-09 20:17:59'),
(330, '96.127.158.234', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2020-11-09 20:59:03', '2020-11-09 20:59:03'),
(331, '192.241.210.65', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-09 22:41:21', '2020-11-09 22:41:21'),
(332, '45.146.164.159', 'Chrome (74.0.3729.169)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2020-11-10 01:44:08', '2020-11-10 01:44:08'),
(333, '192.3.188.204', 'Chrome (66.0.3359.170)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2020-11-10 03:58:42', '2020-11-10 03:58:42'),
(334, '31.171.152.134', 'Chrome (67.0.3396.87)', 'Windows', '0', 'Guest', 'AL', 'Albania', 'Tirana', 'Tirana', NULL, NULL, '41.329990386963', '19.829990386963', 0, '2020-11-10 04:00:42', '2020-11-10 04:00:42'),
(335, '184.105.139.69', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-10 05:00:33', '2021-01-23 04:43:09'),
(336, '71.6.232.7', 'Chrome (74.0.3729.131)', 'Windows', '0', 'Guest', 'US', 'United States', 'Nevada', 'Whitney', '89012', NULL, '36.008491516113', '-115.03997802734', 0, '2020-11-10 05:12:48', '2021-02-08 22:26:37'),
(337, '192.35.168.16', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-10 08:30:28', '2021-01-26 17:26:17'),
(338, '77.69.245.192', 'Chrome (86.0.4240.183)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-10 08:46:36', '2020-11-10 12:23:01'),
(339, '129.226.49.27', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-10 11:15:47', '2020-12-06 17:19:48'),
(340, '162.142.125.50', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-10 11:38:54', '2020-11-10 16:02:50'),
(341, '35.199.166.100', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-10 11:53:22', '2021-02-06 20:00:58'),
(342, '62.209.14.68', 'Chrome (86.0.4240.185)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-10 13:00:22', '2020-11-10 13:00:22'),
(343, '62.4.14.206', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-10 14:08:59', '2020-11-10 14:08:59'),
(344, '3.88.155.85', 'Firefox (47.3)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-10 14:29:37', '2020-11-10 14:29:37'),
(345, '77.69.172.169', 'Chrome (86.0.4240.193)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-10 17:25:21', '2020-11-10 17:25:21'),
(346, '162.142.125.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-10 21:15:18', '2021-02-01 12:08:41'),
(347, '77.69.241.222', 'Chrome (86.0.4240.185)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-10 21:59:51', '2020-11-11 18:47:09'),
(348, '192.241.220.31', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-11-10 22:43:19', '2020-11-10 22:43:19'),
(349, '92.118.161.61', 'unknown (unknown)', 'unknown', '0', 'Guest', 'GR', 'Greece', 'Attica', 'Athens', '114 76', NULL, '37.969989776611', '23.719989776611', 0, '2020-11-11 00:03:51', '2020-11-11 00:03:51'),
(350, '185.239.242.45', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Brabant', 'Eindhoven', '5611', NULL, '51.436489105225', '5.4814100265503', 0, '2020-11-11 01:02:31', '2020-11-11 01:02:31'),
(351, '167.160.76.68', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Nebraska', 'Lincoln', '68508', NULL, '40.817951202393', '-96.709030151367', 0, '2020-11-11 02:28:46', '2020-11-11 02:28:46'),
(352, '199.250.188.4', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Nebraska', 'Lincoln', '68508', NULL, '40.817951202393', '-96.709030151367', 0, '2020-11-11 02:29:07', '2020-11-11 02:29:12'),
(353, '5.9.158.195', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '10243', NULL, '52.514701843262', '13.438599586487', 0, '2020-11-11 03:17:13', '2020-11-11 03:17:13'),
(354, '118.24.106.33', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-11 03:35:34', '2020-11-11 03:38:25'),
(355, '184.105.247.196', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-11 03:39:36', '2021-02-06 07:05:49'),
(356, '137.74.80.246', 'Firefox (59.0.2)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Islington', 'EC3R', NULL, '51.533298492432', '-0.10000000149012', 0, '2020-11-11 05:56:48', '2021-01-08 23:30:59'),
(357, '167.248.133.37', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-11 06:26:58', '2021-02-10 20:49:00'),
(358, '45.15.143.172', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Delaware', 'Wilmington', '19707', NULL, '39.786598205566', '-75.685020446777', 0, '2020-11-11 06:31:47', '2020-11-28 17:05:08'),
(359, '45.15.143.171', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Delaware', 'Wilmington', '19707', NULL, '39.786598205566', '-75.685020446777', 0, '2020-11-11 06:34:49', '2020-11-11 06:34:49'),
(360, '37.120.205.171', 'Chrome (86.0.4240.183)', 'Apple', '5', 'name1 name2', 'CA', 'Canada', 'Quebec', 'Québec', 'G1R 5M1', NULL, '46.814300537109', '-71.208183288574', 0, '2020-11-11 08:01:59', '2020-11-11 08:07:11'),
(361, '64.71.249.69', 'Chrome (29.0.1547.66)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2020-11-11 08:06:54', '2020-11-11 08:06:54'),
(362, '104.160.14.135', 'Chrome (67.0.3396.10)', 'Apple', '0', 'Guest', 'DK', 'Denmark', NULL, NULL, NULL, NULL, '56', '10', 0, '2020-11-11 08:12:47', '2020-11-11 08:12:52'),
(363, '88.201.15.7', 'Chrome (84.0.4147.135)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-11 08:43:21', '2020-11-11 08:43:21'),
(364, '102.165.30.29', 'unknown (unknown)', 'unknown', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.867141723633', '151.20710754395', 0, '2020-11-11 08:48:24', '2020-11-11 08:48:24'),
(365, '23.23.236.37', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-11 09:02:02', '2020-11-11 09:03:44'),
(366, '66.249.93.102', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:11:09', '2021-02-09 13:32:55'),
(367, '66.249.93.76', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:11:09', '2020-11-11 10:11:09'),
(368, '66.249.93.62', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:11:09', '2020-11-11 10:11:09'),
(369, '66.249.93.78', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:11:10', '2020-11-11 10:11:10'),
(370, '66.249.93.99', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:12:08', '2021-02-09 13:32:55'),
(371, '34.241.171.101', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-11 10:25:51', '2020-11-11 13:21:42'),
(372, '66.249.93.105', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 10:26:39', '2021-02-09 13:32:56'),
(373, '104.168.51.129', 'Opera (52.0.2871.99)', 'Apple', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75247', NULL, '32.819320678711', '-96.877471923828', 0, '2020-11-11 11:47:40', '2020-11-11 11:47:43'),
(374, '45.83.67.97', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2020-11-11 12:55:19', '2020-11-11 12:55:19'),
(375, '52.114.14.102', 'Mozilla (5.0)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-11 14:35:02', '2021-02-02 13:21:10'),
(376, '47.9.138.135', 'Chrome (88.0.4315.5)', 'Windows', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Lucknow', '227132', NULL, '26.287139892578', '81.797782897949', 0, '2020-11-11 14:44:13', '2020-11-12 05:38:14'),
(377, '171.76.181.135', 'Chrome (86.0.4240.110)', 'Android', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Sultānpur', '228125', NULL, '26.355939865112', '82.093818664551', 0, '2020-11-11 15:18:54', '2020-11-11 15:18:54'),
(378, '167.248.133.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-11 16:00:18', '2020-12-23 13:09:01'),
(379, '64.64.104.10', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'Virginia', 'Highland Springs', '23232', NULL, '37.543998718262', '-77.450698852539', 0, '2020-11-11 16:19:03', '2020-11-11 16:19:03'),
(380, '80.194.140.22', 'unknown (unknown)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Preston', 'PR1', NULL, '53.683330535889', '-2.6966700553894', 0, '2020-11-11 19:36:30', '2020-11-11 19:36:30'),
(381, '109.161.131.90', 'iPhone (12.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-11 19:43:40', '2020-11-11 19:43:40'),
(382, '84.65.132.166', 'Firefox (82.0)', 'Android', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Manchester', 'M1', NULL, '53.442218780518', '-2.2408299446106', 0, '2020-11-11 19:52:32', '2020-11-11 19:52:32'),
(383, '3.237.197.226', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-11 22:32:08', '2020-11-11 22:32:08'),
(384, '185.163.109.66', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'RO', 'Romania', 'Bucureşti', 'Bucharest', '020331', NULL, '44.477481842041', '26.114009857178', 0, '2020-11-11 23:03:01', '2020-12-20 02:01:09'),
(385, '66.249.69.205', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-11 23:29:21', '2020-11-11 23:29:21'),
(386, '3.85.13.43', 'Firefox (47.3)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-11 23:39:40', '2020-11-11 23:39:40'),
(387, '192.241.235.74', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-12 00:34:15', '2020-12-13 07:34:11'),
(388, '109.70.100.51', 'unknown (unknown)', 'unknown', '0', 'Guest', 'AT', 'Austria', 'Vienna', 'Vienna', '1040', NULL, '48.19633102417', '16.367790222168', 0, '2020-11-12 01:58:03', '2020-11-12 01:58:03'),
(389, '212.83.146.233', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-12 02:58:44', '2020-11-12 02:58:44'),
(390, '54.38.81.231', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-12 04:07:32', '2021-01-08 08:30:30'),
(391, '171.76.201.22', 'Chrome (88.0.4315.5)', 'Windows', '5', 'name1 name2', 'IN', 'India', 'Uttar Pradesh', 'Sultānpur', '228161', NULL, '26.347560882568', '81.995750427246', 0, '2020-11-12 05:55:20', '2020-11-12 06:16:44'),
(392, '51.222.43.158', 'Chrome (45.0.2454.94)', 'Android', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-11-12 06:58:03', '2020-12-31 15:33:33'),
(393, '51.77.246.68', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-12 06:58:48', '2020-11-12 06:58:48'),
(394, '171.76.205.221', 'Chrome (88.0.4315.5)', 'Windows', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Sultānpur', '228155', NULL, '26.345100402832', '81.97802734375', 0, '2020-11-12 07:08:52', '2020-11-12 17:46:15'),
(395, '49.36.150.15', 'Chrome (86.0.4240.193)', 'Apple', '9', 'Arsh Uddin', 'IN', 'India', 'Jammu and Kashmir', 'Jammu', '180005', NULL, '32.747299194336', '74.847801208496', 0, '2020-11-12 07:24:44', '2020-11-12 07:49:12'),
(396, '61.95.220.38', 'Chrome (88.0.4324.96)', 'Apple', '3', 'Face Key', 'IN', 'India', 'Uttar Pradesh', 'Noida', '110001', NULL, '28.618200302124', '77.223297119141', 0, '2020-11-12 07:28:11', '2021-02-04 08:31:26'),
(397, '128.14.134.170', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-12 07:38:07', '2021-02-11 06:55:15'),
(398, '178.128.16.62', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-12 08:12:53', '2020-11-16 17:00:10'),
(399, '35.233.145.124', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-12 09:16:52', '2021-02-07 21:03:58'),
(400, '77.69.228.200', 'Chrome (86.0.4240.183)', 'Apple', '3', 'Face Key', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-12 09:29:27', '2020-11-12 13:44:33'),
(401, '62.209.30.4', 'Chrome (84.0.4147.135)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-12 09:29:31', '2020-11-12 09:29:31'),
(402, '3.249.5.46', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-12 10:12:50', '2020-11-12 10:12:50'),
(403, '47.8.14.4', 'Chrome (88.0.4315.5)', 'Windows', '5', 'name1 name2', 'IN', 'India', 'Uttar Pradesh', 'Sadipur', '227813', NULL, '26.43231010437', '81.759559631348', 0, '2020-11-12 10:31:32', '2020-11-12 12:22:48'),
(404, '23.236.203.119', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-11-12 11:11:31', '2020-11-12 11:11:44'),
(405, '209.251.20.46', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Nebraska', 'Lincoln', '68508', NULL, '40.817951202393', '-96.709030151367', 0, '2020-11-12 11:11:35', '2020-11-12 11:11:35'),
(406, '199.21.113.254', 'Chrome (66.0.3359.139)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Elk Grove Village', '60007', NULL, '42.011871337891', '-87.994956970215', 0, '2020-11-12 12:16:10', '2020-11-12 12:16:13'),
(407, '89.187.168.163', 'Chrome (67.0.3396.99)', 'Windows', '0', 'Guest', 'AT', 'Austria', 'Vienna', 'Vienna', '1000', NULL, '48.208610534668', '16.374170303345', 0, '2020-11-12 13:20:30', '2020-11-12 13:20:34'),
(408, '69.50.248.219', 'Chrome (80.0.3987.122)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-11-12 13:40:46', '2020-11-12 13:40:46'),
(409, '109.161.166.37', 'Chrome (86.0.4240.185)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-12 14:04:36', '2020-11-12 14:47:52'),
(410, '54.80.248.225', 'Firefox (47.3)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-12 14:16:45', '2020-11-12 14:16:45'),
(411, '84.255.149.124', 'Chrome (86.0.4240.185)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-12 15:10:44', '2020-11-12 18:25:19'),
(412, '217.182.255.184', 'Chrome (67.0.3396.79)', 'Apple', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.169860839844', '24.93837928772', 0, '2020-11-12 15:48:59', '2020-11-12 15:49:01'),
(413, '2409:4065:101:ebd7:63ac:d6ff:ee93:edd0', 'Chrome (38.0.1025.166)', 'Android', '0', 'Guest', 'IN', 'India', 'Assam', 'Guwahati', NULL, NULL, '26.147100448608', '91.73560333252', 0, '2020-11-12 15:58:09', '2020-11-12 15:58:09'),
(414, '52.76.210.67', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-12 16:19:58', '2020-11-12 16:19:58'),
(415, '84.255.135.106', 'Chrome (86.0.4240.193)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-12 19:53:51', '2020-11-13 14:43:01'),
(416, '74.120.14.38', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-12 22:31:47', '2021-01-27 02:53:00'),
(417, '23.129.64.196', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-11-12 23:12:11', '2020-11-14 21:02:44'),
(418, '162.243.128.4', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-13 00:42:50', '2020-11-13 00:42:50'),
(419, '74.82.47.4', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-13 02:50:25', '2021-01-11 16:27:34'),
(420, '85.203.44.47', 'Firefox (82.0)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-13 04:46:40', '2020-11-13 04:46:40'),
(421, '34.105.32.170', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-13 10:24:14', '2021-02-09 11:31:59'),
(422, '178.86.175.206', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'SA', 'Saudi Arabia', 'Ar Riyāḑ', 'Riyadh', '11142', NULL, '24.687730789185', '46.721851348877', 0, '2020-11-13 12:57:25', '2020-11-13 12:57:25'),
(423, '3.216.31.110', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-13 14:58:07', '2020-11-13 14:58:07'),
(424, '185.142.236.43', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-13 17:49:14', '2021-01-31 16:18:16'),
(425, '192.255.101.32', 'Chrome (77.0.3865.120)', 'Windows', '0', 'Guest', 'US', 'United States', 'South Carolina', 'Charleston', '29401', NULL, '32.777599334717', '-79.941917419434', 0, '2020-11-13 17:52:42', '2020-11-13 17:52:42'),
(426, '157.245.73.221', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Springfield', '97402', NULL, '44.028099060059', '-123.24848175049', 0, '2020-11-13 18:47:33', '2020-11-13 18:47:33'),
(427, '196.52.43.66', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-13 18:58:59', '2020-11-13 18:58:59'),
(428, '100.26.1.242', 'Chrome (70.0.3538.77)', 'Linux', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-13 19:01:39', '2020-11-13 19:01:39'),
(429, '109.69.66.99', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bremen', 'Bremen', '28197', NULL, '53.083999633789', '8.7659997940063', 0, '2020-11-13 19:02:30', '2020-11-13 19:03:01'),
(430, '52.24.251.232', 'Chrome (60.0.3112.107)', 'Android', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-13 20:22:47', '2020-11-13 20:22:47'),
(431, '103.149.192.96', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3519999980927', '103.82499694824', 0, '2020-11-13 21:05:38', '2020-11-13 21:05:38'),
(432, '74.120.14.37', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-13 21:35:38', '2021-02-10 12:05:41'),
(433, '196.52.43.96', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-13 21:53:32', '2020-11-13 21:53:32'),
(434, '165.22.42.57', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-11-14 00:35:10', '2020-11-14 00:35:14'),
(435, '96.126.103.73', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'US', 'United States', 'Pennsylvania', 'Philadelphia', '19106', NULL, '39.948841094971', '-75.14427947998', 0, '2020-11-14 02:30:36', '2020-11-14 02:30:36'),
(436, '35.247.21.80', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-14 06:06:48', '2021-02-10 13:19:35'),
(437, '34.223.54.88', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-14 10:21:42', '2020-11-14 10:21:42'),
(438, '35.153.193.62', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-14 10:52:35', '2020-11-14 10:52:36'),
(439, '114.124.136.72', 'Chrome (86.0.4240.198)', 'Android', '0', 'Guest', 'ID', 'Indonesia', 'Jakarta', 'Jakarta', '10110', NULL, '-6.1737999916077', '106.82669830322', 0, '2020-11-14 11:47:47', '2020-11-14 11:47:47'),
(440, '18.221.42.40', 'Chrome (85.0.4183.121)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-11-14 13:34:06', '2020-11-14 13:34:06'),
(441, '162.243.128.195', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-14 14:20:11', '2020-11-14 14:20:11'),
(442, '196.242.84.113', 'Vivalidi (1.96.1147.42)', 'Apple', '0', 'Guest', 'PL', 'Poland', 'Mazovia', 'Śródmieście', '00-025', NULL, '52.231700897217', '21.018339157104', 0, '2020-11-14 16:06:17', '2020-11-14 16:06:17'),
(443, '167.248.133.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-14 16:52:05', '2021-02-06 20:54:15'),
(444, '84.255.186.195', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-14 21:07:38', '2020-11-14 21:07:38'),
(445, '173.252.107.28', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-11-14 21:07:38', '2020-11-14 21:07:38'),
(446, '162.142.125.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-14 21:45:57', '2021-02-06 05:14:21'),
(447, '167.248.133.38', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-14 23:17:55', '2021-02-01 10:34:38'),
(448, '181.214.190.80', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2020-11-15 00:26:45', '2020-11-15 00:26:45'),
(449, '104.144.213.107', 'Chrome (67.0.3396.79)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-11-15 00:54:15', '2020-11-15 00:54:18'),
(450, '205.237.95.233', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Casper', '82609', NULL, '42.843128204346', '-106.2763671875', 0, '2020-11-15 03:48:50', '2020-11-15 03:48:50'),
(451, '104.223.82.156', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Calabasas', '91356', NULL, '34.155010223389', '-118.54624938965', 0, '2020-11-15 04:05:46', '2020-11-15 04:05:46'),
(452, '107.150.84.139', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Delaware', 'Wilmington', '19806', NULL, '39.761920928955', '-75.56421661377', 0, '2020-11-15 04:06:35', '2020-11-15 04:08:15'),
(453, '193.37.255.114', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'AT', 'Austria', 'Vienna', 'Vienna', '1000', NULL, '48.208610534668', '16.374170303345', 0, '2020-11-15 07:04:17', '2020-11-15 07:04:17'),
(454, '168.151.120.234', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'US', 'United States', 'Florida', 'Clearwater', '33764', NULL, '27.919809341431', '-82.737243652344', 0, '2020-11-15 07:52:06', '2020-11-15 07:52:06'),
(455, '94.76.52.208', 'Chrome (86.0.4240.193)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-15 07:53:05', '2020-11-15 07:53:05'),
(456, '77.69.199.33', 'Chrome (86.0.4240.183)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-15 08:50:08', '2020-11-15 09:03:58'),
(457, '35.187.190.226', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2020-11-15 11:32:24', '2021-02-09 01:27:46'),
(458, '173.212.199.138', 'Chrome (86.0.4240.75)', 'Linux', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2020-11-15 12:08:48', '2020-11-15 12:08:48'),
(459, '54.193.114.48', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-15 14:56:05', '2020-12-07 09:46:37'),
(460, '46.4.120.42', 'Chrome (86.0.4240.0)', 'Linux', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-11-15 15:16:11', '2020-11-15 15:16:11'),
(461, '192.241.219.80', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-15 15:43:55', '2020-11-18 19:41:54'),
(462, '103.117.14.215', 'Chrome (86.0.4240.193)', 'Apple', '9', 'Arsh Uddin', 'IN', 'India', 'Delhi', 'New Delhi', '110014', NULL, '28.582099914551', '77.248497009277', 0, '2020-11-15 17:22:05', '2020-11-15 18:10:28'),
(463, '3.231.144.18', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-15 17:45:29', '2020-11-15 17:46:44'),
(464, '3.231.144.18', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-15 17:45:29', '2020-11-15 17:45:29'),
(465, '77.69.230.110', 'Chrome (86.0.4240.185)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-15 18:46:38', '2020-11-16 06:04:30');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(466, '94.76.14.210', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-15 19:13:10', '2020-11-15 19:13:10'),
(467, '18.209.228.66', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-15 23:42:04', '2020-11-15 23:42:04'),
(468, '23.129.64.203', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-11-15 23:42:55', '2020-11-15 23:42:55'),
(469, '39.107.177.233', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-11-16 02:05:21', '2020-11-16 02:05:50'),
(470, '42.194.133.28', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-16 02:32:22', '2020-11-16 02:34:58'),
(471, '34.222.86.31', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-16 03:17:35', '2020-11-16 03:17:35'),
(472, '62.115.15.146', 'Firefox (33.0)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Zurich', 'Zürich', '8043', NULL, '47.374168395996', '8.5369501113892', 0, '2020-11-16 04:21:17', '2021-01-15 04:30:13'),
(473, '106.217.171.169', 'Chrome (86.0.4240.183)', 'Apple', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Meerut', '250104', NULL, '28.902099609375', '77.996696472168', 0, '2020-11-16 06:04:15', '2020-11-16 06:05:03'),
(474, '207.46.13.93', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-16 07:18:30', '2020-11-16 07:18:30'),
(475, '66.249.66.85', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-11-16 07:23:04', '2020-11-16 07:23:04'),
(476, '162.142.125.37', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-16 08:46:52', '2021-01-28 17:07:57'),
(477, '128.14.209.226', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-16 09:19:35', '2021-01-22 16:20:41'),
(478, '89.148.44.192', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-16 09:31:24', '2020-11-16 09:31:24'),
(479, '171.76.200.98', 'Chrome (88.0.4315.5)', 'Windows', '10', 'Krishna Mishra', 'IN', 'India', 'Uttar Pradesh', 'Sultānpur', '228155', NULL, '26.345100402832', '81.97802734375', 0, '2020-11-16 10:07:23', '2020-11-16 10:12:38'),
(480, '66.249.135.104', 'Chrome (59.0.3071.115)', 'Linux', '0', 'Guest', 'US', 'United States', 'Florida', 'Delray Beach', '33484', NULL, '26.453649520874', '-80.134613037109', 0, '2020-11-16 10:17:40', '2021-02-09 22:34:14'),
(481, '192.35.168.96', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-16 10:20:40', '2021-02-09 08:04:58'),
(482, '171.76.171.35', 'Chrome (88.0.4315.5)', 'Windows', '10', 'Krishna Mishra', 'IN', 'India', 'Uttar Pradesh', 'Sultānpur', '228125', NULL, '26.355939865112', '82.093818664551', 0, '2020-11-16 10:36:55', '2020-11-16 10:41:35'),
(483, '198.199.95.69', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-16 15:41:38', '2020-11-16 15:41:38'),
(484, '47.8.160.5', 'Chrome (88.0.4315.5)', 'Windows', '5', 'name1 name2', 'IN', 'India', 'Uttar Pradesh', 'Inhauna', '229801', NULL, '26.524339675903', '81.494491577148', 0, '2020-11-16 17:16:45', '2020-11-16 17:18:11'),
(485, '74.120.14.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-16 21:33:22', '2021-02-02 09:51:29'),
(486, '200.113.253.154', 'Chrome (86.0.4240.193)', 'Apple', '0', 'Guest', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2020-11-16 21:33:33', '2020-11-16 21:33:33'),
(487, '67.174.177.228', 'Chrome (86.0.4240.112)', 'unknown', '0', 'Guest', 'US', 'United States', 'Colorado', 'Aurora', '80017', NULL, '39.6897315979', '-104.79302215576', 0, '2020-11-16 22:07:14', '2020-11-16 22:07:14'),
(488, '3.90.70.155', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-16 23:30:26', '2020-11-16 23:30:27'),
(489, '157.55.39.120', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-17 02:34:13', '2020-11-18 12:05:16'),
(490, '178.32.67.93', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75013', NULL, '48.831920623779', '2.3558599948883', 0, '2020-11-17 02:38:50', '2020-11-17 02:38:50'),
(491, '47.8.166.160', 'Chrome (88.0.4315.5)', 'Windows', '5', 'name1 name2', 'IN', 'India', 'Uttar Pradesh', 'Inhauna', '229801', NULL, '26.524339675903', '81.494491577148', 0, '2020-11-17 05:15:30', '2020-11-17 05:15:30'),
(492, '196.52.43.129', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-17 05:49:41', '2020-11-17 05:49:41'),
(493, '181.177.112.56', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Monsey', '10901', NULL, '41.138458251953', '-74.106048583984', 0, '2020-11-17 05:50:54', '2020-11-17 05:50:54'),
(494, '206.41.172.62', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Delaware', 'Middletown', '19709', NULL, '39.477100372314', '-75.671730041504', 0, '2020-11-17 05:51:14', '2020-11-17 05:52:17'),
(495, '84.65.109.217', 'Chrome (34.0.1847.131)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Ruislip', 'HA4', NULL, '51.576000213623', '-0.4210000038147', 0, '2020-11-17 06:03:18', '2020-11-17 06:03:18'),
(496, '128.14.209.178', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-17 06:19:14', '2021-01-20 08:22:01'),
(497, '167.248.133.39', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-17 07:31:33', '2021-01-20 20:14:12'),
(498, '34.78.67.120', 'Firefox (52.0)', 'Apple', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2020-11-17 09:39:42', '2020-11-17 09:39:42'),
(499, '164.52.24.163', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-11-17 10:12:50', '2021-02-04 08:13:09'),
(500, '66.240.192.138', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2020-11-17 10:14:23', '2020-11-17 10:14:23'),
(501, '192.35.168.64', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-17 11:18:12', '2021-02-09 02:47:21'),
(502, '88.201.117.62', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-17 11:53:54', '2020-11-17 12:23:00'),
(503, '192.186.174.5', 'Chrome (67.0.3396.62)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-11-17 16:31:46', '2020-11-24 02:28:50'),
(504, '196.52.43.117', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-17 16:58:26', '2020-11-17 16:58:26'),
(505, '185.220.100.253', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bayern', 'Hassfurt', '97437', NULL, '50.031539916992', '10.506739616394', 0, '2020-11-17 18:39:16', '2021-01-27 21:24:13'),
(506, '167.248.133.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-17 18:48:31', '2021-02-09 08:49:45'),
(507, '162.243.128.230', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-17 19:43:52', '2020-11-17 19:43:52'),
(508, '94.129.86.193', 'Safari (14.0)', 'Apple', '0', 'Guest', 'KW', 'Kuwait', 'Al Asimah', 'Kuwait City', NULL, NULL, '29.369720458984', '47.978328704834', 0, '2020-11-17 19:44:42', '2020-11-17 19:44:42'),
(509, '207.244.230.205', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Missouri', 'Clayton', '63146', NULL, '38.70991897583', '-90.463439941406', 0, '2020-11-17 21:11:25', '2021-01-17 03:04:06'),
(510, '34.215.211.246', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-18 00:10:31', '2020-11-18 00:10:31'),
(511, '34.83.113.75', 'Firefox (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'The Dalles', '97058', NULL, '45.554248809814', '-121.18699645996', 0, '2020-11-18 01:39:21', '2021-02-03 15:25:38'),
(512, '69.30.213.202', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Kansas', 'Prairie Village', '64116', NULL, '39.146381378174', '-94.570770263672', 0, '2020-11-18 02:36:15', '2020-11-18 02:37:08'),
(513, '34.253.204.187', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-18 05:24:19', '2020-11-18 05:24:19'),
(514, '159.69.187.128', 'Chrome (41.0.2228.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-11-18 10:16:29', '2020-11-18 10:16:29'),
(515, '18.204.16.71', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-18 10:29:39', '2020-11-18 10:29:43'),
(516, '115.238.44.237', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-11-18 12:09:14', '2020-11-18 12:09:14'),
(517, '80.82.77.139', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-18 16:23:20', '2020-12-30 09:26:36'),
(518, '162.142.125.39', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-19 01:29:59', '2021-02-10 16:23:38'),
(519, '184.105.139.67', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-19 01:49:52', '2021-02-11 00:14:34'),
(520, '45.94.235.199', 'Chrome (68.0.3432.3)', 'Apple', '0', 'Guest', 'ES', 'Spain', 'Madrid', 'Madrid', '28001', NULL, '40.426181793213', '-3.6851398944855', 0, '2020-11-19 04:33:57', '2020-11-19 04:33:59'),
(521, '51.210.243.206', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75001', NULL, '48.860229492188', '2.3410699367523', 0, '2020-11-19 04:36:12', '2020-11-19 04:36:12'),
(522, '195.58.38.207', 'Chrome (34.0.1847.131)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Düsseldorf', '40213', NULL, '51.227699279785', '6.7734999656677', 0, '2020-11-19 06:10:32', '2020-11-19 06:10:32'),
(523, '5.157.8.164', 'Chrome (66.0.3359.170)', 'Apple', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-19 11:27:09', '2020-11-19 11:27:11'),
(524, '13.66.139.159', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-19 11:30:58', '2020-11-20 04:52:41'),
(525, '77.69.129.9', 'Chrome (86.0.4240.198)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-19 12:25:25', '2020-11-19 12:25:25'),
(526, '178.32.197.91', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Pays de la Loire', 'Nantes', '44000', NULL, '47.21683883667', '-1.5567400455475', 0, '2020-11-19 15:33:38', '2020-11-19 15:33:38'),
(527, '196.52.43.131', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-19 17:40:17', '2020-11-19 17:40:17'),
(528, '192.241.237.17', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-11-19 21:59:17', '2020-11-19 21:59:17'),
(529, '184.105.139.70', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-20 04:06:36', '2020-11-20 04:06:36'),
(530, '46.42.65.255', 'Safari (13.1.2)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-20 06:47:57', '2020-11-20 06:47:57'),
(531, '13.66.139.88', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-20 07:36:47', '2020-11-20 07:36:47'),
(532, '84.255.134.143', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-20 10:13:30', '2020-11-20 10:13:30'),
(533, '205.185.119.203', 'Internet Explorer (10.0,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Cheyenne', '82001', NULL, '41.141841888428', '-104.77919006348', 0, '2020-11-20 12:20:31', '2020-12-10 21:26:29'),
(534, '185.165.178.129', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-20 12:46:32', '2020-11-20 12:46:32'),
(535, '198.143.146.34', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2020-11-20 12:47:31', '2021-01-29 16:20:25'),
(536, '35.165.154.77', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-20 13:06:25', '2020-11-20 13:21:00'),
(537, '192.255.79.74', 'Chrome (77.0.3865.90)', 'Windows', '0', 'Guest', 'US', 'United States', 'South Carolina', 'Charleston', '29401', NULL, '32.777599334717', '-79.941917419434', 0, '2020-11-20 14:37:26', '2020-11-20 14:37:26'),
(538, '109.161.162.29', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-20 17:42:17', '2020-11-20 17:42:17'),
(539, '143.110.156.101', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Minnesota', 'Duluth', '55811', NULL, '46.848949432373', '-92.20142364502', 0, '2020-11-20 17:46:03', '2020-11-20 17:46:05'),
(540, '23.129.64.207', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-11-20 18:05:51', '2020-11-20 18:05:51'),
(541, '66.249.70.91', 'Chrome (88.0.4324.140)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-11-20 18:34:45', '2021-02-04 04:01:11'),
(542, '108.174.5.112', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Sunnyvale', '94085', NULL, '37.388599395752', '-122.01677703857', 0, '2020-11-20 19:17:24', '2020-11-20 19:17:24'),
(543, '192.35.169.112', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-20 20:08:05', '2020-11-20 20:08:05'),
(544, '178.62.74.6', 'Chrome (34.0.1847.116)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Islington', 'E2', NULL, '51.538608551025', '-0.067500002682209', 0, '2020-11-20 22:09:11', '2021-01-16 09:14:53'),
(545, '18.204.44.67', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-20 22:12:25', '2020-11-20 22:12:25'),
(546, '107.6.180.154', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2020-11-20 22:21:27', '2020-11-20 22:21:27'),
(547, '31.187.64.155', 'Opera (71.0.3770.284)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-21 00:44:12', '2020-11-21 00:44:12'),
(548, '184.105.247.254', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-11-21 01:50:57', '2021-01-24 04:16:17'),
(549, '52.80.87.216', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-21 02:07:27', '2020-11-21 02:07:27'),
(550, '158.69.228.209', 'Firefox (15.0.1)', 'Apple', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Châteauguay', 'J6N 0B6', NULL, '45.306251525879', '-73.853706359863', 0, '2020-11-21 02:20:42', '2021-02-04 19:29:58'),
(551, '207.46.13.129', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-21 02:24:47', '2020-11-21 02:24:47'),
(552, '13.66.139.114', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-21 06:54:14', '2020-12-02 00:54:40'),
(553, '35.222.235.72', 'Firefox (57.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-11-21 07:39:04', '2020-11-21 07:39:04'),
(554, '54.170.100.170', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-21 08:35:22', '2020-11-21 08:35:22'),
(555, '138.68.180.18', 'Chrome (34.0.1847.116)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Islington', 'EC1V', NULL, '51.533298492432', '-0.10000000149012', 0, '2020-11-21 09:02:41', '2020-11-21 09:02:41'),
(556, '70.36.100.156', 'Chrome (67.0.3396.79)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90017', NULL, '34.052848815918', '-118.26486206055', 0, '2020-11-21 09:05:59', '2020-11-21 09:06:01'),
(557, '185.72.52.237', 'Firefox (3.6.13)', 'Windows', '0', 'Guest', 'ES', 'Spain', 'Murcia', 'Atamaría', '30370', NULL, '37.625499725342', '-0.71259999275208', 0, '2020-11-21 09:37:40', '2020-11-21 09:37:40'),
(558, '34.222.77.230', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-21 10:05:49', '2020-11-21 10:05:49'),
(559, '192.241.221.159', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-21 12:22:25', '2020-11-21 12:22:25'),
(560, '196.52.43.51', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-21 17:37:40', '2020-11-21 17:37:40'),
(561, '162.142.125.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-21 19:47:36', '2021-02-01 17:40:51'),
(562, '138.246.253.24', 'Chrome (88.0.4324.146)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Garching bei München', '85748', NULL, '48.248828887939', '11.651120185852', 0, '2020-11-21 21:07:04', '2021-02-11 05:11:19'),
(563, '94.60.40.205', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'PT', 'Portugal', 'Lisbon', 'Alfragide', '1900-798', NULL, '38.722221374512', '-9.1927795410156', 0, '2020-11-21 22:08:56', '2020-11-24 10:56:55'),
(564, '51.15.251.143', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-22 00:28:26', '2020-11-22 00:28:26'),
(565, '124.206.180.139', 'Firefox (35.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-22 04:10:15', '2021-01-07 07:36:05'),
(566, '54.208.93.115', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-22 04:21:33', '2020-11-22 04:21:34'),
(567, '54.36.148.109', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-22 08:24:07', '2020-11-22 08:24:07'),
(568, '94.23.68.137', 'Vivalidi (1.97.1182.8)', 'Windows', '0', 'Guest', 'IT', 'Italy', 'Lombardy', 'Milan', '20159', NULL, '45.498199462891', '9.1918001174927', 0, '2020-11-22 08:30:18', '2021-01-13 13:09:47'),
(569, '62.210.84.82', 'Chrome (74.0.3729.169)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-22 09:20:48', '2020-11-22 09:20:48'),
(570, '52.37.141.144', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-22 14:13:14', '2020-11-22 14:13:17'),
(571, '209.127.46.114', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-11-22 14:40:09', '2020-11-22 14:40:09'),
(572, '45.154.35.212', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'PA', 'Panama', NULL, NULL, NULL, NULL, '9', '-80', 0, '2020-11-22 17:08:50', '2020-11-22 17:08:50'),
(573, '143.110.182.239', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Minnesota', 'Duluth', '55811', NULL, '46.848949432373', '-92.20142364502', 0, '2020-11-22 21:19:35', '2020-11-22 21:19:35'),
(574, '194.5.193.246', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-22 21:21:48', '2020-11-22 21:21:48'),
(575, '74.120.14.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-22 22:27:59', '2021-02-09 21:14:57'),
(576, '54.36.148.174', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-23 01:48:14', '2020-12-18 02:53:21'),
(577, '176.31.252.167', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-23 01:54:33', '2020-11-23 01:54:33'),
(578, '159.138.141.101', 'unknown (unknown)', 'unknown', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-11-23 06:32:04', '2020-11-23 06:32:04'),
(579, '107.6.168.210', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2020-11-23 07:23:40', '2020-11-23 07:23:40'),
(580, '46.42.69.218', 'Chrome (86.0.4240.198)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-23 08:06:11', '2020-11-23 08:06:11'),
(581, '213.205.197.185', 'Chrome (86.0.4240.93)', 'iPhone', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Slough', 'SL3 6', NULL, '51.544578552246', '-0.56686002016068', 0, '2020-11-23 08:15:55', '2020-11-23 08:17:25'),
(582, '74.120.14.56', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-23 09:47:14', '2021-01-23 21:05:49'),
(583, '77.69.161.185', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-23 11:09:31', '2020-11-23 11:09:31'),
(584, '162.142.125.38', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-23 13:34:26', '2021-02-08 01:53:17'),
(585, '198.20.124.218', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2020-11-23 14:39:56', '2021-01-20 19:45:51'),
(586, '157.55.39.159', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-11-23 14:42:44', '2020-11-23 14:42:44'),
(587, '54.196.188.187', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-23 15:07:33', '2020-11-23 15:07:33'),
(588, '23.23.236.48', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-23 15:07:35', '2020-11-23 15:07:35'),
(589, '77.88.5.159', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2020-11-23 15:30:25', '2021-02-10 00:31:58'),
(590, '77.88.5.71', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2020-11-23 15:30:47', '2021-02-10 00:31:12'),
(591, '34.204.174.160', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-23 18:15:10', '2020-11-23 18:15:12'),
(592, '192.241.237.202', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-11-23 18:19:03', '2020-11-23 18:19:03'),
(593, '34.236.245.6', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-23 18:24:27', '2020-11-23 18:24:27'),
(594, '71.6.232.9', 'Chrome (74.0.3729.131)', 'Windows', '0', 'Guest', 'US', 'United States', 'Nevada', 'Whitney', '89012', NULL, '36.008491516113', '-115.03997802734', 0, '2020-11-23 18:57:47', '2020-11-23 18:57:47'),
(595, '40.88.21.235', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.713001251221', '-78.158996582031', 0, '2020-11-23 20:10:58', '2021-01-27 21:28:38'),
(596, '173.252.111.118', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-11-23 20:16:46', '2020-11-23 20:16:46'),
(597, '173.252.111.16', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-11-23 20:16:48', '2020-11-23 20:16:48'),
(598, '181.214.34.94', 'Chrome (66.0.3359.117)', 'Apple', '0', 'Guest', 'BR', 'Brazil', 'São Paulo', 'São Paulo', '01001-000', NULL, '-23.551519393921', '-46.633140563965', 0, '2020-11-24 01:44:24', '2020-11-24 01:44:36'),
(599, '89.187.168.162', 'Chrome (68.0.3440.106)', 'Windows', '0', 'Guest', 'AT', 'Austria', 'Vienna', 'Vienna', '1000', NULL, '48.208610534668', '16.374170303345', 0, '2020-11-24 04:19:00', '2020-11-24 04:19:04'),
(600, '92.118.161.9', 'unknown (unknown)', 'unknown', '0', 'Guest', 'GR', 'Greece', 'Attica', 'Athens', '114 76', NULL, '37.969989776611', '23.719989776611', 0, '2020-11-24 04:47:08', '2020-11-24 04:47:08'),
(601, '85.248.227.165', 'Chrome (41.0.2227.0)', 'Linux', '0', 'Guest', 'SK', 'Slovakia', 'Bratislavský', 'Bratislava', '851 01', NULL, '48.124660491943', '17.101980209351', 0, '2020-11-24 05:19:16', '2021-01-16 08:48:25'),
(602, '91.192.103.10', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Zug', 'Zug', '6331', NULL, '47.174041748047', '8.4268703460693', 0, '2020-11-24 05:19:39', '2020-12-02 10:44:58'),
(603, '37.9.13.154', 'Firefox (82.0)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '195269', NULL, '59.939041137695', '30.315790176392', 0, '2020-11-24 07:00:15', '2020-11-24 07:00:15'),
(604, '37.9.13.157', 'Firefox (82.0)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '195269', NULL, '59.939041137695', '30.315790176392', 0, '2020-11-24 09:35:26', '2020-11-24 09:35:26'),
(605, '54.36.149.34', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-11-24 11:56:10', '2020-11-24 11:56:10'),
(606, '102.165.30.57', 'unknown (unknown)', 'unknown', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.867141723633', '151.20710754395', 0, '2020-11-24 13:52:53', '2020-11-24 13:52:53'),
(607, '198.143.155.122', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2020-11-24 14:03:23', '2021-01-21 04:54:58'),
(608, '192.35.168.176', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-24 16:06:33', '2020-12-15 21:32:09'),
(609, '77.69.183.222', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-24 16:17:22', '2020-11-24 16:27:46'),
(610, '192.241.235.85', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-24 18:19:47', '2020-11-24 18:19:47'),
(611, '129.146.120.47', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Arizona', 'Alhambra', '85013', NULL, '33.509380340576', '-112.08255004883', 0, '2020-11-24 20:06:44', '2020-11-24 20:06:46'),
(612, '213.239.216.194', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Nürnberg', '90403', NULL, '49.451999664307', '11.076800346375', 0, '2020-11-25 03:59:49', '2020-11-25 04:00:05'),
(613, '54.36.149.65', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-11-25 04:32:31', '2020-11-25 04:32:31'),
(614, '34.253.195.145', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-25 09:24:33', '2020-11-25 09:24:33'),
(615, '170.106.80.86', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-11-25 09:50:28', '2020-11-25 09:50:28'),
(616, '77.69.165.193', 'Chrome (86.0.4240.198)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-25 13:08:08', '2020-11-25 13:27:42'),
(617, '93.252.124.54', 'Firefox (3.0.14)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Hamburg', 'Hamburg', '20095', NULL, '53.55110168457', '9.9937000274658', 0, '2020-11-25 13:53:37', '2020-11-25 13:53:37'),
(618, '54.170.87.39', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-25 14:04:54', '2020-11-25 14:04:54'),
(619, '178.164.146.171', 'Firefox (61.0)', 'Windows', '0', 'Guest', 'HU', 'Hungary', 'Hajdú-Bihar', 'Debrecen', '4002', NULL, '47.524688720703', '21.699499130249', 0, '2020-11-25 17:04:44', '2020-11-28 00:50:03'),
(620, '192.241.234.66', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-11-25 18:58:02', '2020-11-25 18:58:02'),
(621, '45.83.64.173', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2020-11-25 21:00:17', '2020-11-25 21:00:17'),
(622, '51.15.1.221', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Haarlem', '2031', NULL, '52.388439178467', '4.6565098762512', 0, '2020-11-25 23:34:36', '2020-11-25 23:34:36'),
(623, '162.247.72.199', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Kensington', '11232', NULL, '40.657241821289', '-74.002868652344', 0, '2020-11-25 23:49:48', '2020-11-25 23:49:48'),
(624, '23.129.64.182', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-11-26 02:17:44', '2020-11-26 02:17:44'),
(625, '34.252.113.21', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-11-26 02:51:56', '2020-11-26 02:51:56'),
(626, '100.26.152.203', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-11-26 05:11:04', '2020-11-26 15:20:53'),
(627, '77.69.161.112', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-26 07:09:44', '2020-11-26 07:09:44'),
(628, '74.120.14.40', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-26 07:23:06', '2020-12-30 02:39:57'),
(629, '89.248.160.135', 'Chrome (81.0.4044.129)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-11-26 08:16:35', '2021-02-09 23:48:48'),
(630, '5.196.76.206', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-11-26 10:36:46', '2020-11-26 10:36:46'),
(631, '167.248.133.40', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-11-26 12:12:06', '2021-01-26 06:11:22'),
(632, '18.218.187.82', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-11-26 12:22:14', '2020-11-26 12:22:15'),
(633, '119.45.218.253', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-11-26 13:43:41', '2020-11-26 13:50:39'),
(634, '73.170.132.212', 'Chrome (86.0.4240.198)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Live Oak', '95073', NULL, '36.999530792236', '-121.95922088623', 0, '2020-11-26 18:14:38', '2020-12-07 15:37:30'),
(635, '52.13.178.206', 'Chrome (55.0.2883.87)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-11-26 18:14:40', '2020-11-30 20:10:42'),
(636, '128.90.170.237', 'Safari (11.1.2)', 'Apple', '0', 'Guest', 'US', 'United States', 'Texas', 'Austin', '78746', NULL, '30.295660018921', '-97.81372833252', 0, '2020-11-26 19:30:46', '2020-11-26 19:30:46'),
(637, '54.36.149.91', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-11-26 21:32:04', '2020-12-28 16:31:09'),
(638, '77.69.246.162', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-11-26 22:13:59', '2020-11-26 22:13:59'),
(639, '192.241.233.89', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-11-26 22:22:49', '2020-11-26 22:22:49'),
(640, '51.15.195.246', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-26 23:46:45', '2020-11-26 23:46:45'),
(641, '128.14.209.234', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-11-27 09:41:17', '2021-01-27 16:20:27'),
(642, '103.88.1.44', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'IN', 'India', 'Maharashtra', 'Powai', '400070', NULL, '19.076000213623', '72.877700805664', 0, '2020-11-27 10:31:44', '2020-12-07 07:39:56'),
(643, '179.28.213.136', 'Chrome (84.0.4147.105)', 'Windows', '0', 'Guest', 'UY', 'Uruguay', 'Montevideo', 'Montevideo', '11000', NULL, '-34.88399887085', '-56.162998199463', 0, '2020-11-27 11:09:16', '2020-11-27 11:09:16'),
(644, '192.71.36.158', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-11-27 14:23:23', '2020-11-27 14:23:23'),
(645, '163.172.120.214', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-11-27 15:38:04', '2020-11-27 17:26:53'),
(646, '54.36.148.38', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-11-27 18:58:10', '2020-11-27 18:58:10'),
(647, '196.52.43.92', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-11-27 19:02:08', '2020-11-27 19:02:08'),
(648, '51.91.107.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75001', NULL, '48.860229492188', '2.3410699367523', 0, '2020-11-28 01:55:50', '2020-11-28 01:55:50'),
(649, '84.17.51.110', 'Opera (53.0.2907.99)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 08:44:07', '2020-11-28 08:44:10'),
(650, '192.241.233.29', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 09:36:32', '2020-11-28 09:36:32'),
(651, '89.248.171.97', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 09:57:00', '2020-11-28 09:57:00'),
(652, '27.5.105.178', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 11:30:57', '2020-11-28 11:30:57'),
(653, '92.118.160.57', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 12:05:42', '2020-11-28 12:05:42'),
(654, '172.105.13.165', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 12:23:41', '2021-02-02 15:33:22'),
(655, '216.172.155.74', 'Chrome (68.0.3440.75)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 14:41:04', '2020-11-28 14:41:04'),
(656, '100.26.135.239', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 14:44:56', '2020-11-28 21:32:12'),
(657, '54.36.149.75', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 17:51:36', '2020-11-28 17:51:36'),
(658, '3.237.60.83', 'Chrome (84.0.4147.105)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 17:53:29', '2020-11-28 17:53:29'),
(659, '38.131.158.199', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-28 23:32:48', '2020-11-28 23:32:48'),
(660, '185.220.102.252', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 01:31:52', '2020-11-29 01:31:52'),
(661, '54.38.190.109', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 01:33:15', '2020-11-29 01:33:15'),
(662, '45.40.121.187', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 06:20:21', '2020-11-29 06:20:21'),
(663, '168.90.199.188', 'Chrome (67.0.3396.79)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 09:08:32', '2020-11-29 09:08:37'),
(664, '192.241.235.192', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 11:43:25', '2020-11-29 11:43:25'),
(665, '54.36.148.47', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 12:23:15', '2020-12-02 19:11:47'),
(666, '181.215.87.141', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 12:49:53', '2020-11-29 12:49:53'),
(667, '38.145.95.108', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 12:49:54', '2020-11-29 12:49:54'),
(668, '88.201.29.77', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 13:13:44', '2020-11-29 13:14:45'),
(669, '188.80.195.140', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 14:43:42', '2020-11-29 14:43:42'),
(670, '213.217.0.184', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 23:04:18', '2020-11-29 23:04:18'),
(671, '107.175.109.91', 'Firefox (16.0)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 23:55:58', '2020-11-29 23:55:58'),
(672, '104.168.90.125', 'Konqueror (4.2)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-29 23:56:04', '2020-11-29 23:56:04'),
(673, '119.45.159.220', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 00:15:37', '2020-11-30 00:24:19'),
(674, '184.105.247.195', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 00:45:07', '2021-01-27 00:19:03'),
(675, '37.9.13.68', 'Firefox (54.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 05:05:04', '2020-11-30 05:05:04'),
(676, '185.112.156.100', 'Firefox (81.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 06:10:51', '2020-11-30 06:10:51'),
(677, '95.217.207.28', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 06:29:30', '2020-11-30 06:29:30'),
(678, '54.36.149.47', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 06:41:18', '2020-11-30 06:41:18'),
(679, '34.220.126.100', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 06:45:44', '2020-11-30 06:45:44'),
(680, '181.215.217.186', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 10:49:42', '2020-11-30 10:49:42'),
(681, '77.69.163.10', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 10:52:53', '2020-11-30 10:52:53'),
(682, '192.241.214.252', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 13:28:27', '2020-11-30 13:28:27'),
(683, '77.234.68.169', 'Firefox (61.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 13:57:34', '2020-12-06 07:59:28'),
(684, '66.195.204.6', 'Chrome (86.0.4240.198)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 14:11:20', '2020-11-30 14:11:20'),
(685, '173.255.252.153', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 14:16:07', '2020-11-30 14:16:07'),
(686, '183.136.225.45', 'Chrome (63.0.3239.132)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 15:42:30', '2021-01-10 13:07:55'),
(687, '99.82.144.3', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 15:45:26', '2020-11-30 15:45:26'),
(688, '49.235.130.109', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 16:17:35', '2020-12-09 06:51:08'),
(689, '193.112.86.114', 'iPhone (unknown)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 18:28:24', '2020-12-03 04:19:59'),
(690, '3.236.154.12', 'Safari (5.0.4)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 23:21:58', '2020-11-30 23:21:58'),
(691, '82.202.161.133', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-30 23:47:28', '2020-11-30 23:47:28'),
(692, '107.178.194.108', 'Internet Explorer (9.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-12-01 02:27:29', '2020-12-01 02:27:29'),
(693, '208.87.237.140', 'Safari (5.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2020-12-01 02:27:31', '2020-12-31 19:07:23'),
(694, '2600:1900:2000:1b:400::17', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.388019561768', '-122.07431030273', 0, '2020-12-01 02:27:33', '2020-12-01 02:27:33'),
(695, '167.160.172.20', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60605', NULL, '41.864669799805', '-87.619987487793', 0, '2020-12-01 02:44:58', '2020-12-01 02:45:00'),
(696, '95.49.191.197', 'Firefox (70.0)', 'Windows', '0', 'Guest', 'PL', 'Poland', 'Mazovia', 'Śródmieście', '00-025', NULL, '52.231700897217', '21.018339157104', 0, '2020-12-01 02:45:32', '2020-12-01 02:51:07'),
(697, '83.28.78.81', 'Edge (18.18362)', 'Windows', '0', 'Guest', 'PL', 'Poland', 'Subcarpathian', 'Rzeszów', '36-071', NULL, '50.056301116943', '21.865900039673', 0, '2020-12-01 02:51:09', '2020-12-01 02:51:09'),
(698, '65.155.30.101', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Portland', '97204', NULL, '45.51815032959', '-122.67415618896', 0, '2020-12-01 03:28:39', '2020-12-01 03:28:39'),
(699, '104.248.166.43', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', 'US', 'United States', 'Florida', 'West Palm Beach', '33417', NULL, '26.726280212402', '-80.132179260254', 0, '2020-12-01 03:33:14', '2020-12-01 22:58:39'),
(700, '192.71.126.175', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-01 04:10:59', '2021-01-18 09:34:25'),
(701, '51.77.105.92', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Islington', 'EC3R', NULL, '51.533298492432', '-0.10000000149012', 0, '2020-12-01 05:05:52', '2020-12-01 05:05:52'),
(702, '196.52.43.103', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-01 05:15:07', '2020-12-01 05:15:07'),
(703, '74.120.14.39', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-01 06:18:34', '2021-02-05 06:57:51'),
(704, '192.35.168.160', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-01 10:15:26', '2020-12-01 10:15:26'),
(705, '87.249.208.18', 'Chrome (87.0.4280.66)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Chelyabinsk', 'Chelyabinsk', '454000', NULL, '55.159889221191', '61.40258026123', 0, '2020-12-01 10:51:11', '2020-12-02 09:16:08');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(706, '185.142.236.35', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-01 11:01:27', '2020-12-01 11:01:27'),
(707, '52.14.211.169', 'Chrome (85.0.4183.102)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-12-01 11:43:30', '2020-12-01 11:43:31'),
(708, '115.89.74.126', 'Chrome (77.0.3865.90)', 'Windows', '0', 'Guest', 'KR', 'South Korea', 'Seoul', 'Seoul', '100-011', NULL, '37.561000823975', '126.98265075684', 0, '2020-12-01 12:38:21', '2021-01-01 05:18:59'),
(709, '192.241.211.83', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-01 13:47:10', '2020-12-01 13:47:10'),
(710, '35.246.13.62', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Barking', 'E7', NULL, '51.5', '0.08330000191927', 0, '2020-12-01 15:07:15', '2020-12-01 15:07:16'),
(711, '31.171.152.140', 'Chrome (65.0.3325.146)', 'Windows', '0', 'Guest', 'AL', 'Albania', 'Tirana', 'Tirana', NULL, NULL, '41.329990386963', '19.829990386963', 0, '2020-12-01 15:15:31', '2020-12-01 15:15:35'),
(712, '170.83.213.18', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', 'BR', 'Brazil', 'Espírito Santo', 'Linhares', '29905-010', NULL, '-19.368709564209', '-40.058898925781', 0, '2020-12-01 15:27:11', '2020-12-01 15:27:11'),
(713, '196.52.43.63', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-01 15:43:13', '2020-12-01 15:43:13'),
(714, '148.3.85.85', 'Chrome (87.0.4280.66)', 'Windows', '0', 'Guest', 'ES', 'Spain', 'Madrid', 'Madrid', '28050', NULL, '40.501110076904', '-3.6471199989319', 0, '2020-12-01 16:27:08', '2020-12-01 16:27:08'),
(715, '45.227.255.224', 'Chrome (72.0.3626.121)', 'Linux', '0', 'Guest', 'PA', 'Panama', 'Panamá', 'Panamá', NULL, NULL, '8.9942998886108', '-79.518798828125', 0, '2020-12-01 16:47:41', '2020-12-01 16:47:41'),
(716, '2600:1900:2001:3::25', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.388019561768', '-122.07431030273', 0, '2020-12-01 21:52:04', '2020-12-01 21:52:04'),
(717, '107.178.194.112', 'Internet Explorer (9.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-12-01 21:52:04', '2020-12-01 21:52:04'),
(718, '45.153.203.175', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Delaware', 'Wilmington', '19707', NULL, '39.786598205566', '-75.685020446777', 0, '2020-12-01 23:02:32', '2020-12-01 23:02:32'),
(719, '3.15.193.14', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2020-12-01 23:10:50', '2020-12-01 23:10:50'),
(720, '103.149.192.176', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3519999980927', '103.82499694824', 0, '2020-12-01 23:15:17', '2020-12-01 23:15:17'),
(721, '70.42.131.189', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Santa Clara', '95054', NULL, '37.396308898926', '-121.96140289307', 0, '2020-12-01 23:52:25', '2020-12-01 23:52:25'),
(722, '167.172.233.207', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-01 23:59:08', '2020-12-01 23:59:08'),
(723, '50.30.32.186', 'Firefox (28.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Arizona', 'Scottsdale', '85260', NULL, '33.610958099365', '-111.89010620117', 0, '2020-12-02 00:22:24', '2020-12-02 00:22:24'),
(724, '35.141.121.7', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'US', 'United States', 'Florida', 'Orlando', '32812', NULL, '28.490200042725', '-81.33283996582', 0, '2020-12-02 02:42:32', '2020-12-15 20:03:08'),
(725, '94.154.239.69', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv City', 'Kyiv', '01000', NULL, '50.433330535889', '30.516670227051', 0, '2020-12-02 06:29:17', '2020-12-02 06:29:48'),
(726, '23.129.64.190', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-12-02 07:43:34', '2020-12-02 07:43:34'),
(727, '23.129.64.211', 'Chrome (32.0.1667.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-12-02 07:48:34', '2020-12-02 07:48:34'),
(728, '54.234.16.232', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-02 09:19:11', '2020-12-02 09:19:11'),
(729, '185.220.101.144', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Indio', '92201', NULL, '33.703399658203', '-116.22918701172', 0, '2020-12-02 10:43:47', '2020-12-02 10:43:47'),
(730, '13.66.139.104', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-02 11:42:33', '2020-12-03 00:24:45'),
(731, '52.237.83.160', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2020-12-02 15:06:00', '2020-12-27 22:30:07'),
(732, '162.243.128.225', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-02 15:48:29', '2020-12-02 15:48:29'),
(733, '77.88.5.121', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2020-12-02 16:27:02', '2021-02-10 03:11:27'),
(734, '3.238.159.212', 'Safari (5.0.4)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-02 21:41:32', '2020-12-02 21:41:32'),
(735, '37.46.150.77', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-02 22:37:44', '2020-12-03 23:09:56'),
(736, '3.239.1.13', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-02 23:54:35', '2020-12-02 23:54:37'),
(737, '66.249.69.207', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2020-12-02 23:55:06', '2020-12-02 23:55:06'),
(738, '54.221.5.38', 'Chrome (83.0.4103.61)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-03 01:14:01', '2020-12-03 01:14:01'),
(739, '44.234.34.119', 'Firefox (57.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-03 03:09:23', '2021-01-01 06:39:27'),
(740, '88.201.28.180', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-03 05:26:46', '2020-12-08 11:58:29'),
(741, '40.114.68.170', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.713001251221', '-78.158996582031', 0, '2020-12-03 08:38:10', '2020-12-03 08:38:10'),
(742, '68.183.55.229', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-03 10:41:33', '2020-12-03 10:41:33'),
(743, '13.66.139.70', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-03 11:11:35', '2020-12-05 03:45:59'),
(744, '37.72.168.232', 'Firefox (83.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2020-12-03 12:35:54', '2020-12-08 13:31:49'),
(745, '45.61.163.46', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Cheyenne', '82001', NULL, '41.141841888428', '-104.77919006348', 0, '2020-12-03 14:42:08', '2020-12-03 14:42:08'),
(746, '191.102.151.150', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'South Carolina', 'Orangeburg', '29115', NULL, '33.486301422119', '-80.873931884766', 0, '2020-12-03 14:43:35', '2020-12-03 14:44:29'),
(747, '192.241.237.148', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-03 17:17:25', '2020-12-03 17:17:25'),
(748, '106.75.104.107', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-12-03 18:58:19', '2021-01-01 19:30:19'),
(749, '103.118.53.158', 'iPhone (13.0.3)', 'iPhone', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-12-03 23:30:09', '2020-12-03 23:30:24'),
(750, '192.241.239.219', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-04 01:09:55', '2020-12-04 01:09:55'),
(751, '54.167.248.143', 'Chrome (83.0.4103.61)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-04 01:14:57', '2020-12-04 01:14:57'),
(752, '209.17.96.90', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-04 02:08:34', '2021-02-04 02:57:53'),
(753, '34.243.169.212', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-12-04 04:49:52', '2020-12-04 04:49:52'),
(754, '51.222.43.163', 'Chrome (45.0.2454.94)', 'Android', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-12-04 06:37:47', '2021-01-12 11:00:58'),
(755, '51.77.246.200', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-04 06:45:30', '2020-12-04 06:45:30'),
(756, '2.57.121.110', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'RO', 'Romania', NULL, NULL, NULL, NULL, '46', '25', 0, '2020-12-04 08:16:51', '2020-12-14 19:24:47'),
(757, '54.36.149.82', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-12-04 10:24:50', '2020-12-04 10:24:50'),
(758, '18.236.184.16', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-04 11:26:40', '2020-12-04 11:26:40'),
(759, '192.71.2.171', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-04 13:40:45', '2020-12-04 13:40:45'),
(760, '178.73.215.171', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-04 14:09:14', '2021-02-05 07:06:05'),
(761, '196.52.43.116', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-04 14:31:12', '2020-12-04 14:31:12'),
(762, '39.107.180.224', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-12-04 23:24:26', '2020-12-04 23:24:46'),
(763, '173.252.127.4', 'Chrome (87.0.4280.66)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-12-05 04:03:23', '2020-12-05 04:03:23'),
(764, '88.201.80.99', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-05 05:25:06', '2020-12-05 05:26:32'),
(765, '193.218.118.211', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv City', 'Kyiv', '04116', NULL, '50.454700469971', '30.52379989624', 0, '2020-12-05 09:20:53', '2020-12-05 09:20:53'),
(766, '192.241.235.191', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-05 09:50:56', '2020-12-05 09:50:56'),
(767, '54.36.148.252', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-05 10:12:44', '2020-12-05 10:12:44'),
(768, '204.14.73.110', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-05 10:33:51', '2020-12-05 10:33:51'),
(769, '92.118.160.1', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2020-12-05 13:38:12', '2020-12-11 22:48:17'),
(770, '106.75.57.52', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-12-05 17:24:15', '2020-12-05 17:24:22'),
(771, '104.155.1.120', 'Firefox (52.0)', 'Apple', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2020-12-05 17:42:59', '2020-12-17 12:10:58'),
(772, '193.188.121.101', 'Chrome (86.0.4240.198)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-05 21:03:10', '2020-12-05 21:03:10'),
(773, '65.154.226.109', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-06 00:20:24', '2020-12-06 00:20:24'),
(774, '107.178.194.61', 'Internet Explorer (9.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-12-06 00:20:58', '2020-12-06 00:20:58'),
(775, '34.123.187.200', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-12-06 00:22:08', '2020-12-06 00:22:08'),
(776, '95.49.230.111', 'Chrome (78.0.3904.97)', 'Windows', '0', 'Guest', 'PL', 'Poland', 'Subcarpathian', 'Rzeszów', '35-017', NULL, '50.038269042969', '21.999940872192', 0, '2020-12-06 00:29:59', '2020-12-06 00:39:56'),
(777, '95.49.230.112', 'Chrome (76.0.3809.100)', 'Windows', '0', 'Guest', 'PL', 'Poland', 'Subcarpathian', 'Rzeszów', '35-017', NULL, '50.038269042969', '21.999940872192', 0, '2020-12-06 00:30:08', '2020-12-06 00:30:08'),
(778, '162.142.125.40', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-06 01:02:06', '2021-02-08 21:37:32'),
(779, '65.154.226.165', 'Chrome (76.0.3809.71)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-06 01:23:48', '2020-12-31 20:07:36'),
(780, '37.59.164.103', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', 'FR', 'France', 'Pays de la Loire', 'Laval', '53000', NULL, '48.070430755615', '-0.77355998754501', 0, '2020-12-06 01:30:26', '2020-12-06 01:30:26'),
(781, '51.68.163.46', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Saarland', 'Saarbrücken', '66123', NULL, '49.233299255371', '7', 0, '2020-12-06 01:34:18', '2020-12-06 01:34:18'),
(782, '216.198.93.233', 'Firefox (28.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Hough', '44114', NULL, '41.517658233643', '-81.675193786621', 0, '2020-12-06 02:45:13', '2020-12-06 02:45:41'),
(783, '103.231.255.130', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2020-12-06 06:02:10', '2020-12-06 06:04:23'),
(784, '193.188.122.253', 'iPhone (12.1.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-06 06:18:12', '2020-12-06 06:18:12'),
(785, '88.201.58.131', 'Chrome (87.0.4280.86)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-06 09:00:58', '2020-12-06 09:00:58'),
(786, '192.241.238.252', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-06 09:51:42', '2020-12-06 09:51:42'),
(787, '13.66.139.71', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-06 10:05:17', '2021-01-29 13:40:20'),
(788, '77.69.241.237', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-06 11:33:03', '2020-12-06 11:33:03'),
(789, '188.169.128.149', 'Chrome (86.0.4240.198)', 'Android', '0', 'Guest', 'GE', 'Georgia', 'T\'bilisi', 'Tbilisi', '380000', NULL, '41.694110870361', '44.833679199219', 0, '2020-12-06 17:39:29', '2020-12-06 17:43:17'),
(790, '62.37.37.206', 'iPhone (12.1.2)', 'iPhone', '0', 'Guest', 'ES', 'Spain', 'Madrid', 'Alcalá de Henares', '28810', NULL, '40.433200836182', '-3.2994000911713', 0, '2020-12-06 18:50:22', '2020-12-06 18:50:22'),
(791, '45.56.66.176', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2020-12-06 19:25:51', '2020-12-07 00:35:43'),
(792, '84.255.142.170', 'Chrome (87.0.4280.66)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-06 21:24:14', '2020-12-06 21:24:14'),
(793, '66.249.79.127', 'Chrome (86.0.4240.96)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-12-06 21:43:30', '2020-12-06 21:43:30'),
(794, '199.19.224.184', 'Internet Explorer (10.0,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Cheyenne', '82001', NULL, '41.141841888428', '-104.77919006348', 0, '2020-12-06 23:52:00', '2020-12-09 08:25:03'),
(795, '45.154.194.25', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'City of Westminster', 'W1H', NULL, '51.504169464111', '-0.17000000178814', 0, '2020-12-07 03:21:24', '2020-12-07 03:21:24'),
(796, '104.131.99.238', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-07 04:33:14', '2020-12-07 04:33:14'),
(797, '184.105.139.68', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-12-07 05:34:27', '2020-12-16 06:22:35'),
(798, '54.36.149.79', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-12-07 05:35:45', '2020-12-07 05:35:45'),
(799, '37.131.122.64', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-07 06:27:00', '2020-12-20 13:44:21'),
(800, '150.136.136.254', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98101', NULL, '47.611011505127', '-122.33351898193', 0, '2020-12-07 08:00:23', '2020-12-07 08:02:13'),
(801, '54.193.196.126', 'Chrome (77.0.3835.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-07 09:46:17', '2020-12-07 09:46:17'),
(802, '93.158.90.30', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2020-12-07 10:09:46', '2021-01-07 20:58:53'),
(803, '162.243.128.177', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-07 10:24:40', '2020-12-07 10:24:40'),
(804, '62.209.14.210', 'iPhone (13.1.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-07 11:41:00', '2020-12-07 11:41:00'),
(805, '217.197.186.137', 'Firefox (61.0)', 'Windows', '0', 'Guest', 'HU', 'Hungary', 'Budapest', 'Budapest', '1191', NULL, '47.4599609375', '19.14967918396', 0, '2020-12-07 11:58:50', '2020-12-11 04:20:53'),
(806, '188.227.16.32', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '191186', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-07 12:43:29', '2020-12-07 12:43:29'),
(807, '88.201.24.66', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-07 12:48:13', '2020-12-07 12:48:13'),
(808, '173.252.111.19', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2020-12-07 12:48:13', '2020-12-07 12:48:13'),
(809, '85.248.227.163', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'SK', 'Slovakia', 'Bratislavský', 'Bratislava', '851 01', NULL, '48.124660491943', '17.101980209351', 0, '2020-12-07 15:25:12', '2020-12-07 15:25:12'),
(810, '178.79.139.96', 'Chrome (83.0.4103.61)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Leeds', 'LS1', NULL, '53.810279846191', '-1.5444400310516', 0, '2020-12-07 15:31:56', '2020-12-07 15:31:58'),
(811, '34.228.64.137', 'Chrome (83.0.4103.61)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-08 01:46:50', '2020-12-08 01:46:50'),
(812, '134.175.228.189', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-12-08 02:08:50', '2020-12-08 02:08:50'),
(813, '209.17.96.146', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-08 07:03:09', '2020-12-08 07:03:09'),
(814, '46.42.68.23', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-08 07:03:23', '2020-12-08 07:03:54'),
(815, '13.66.139.24', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-08 08:18:12', '2020-12-10 17:46:10'),
(816, '177.227.26.65', 'Chrome (86.0.4240.198)', 'Android', '0', 'Guest', 'MX', 'Mexico', 'Sonora', 'San Luis', '83400', NULL, '32.478000640869', '-114.78295898438', 0, '2020-12-08 10:17:39', '2020-12-08 10:51:25'),
(817, '88.201.58.111', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-08 10:37:22', '2020-12-08 10:37:22'),
(818, '77.69.178.167', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-08 11:21:11', '2020-12-08 11:21:14'),
(819, '167.248.133.56', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-08 12:01:38', '2021-01-10 12:12:00'),
(820, '192.241.237.49', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-08 12:15:27', '2020-12-08 12:15:27'),
(821, '192.35.168.32', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-08 13:57:09', '2021-01-25 15:04:44'),
(822, '178.175.148.224', 'Chrome (36.0.1985.125)', 'OpenBSD', '0', 'Guest', 'MD', 'Moldova', 'Chișinău Municipality', 'Chisinau', 'MD-2000', NULL, '47.026901245117', '28.841600418091', 0, '2020-12-08 15:02:12', '2020-12-08 15:02:12'),
(823, '35.173.185.229', 'Chrome (83.0.4103.61)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-08 15:59:28', '2020-12-08 15:59:28'),
(824, '107.6.162.34', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2020-12-08 17:03:55', '2020-12-08 17:03:55'),
(825, '192.35.168.240', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-08 17:07:26', '2020-12-08 17:07:26'),
(826, '196.52.43.102', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-08 18:21:56', '2021-01-13 13:20:07'),
(827, '104.197.170.27', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-12-08 19:16:31', '2020-12-08 19:16:32'),
(828, '104.236.212.203', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-08 19:22:21', '2021-02-02 02:32:21'),
(829, '40.77.167.3', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Boydton', '23917', NULL, '36.667999267578', '-78.388999938965', 0, '2020-12-08 19:26:58', '2020-12-08 19:26:58'),
(830, '128.14.209.242', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-12-08 19:33:05', '2021-01-27 18:37:53'),
(831, '54.36.149.25', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-12-08 20:48:22', '2020-12-08 20:48:22'),
(832, '78.46.63.108', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Nürnberg', '90403', NULL, '49.451999664307', '11.076800346375', 0, '2020-12-09 03:13:29', '2020-12-09 03:13:51'),
(833, '107.175.64.176', 'Chrome (65.0.3315.3)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-12-09 03:28:01', '2021-02-10 13:15:36'),
(834, '34.70.127.3', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-12-09 04:37:39', '2020-12-09 04:37:49'),
(835, '78.47.21.253', 'Edge (12.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-12-09 04:59:16', '2020-12-25 05:18:01'),
(836, '196.52.43.65', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-09 06:42:43', '2020-12-09 06:42:43'),
(837, '192.241.150.153', 'Chrome (79.0.3945.88)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-09 07:06:28', '2020-12-09 07:06:28'),
(838, '77.69.206.16', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-09 08:27:04', '2020-12-09 08:39:43'),
(839, '18.237.24.240', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-09 10:08:53', '2020-12-09 10:08:53'),
(840, '34.215.204.117', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-09 10:51:47', '2020-12-09 10:51:47'),
(841, '192.241.237.109', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-09 12:32:29', '2020-12-09 12:32:29'),
(842, '62.209.10.172', 'Chrome (86.0.4240.198)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-09 14:27:34', '2020-12-09 14:27:34'),
(843, '54.36.148.16', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-09 17:45:27', '2021-01-31 16:28:14'),
(844, '45.83.67.47', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2020-12-09 17:55:15', '2020-12-09 17:55:15'),
(845, '39.96.139.173', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-12-09 19:47:06', '2020-12-09 19:47:40'),
(846, '132.232.81.163', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-12-09 19:58:05', '2021-01-08 01:49:39'),
(847, '34.222.157.174', 'Chrome (76.0.3809.100)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-09 20:22:22', '2020-12-09 20:22:24'),
(848, '77.247.181.162', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-09 20:26:21', '2021-01-22 07:20:49'),
(849, '185.220.101.19', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Indio', '92201', NULL, '33.703399658203', '-116.22918701172', 0, '2020-12-09 20:26:45', '2020-12-09 20:26:45'),
(850, '54.158.181.62', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-09 21:55:40', '2020-12-09 21:55:41'),
(851, '192.71.44.44', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-10 00:06:41', '2021-01-03 02:00:13'),
(852, '205.169.39.137', 'Chrome (79.0.3945.79)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Santa Clara', '95054', NULL, '37.396308898926', '-121.96140289307', 0, '2020-12-10 02:51:14', '2020-12-10 02:51:28'),
(853, '122.170.2.19', 'Chrome (80.0.3987.87)', 'Linux', '0', 'Guest', 'IN', 'India', 'Maharashtra', 'Powai', '400070', NULL, '19.076000213623', '72.877700805664', 0, '2020-12-10 03:46:20', '2020-12-10 10:30:23'),
(854, '188.152.255.27', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IT', 'Italy', 'Piedmont', 'Ivrea', '10015', NULL, '45.466609954834', '7.8759498596191', 0, '2020-12-10 06:35:06', '2020-12-10 06:35:06'),
(855, '192.3.57.205', 'Chrome (66.0.3359.170)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95113', NULL, '37.334060668945', '-121.89206695557', 0, '2020-12-10 07:33:13', '2020-12-10 07:33:17'),
(856, '20.186.65.192', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Boydton', '23917', NULL, '36.667999267578', '-78.388999938965', 0, '2020-12-10 08:05:54', '2020-12-10 08:05:56'),
(857, '84.255.132.226', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-10 08:19:19', '2020-12-10 08:19:19'),
(858, '52.175.194.251', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-10 08:39:31', '2021-01-07 17:32:29'),
(859, '77.88.5.27', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2020-12-10 09:48:53', '2021-02-03 11:12:37'),
(860, '54.36.148.58', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-10 09:51:45', '2020-12-10 09:51:45'),
(861, '52.191.175.166', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-10 12:31:38', '2020-12-24 07:17:26'),
(862, '51.83.187.201', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'PL', 'Poland', 'Lower Silesia', 'Wrocław', '50-088', NULL, '51.078601837158', '17.053199768066', 0, '2020-12-10 12:57:21', '2020-12-10 12:57:21'),
(863, '192.241.239.135', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-10 13:10:29', '2020-12-10 13:10:29'),
(864, '106.53.82.40', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-12-10 22:50:04', '2021-01-14 18:23:56'),
(865, '10.64.49.29', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-11 05:32:45', '2020-12-11 05:32:45'),
(866, '54.36.148.216', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-11 05:37:29', '2020-12-11 05:37:29'),
(867, '185.156.73.64', 'Chrome (72.0.3626.121)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'Friesland', 'Drachten', '8435', NULL, '53.035938262939', '6.2245101928711', 0, '2020-12-11 06:13:16', '2020-12-11 06:13:16'),
(868, '13.66.139.136', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-11 06:58:33', '2020-12-15 17:21:07'),
(869, '184.105.247.194', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-12-11 07:36:24', '2020-12-22 00:12:57'),
(870, '128.14.209.154', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-12-11 14:27:50', '2021-02-01 13:52:17'),
(871, '116.232.112.91', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-12-11 20:04:56', '2020-12-11 20:05:10'),
(872, '52.246.168.148', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Tokyo', '162-0843', NULL, '35.689498901367', '139.69169616699', 0, '2020-12-11 21:20:12', '2020-12-11 21:20:13'),
(873, '54.36.148.234', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-12 02:16:28', '2020-12-12 02:16:28'),
(874, '3.26.51.149', 'Chrome (83.0.4103.97)', 'Apple', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.868900299072', '151.20710754395', 0, '2020-12-12 03:16:56', '2020-12-12 03:16:56'),
(875, '89.147.68.255', 'Firefox (61.0)', 'Windows', '0', 'Guest', 'HU', 'Hungary', 'Budapest', 'Budapest', '1191', NULL, '47.4599609375', '19.14967918396', 0, '2020-12-12 04:31:54', '2020-12-13 10:36:05'),
(876, '223.181.66.61', 'Chrome (87.0.4280.67)', 'Apple', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Bachhraon', '244225', NULL, '28.922899246216', '78.231002807617', 0, '2020-12-12 06:50:38', '2020-12-12 06:50:38'),
(877, '192.241.238.4', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-12 07:16:00', '2020-12-12 07:16:00'),
(878, '51.143.32.186', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-12 07:51:36', '2020-12-12 07:51:36'),
(879, '71.6.146.185', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2020-12-12 08:46:45', '2020-12-12 08:46:45'),
(880, '34.214.106.248', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-12 10:03:40', '2020-12-12 10:03:40'),
(881, '51.222.43.159', 'Chrome (45.0.2454.94)', 'Android', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-12-12 10:26:58', '2020-12-12 10:27:39'),
(882, '51.77.246.76', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-12 10:27:50', '2020-12-12 10:27:50'),
(883, '192.71.225.127', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-12 16:27:11', '2020-12-12 16:27:11'),
(884, '117.50.60.193', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-12-12 18:36:24', '2020-12-12 18:36:24'),
(885, '106.75.85.117', 'Chrome (49.0.2623.112)', 'Windows', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2020-12-12 18:36:28', '2021-01-13 23:49:07'),
(886, '5.8.10.202', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '192029', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-12 18:39:23', '2021-02-07 19:16:09'),
(887, '51.38.80.4', 'Firefox (78.0)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Blackheath', 'EC3R', NULL, '51.512218475342', '0', 0, '2020-12-12 22:05:44', '2020-12-12 22:05:44'),
(888, '193.218.118.235', 'Firefox (78.0)', 'Windows', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv City', 'Kyiv', '04116', NULL, '50.454700469971', '30.52379989624', 0, '2020-12-12 22:08:20', '2020-12-12 22:08:20'),
(889, '77.247.181.165', 'Firefox (78.0)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-12 22:42:27', '2020-12-12 22:42:27'),
(890, '49.150.42.249', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'PH', 'Philippines', 'Cagayan Valley', 'Tuguegarao', NULL, NULL, '17.634719848633', '121.79138946533', 0, '2020-12-13 01:11:20', '2020-12-13 01:11:20'),
(891, '168.119.143.102', 'Chrome (78.0.3904.108)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-12-13 04:39:16', '2020-12-13 04:39:16'),
(892, '185.220.101.3', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Indio', '92201', NULL, '33.703399658203', '-116.22918701172', 0, '2020-12-13 06:52:01', '2020-12-13 06:52:01'),
(893, '80.82.77.33', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-13 10:36:06', '2021-02-05 06:26:17'),
(894, '45.72.102.20', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-12-13 13:37:00', '2020-12-13 13:37:00'),
(895, '54.36.149.88', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Grenoble', '38000', NULL, '45.194278717041', '5.7316298484802', 0, '2020-12-13 15:29:46', '2020-12-13 15:29:46'),
(896, '23.129.64.209', 'Firefox (78.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2020-12-13 23:10:54', '2020-12-13 23:10:54'),
(897, '185.141.63.14', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BG', 'Bulgaria', 'Sofia-Capital', 'Sofia', '1000', NULL, '42.690601348877', '23.327199935913', 0, '2020-12-14 04:59:41', '2021-02-01 08:48:05'),
(898, '34.215.35.43', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-14 05:28:04', '2020-12-14 05:28:04'),
(899, '62.165.226.252', 'Firefox (61.0)', 'Windows', '0', 'Guest', 'HU', 'Hungary', 'Budapest', 'Budapest', '1191', NULL, '47.4599609375', '19.14967918396', 0, '2020-12-14 06:13:02', '2020-12-15 12:10:37'),
(900, '104.161.21.102', 'Firefox (63.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Arizona', 'Alhambra', '85034', NULL, '33.432018280029', '-112.0124206543', 0, '2020-12-14 08:15:11', '2020-12-14 08:15:11'),
(901, '157.55.39.130', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-14 09:05:12', '2020-12-14 09:05:12'),
(902, '65.60.11.210', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2020-12-14 09:15:15', '2021-01-13 03:16:21'),
(903, '109.63.1.42', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-14 09:32:42', '2020-12-14 09:32:42'),
(904, '54.36.148.172', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-14 11:36:10', '2020-12-14 11:36:10'),
(905, '69.50.234.201', 'Chrome (80.0.3987.122)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90035', NULL, '34.052108764648', '-118.38526916504', 0, '2020-12-14 12:20:18', '2020-12-14 12:20:18'),
(906, '216.74.72.76', 'Firefox (13.0.1,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Alabama', 'Center Point', '35209', NULL, '33.464530944824', '-86.806571960449', 0, '2020-12-14 13:07:55', '2020-12-14 13:07:55'),
(907, '18.205.20.99', 'Chrome (70.0.3538.77)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-14 13:51:54', '2020-12-14 13:51:54'),
(908, '37.231.178.25', 'Chrome (83.0.4103.116)', 'Apple', '0', 'Guest', 'KW', 'Kuwait', 'Hawalli', 'Ḩawallī', NULL, NULL, '29.333330154419', '48.066669464111', 0, '2020-12-14 15:18:57', '2020-12-14 15:19:08'),
(909, '193.188.123.62', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-14 15:25:04', '2020-12-14 15:25:04'),
(910, '209.17.96.42', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-14 16:11:31', '2020-12-14 16:11:31'),
(911, '208.100.26.230', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60607', NULL, '41.87446975708', '-87.650062561035', 0, '2020-12-14 16:28:39', '2020-12-14 16:30:32'),
(912, '37.46.150.7', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-14 18:19:21', '2020-12-14 18:19:21'),
(913, '193.118.55.146', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2020-12-14 22:18:55', '2021-01-20 16:50:36'),
(914, '92.118.160.45', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2020-12-14 23:32:38', '2020-12-14 23:32:38'),
(915, '71.6.146.186', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2020-12-15 01:53:54', '2021-01-01 01:38:33'),
(916, '144.202.124.67', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90012', NULL, '34.065551757812', '-118.24053955078', 0, '2020-12-15 02:41:19', '2020-12-15 02:41:19'),
(917, '52.191.188.128', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-15 05:24:48', '2020-12-15 19:10:18'),
(918, '192.71.12.140', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-15 08:26:30', '2020-12-31 10:05:02'),
(919, '195.154.61.206', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-12-15 09:14:59', '2020-12-15 09:14:59'),
(920, '62.210.10.77', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-12-15 09:34:02', '2021-02-09 00:33:26'),
(921, '172.105.199.148', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Pennsylvania', 'Philadelphia', '19106', NULL, '39.948841094971', '-75.14427947998', 0, '2020-12-15 09:53:36', '2020-12-16 11:40:29'),
(922, '172.104.99.225', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Tokyo', '162-0843', NULL, '35.696281433105', '139.7385559082', 0, '2020-12-15 11:12:29', '2020-12-15 11:12:29'),
(923, '92.118.160.41', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2020-12-15 12:32:43', '2020-12-18 01:44:57'),
(924, '192.241.206.62', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-15 14:40:23', '2020-12-15 14:40:23'),
(925, '134.209.124.159', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-15 14:48:52', '2020-12-15 21:49:53'),
(926, '45.147.7.56', 'Firefox (13.0.1,)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2020-12-15 14:52:29', '2020-12-15 14:52:29'),
(927, '51.141.162.191', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-15 15:18:58', '2020-12-15 15:18:58'),
(928, '52.38.229.246', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.835998535156', '-119.69899749756', 0, '2020-12-15 15:42:45', '2020-12-15 15:50:29'),
(929, '54.80.194.250', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-15 20:07:35', '2020-12-15 20:07:35'),
(930, '185.102.11.242', 'Chrome (87.0.4280.66)', 'Linux', '0', 'Guest', 'RU', 'Russia', 'Leningradskaya Oblast\'', 'Sertolovo', '194361', NULL, '60.102199554443', '30.21310043335', 0, '2020-12-15 20:09:19', '2020-12-15 20:09:19'),
(931, '84.17.46.200', 'Opera (32.0.1948.45)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-15 20:21:13', '2020-12-15 20:21:13'),
(932, '191.101.88.42', 'Firefox (10.0.1)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2020-12-15 21:18:19', '2020-12-15 21:18:19'),
(933, '192.3.139.168', 'Firefox (78.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Brockport', '14420', NULL, '43.209968566895', '-77.914260864258', 0, '2020-12-15 21:18:25', '2020-12-15 21:18:25'),
(934, '185.220.100.240', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bayern', 'Hassfurt', '97437', NULL, '50.031539916992', '10.506739616394', 0, '2020-12-16 01:09:54', '2020-12-16 01:09:54'),
(935, '144.76.120.197', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-12-16 02:40:20', '2020-12-16 02:41:23'),
(936, '71.6.135.131', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2020-12-16 04:50:27', '2020-12-16 04:50:27');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(937, '94.102.56.151', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-16 06:49:49', '2020-12-16 07:11:52'),
(938, '156.96.150.119', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Calabasas', '91416', NULL, '34.159198760986', '-118.50029754639', 0, '2020-12-16 07:56:03', '2020-12-16 07:56:03'),
(939, '52.250.52.113', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.234001159668', '-119.85199737549', 0, '2020-12-16 09:23:08', '2020-12-16 09:23:08'),
(940, '84.17.49.107', 'Chrome (67.0.3396.62)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2020-12-16 11:12:07', '2020-12-16 11:12:10'),
(941, '187.64.133.146', 'Chrome (75.0.3770.80)', 'Windows', '0', 'Guest', 'BR', 'Brazil', 'Espírito Santo', 'Vitória', '29010-001', NULL, '-20.322189331055', '-40.338088989258', 0, '2020-12-16 13:42:33', '2020-12-16 13:42:33'),
(942, '52.215.61.208', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-12-16 13:48:53', '2020-12-16 13:48:53'),
(943, '192.241.219.38', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-16 14:42:26', '2020-12-16 14:42:26'),
(944, '128.14.209.250', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2020-12-16 17:01:40', '2021-01-19 11:28:55'),
(945, '45.7.171.48', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'BR', 'Brazil', 'Rio Grande do Sul', 'Porto Alegre', '90010-000', NULL, '-30.039119720459', '-51.232849121094', 0, '2020-12-16 23:59:04', '2020-12-16 23:59:49'),
(946, '162.142.125.56', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-17 02:25:29', '2021-01-26 23:10:05'),
(947, '66.240.236.119', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2020-12-17 03:25:31', '2020-12-17 03:25:31'),
(948, '132.251.3.146', 'Chrome (76.0.3809.132)', 'Android', '0', 'Guest', 'PE', 'Peru', 'Lima region', 'Breña', NULL, NULL, '-12.050000190735', '-77.050003051758', 0, '2020-12-17 03:39:55', '2020-12-17 03:39:55'),
(949, '13.66.139.119', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-17 05:27:42', '2020-12-17 15:30:09'),
(950, '216.218.206.66', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-12-17 08:08:17', '2020-12-17 08:08:17'),
(951, '209.17.96.154', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-17 10:34:13', '2020-12-17 10:34:13'),
(952, '109.234.37.227', 'Chrome (75.0.3770.100)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-17 11:20:53', '2020-12-17 11:20:53'),
(953, '54.203.73.198', 'Firefox (82.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2020-12-17 16:08:06', '2020-12-17 16:08:06'),
(954, '102.165.30.21', 'unknown (unknown)', 'unknown', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.867141723633', '151.20710754395', 0, '2020-12-18 03:24:33', '2020-12-18 03:24:33'),
(955, '13.66.139.105', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-18 03:33:09', '2020-12-18 04:43:26'),
(956, '192.71.30.89', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-18 04:32:10', '2020-12-18 04:32:10'),
(957, '74.82.47.2', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2020-12-18 04:32:29', '2020-12-26 05:22:49'),
(958, '118.24.116.20', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2020-12-18 08:01:41', '2020-12-18 08:06:15'),
(959, '88.99.220.218', 'Chrome (66.0.3359.139)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '10243', NULL, '52.514701843262', '13.438599586487', 0, '2020-12-18 10:20:38', '2020-12-18 10:20:42'),
(960, '13.66.139.154', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-18 14:47:06', '2020-12-18 14:47:06'),
(961, '74.120.14.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2020-12-18 18:11:04', '2021-02-10 22:28:37'),
(962, '39.96.137.146', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2020-12-18 18:19:22', '2020-12-18 18:19:47'),
(963, '147.139.40.255', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IN', 'India', 'Maharashtra', 'Powai', '400070', NULL, '19.076000213623', '72.877700805664', 0, '2020-12-18 21:31:32', '2020-12-18 21:31:40'),
(964, '18.236.167.105', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2020-12-18 22:14:21', '2020-12-18 22:14:21'),
(965, '54.36.149.64', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-18 22:33:52', '2020-12-18 22:33:52'),
(966, '18.202.167.228', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-12-19 03:30:03', '2020-12-19 03:30:03'),
(967, '13.66.139.84', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-19 04:03:11', '2021-01-06 12:38:04'),
(968, '77.69.150.180', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-19 08:08:47', '2020-12-19 08:08:47'),
(969, '3.80.5.56', 'Firefox (28.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-19 09:35:48', '2020-12-19 09:36:00'),
(970, '192.241.221.72', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-19 09:53:54', '2020-12-19 09:53:54'),
(971, '69.160.160.54', 'Chrome (80.0.3987.132)', 'Linux', '0', 'Guest', 'US', 'United States', 'Illinois', 'Glenview', '60025', NULL, '42.080150604248', '-87.823257446289', 0, '2020-12-19 10:05:00', '2020-12-19 10:05:00'),
(972, '45.146.164.15', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-19 10:31:41', '2020-12-22 06:51:12'),
(973, '178.32.197.94', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Pays de la Loire', 'Nantes', '44000', NULL, '47.21683883667', '-1.5567400455475', 0, '2020-12-19 14:36:08', '2020-12-19 14:36:08'),
(974, '198.20.69.98', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2020-12-19 17:18:42', '2021-01-14 10:49:20'),
(975, '207.46.13.148', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-19 18:18:12', '2020-12-20 18:11:39'),
(976, '54.36.148.82', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-19 19:28:47', '2021-01-06 18:07:12'),
(977, '94.102.49.193', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2020-12-19 20:41:45', '2020-12-19 20:41:45'),
(978, '34.123.146.201', 'Chrome (52.0.2743.82)', 'Windows', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-12-19 23:33:10', '2020-12-19 23:33:13'),
(979, '5.188.84.95', 'Chrome (83.0.4099.2)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '192029', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-20 04:43:41', '2020-12-20 04:43:44'),
(980, '34.223.43.91', 'Firefox (57.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2020-12-20 05:10:24', '2020-12-20 05:10:24'),
(981, '103.84.160.21', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'LK', 'Sri Lanka', 'Western', 'Colombo', '00100', NULL, '6.9349999427795', '79.84400177002', 0, '2020-12-20 06:17:21', '2020-12-20 06:19:25'),
(982, '77.109.191.140', 'Firefox (68.0)', 'Windows', '0', 'Guest', 'CH', 'Switzerland', 'Zurich', 'Winterthur', '8406', NULL, '47.489219665527', '8.7032299041748', 0, '2020-12-20 06:31:21', '2020-12-20 06:31:21'),
(983, '34.253.225.182', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-12-20 08:24:41', '2020-12-20 08:24:41'),
(984, '209.17.96.82', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-20 09:51:22', '2020-12-20 09:51:22'),
(985, '122.139.215.188', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'CN', 'China', 'Jilin', 'Shuangyang', '130000', NULL, '43.869998931885', '125.34999847412', 0, '2020-12-20 10:55:19', '2020-12-20 10:55:19'),
(986, '23.229.25.92', 'Chrome (66.0.3359.106)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-12-20 11:17:12', '2021-01-02 12:48:42'),
(987, '192.241.224.163', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-20 12:01:15', '2020-12-20 12:01:15'),
(988, '202.102.144.121', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Shandong', 'Shengli', '257000', NULL, '37.485279083252', '118.48500061035', 0, '2020-12-20 14:06:48', '2021-02-08 23:14:00'),
(989, '54.36.149.62', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-20 14:18:37', '2020-12-20 14:18:37'),
(990, '191.96.191.71', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2020-12-20 17:22:18', '2020-12-20 17:22:18'),
(991, '34.70.122.234', 'Chrome (52.0.2743.82)', 'Windows', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2020-12-20 19:36:50', '2020-12-20 19:36:53'),
(992, '66.249.72.59', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2020-12-20 19:37:59', '2021-01-03 20:53:22'),
(993, '205.251.150.170', 'Firefox (62.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'Texas', 'Houston', '77007', NULL, '29.770420074463', '-95.410583496094', 0, '2020-12-20 22:04:39', '2020-12-20 22:04:42'),
(994, '89.251.42.105', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', 'HU', 'Hungary', 'Budapest', 'Budapest', '1191', NULL, '47.4599609375', '19.14967918396', 0, '2020-12-20 23:30:18', '2020-12-20 23:30:18'),
(995, '5.188.210.16', 'Chrome (66.0.3359.117)', 'Apple', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '195269', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-21 03:39:35', '2020-12-22 09:58:37'),
(996, '209.17.96.130', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-21 08:15:42', '2020-12-21 08:15:42'),
(997, '47.242.209.240', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Mateo', '94402', NULL, '37.539791107178', '-122.32969665527', 0, '2020-12-21 08:32:20', '2020-12-21 08:34:56'),
(998, '54.36.148.45', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-21 09:48:52', '2021-01-23 10:22:01'),
(999, '192.241.221.239', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-21 13:41:53', '2020-12-21 13:41:53'),
(1000, '40.65.119.89', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-21 16:25:28', '2021-02-03 21:39:57'),
(1001, '167.114.175.39', 'Firefox (72.0)', 'Linux', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-12-21 20:30:19', '2021-01-20 05:08:29'),
(1002, '207.46.13.77', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2020-12-21 21:08:41', '2020-12-21 21:08:41'),
(1003, '196.52.43.61', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-21 21:26:11', '2020-12-21 21:26:11'),
(1004, '143.110.148.88', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Minnesota', 'Duluth', '55811', NULL, '46.848949432373', '-92.20142364502', 0, '2020-12-21 22:22:39', '2020-12-21 22:22:40'),
(1005, '194.67.109.236', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'Moscow', 'Moscow', '125476', NULL, '55.840549468994', '37.405330657959', 0, '2020-12-22 02:31:21', '2020-12-22 02:31:21'),
(1006, '54.36.148.178', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2020-12-22 05:44:02', '2021-02-10 13:25:36'),
(1007, '77.69.171.244', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-22 09:05:57', '2020-12-22 09:05:57'),
(1008, '5.141.244.97', 'Chrome (35.0.1916.47)', 'Apple', '0', 'Guest', 'RU', 'Russia', 'Sverdlovsk', 'Yekaterinburg', '620000', NULL, '56.842781066895', '60.58943939209', 0, '2020-12-22 09:24:59', '2020-12-22 09:25:18'),
(1009, '196.52.43.112', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-22 11:25:50', '2020-12-22 11:25:50'),
(1010, '192.241.211.109', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2020-12-22 13:58:24', '2020-12-22 13:58:24'),
(1011, '45.155.205.108', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2020-12-22 17:25:04', '2021-02-11 06:31:40'),
(1012, '37.131.49.139', 'iPhone (14.0)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2020-12-22 17:51:44', '2020-12-22 17:51:44'),
(1013, '140.82.56.190', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Haarlem', '2031', NULL, '52.388439178467', '4.6565098762512', 0, '2020-12-22 19:44:39', '2020-12-22 19:44:39'),
(1014, '183.81.152.82', 'Chrome (67.0.3396.62)', 'Apple', '0', 'Guest', 'ID', 'Indonesia', 'Jakarta', 'Jakarta', '12710', NULL, '-6.236499786377', '106.82230377197', 0, '2020-12-22 23:05:52', '2020-12-22 23:08:24'),
(1015, '44.225.84.206', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2020-12-22 23:32:34', '2020-12-22 23:32:37'),
(1016, '54.160.145.198', 'Chrome (73.0.3679.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-23 01:05:22', '2020-12-23 01:05:22'),
(1017, '52.87.143.91', 'Chrome (73.0.3679.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-23 01:05:35', '2020-12-23 01:05:35'),
(1018, '52.201.248.178', 'Chrome (73.0.3679.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2020-12-23 01:05:51', '2020-12-23 01:05:51'),
(1019, '44.224.22.196', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2020-12-23 02:41:08', '2020-12-23 02:41:11'),
(1020, '198.36.31.135', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'VI', 'U.S. Virgin Islands', 'Saint Thomas Island', 'Charlotte Amalie', '00804', NULL, '18.343599319458', '-64.931396484375', 0, '2020-12-23 03:24:25', '2020-12-23 03:25:03'),
(1021, '83.143.86.62', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'NO', 'Norway', 'Oslo', 'Oslo', '1006', NULL, '59.916400909424', '10.736300468445', 0, '2020-12-23 04:15:30', '2021-01-02 15:21:43'),
(1022, '185.102.186.42', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv', 'Irpin', '07740', NULL, '50.489700317383', '30.328899383545', 0, '2020-12-23 04:44:40', '2020-12-23 04:44:50'),
(1023, '194.228.84.10', 'Chrome (45.0.2454.101)', 'Windows', '0', 'Guest', 'CZ', 'Czechia', 'Hlavní město Praha', 'Prague', '130 00', NULL, '50.083919525146', '14.486209869385', 0, '2020-12-23 09:16:34', '2020-12-23 09:16:36'),
(1024, '192.71.3.26', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2020-12-23 12:07:40', '2020-12-23 12:07:40'),
(1025, '209.17.97.18', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Florida', 'Flagami', '33144', NULL, '25.762859344482', '-80.311958312988', 0, '2020-12-23 12:11:20', '2021-01-08 11:17:50'),
(1026, '62.210.91.14', 'Firefox (77.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2020-12-23 12:24:19', '2020-12-23 12:24:19'),
(1027, '192.3.240.232', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2020-12-23 15:28:46', '2020-12-23 15:28:46'),
(1028, '192.227.241.70', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90014', NULL, '34.043029785156', '-118.25227355957', 0, '2020-12-23 15:29:35', '2020-12-23 15:31:25'),
(1029, '192.241.225.82', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2020-12-23 15:45:06', '2020-12-23 15:45:06'),
(1030, '138.201.220.92', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2020-12-23 15:57:50', '2021-01-24 16:03:09'),
(1031, '40.77.167.19', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Boydton', '23917', NULL, '36.640468597412', '-78.269950866699', 0, '2020-12-23 18:36:47', '2021-01-05 18:33:41'),
(1032, '209.141.47.50', 'Internet Explorer (10.0,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Nevada', 'Spring Valley', '89146', NULL, '36.142398834229', '-115.22485351562', 0, '2020-12-23 21:10:14', '2020-12-23 21:10:14'),
(1033, '45.83.67.33', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2020-12-23 21:48:51', '2020-12-23 21:48:51'),
(1034, '52.48.109.47', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2020-12-23 22:33:08', '2020-12-23 22:33:08'),
(1035, '54.39.243.100', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2020-12-23 23:27:46', '2021-01-29 02:48:48'),
(1036, '219.243.212.100', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100084', NULL, '39.959911346436', '116.29805755615', 0, '2020-12-24 01:57:11', '2020-12-24 01:57:11'),
(1037, '104.236.25.191', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2020-12-24 06:16:42', '2021-01-11 20:07:10'),
(1038, '138.128.84.166', 'Safari (11.1.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-12-24 13:32:23', '2020-12-24 13:32:26'),
(1039, '171.13.14.83', 'Chrome (75.0.3765.0)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Zhengzhou', '450000', NULL, '34.741111755371', '113.68556213379', 0, '2020-12-24 13:52:52', '2020-12-24 13:52:52'),
(1040, '192.241.219.72', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2020-12-24 17:58:07', '2020-12-24 17:58:07'),
(1041, '107.152.176.78', 'Opera (46.0.2597.57)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2020-12-24 18:23:13', '2020-12-24 18:23:13'),
(1042, '173.82.19.182', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Santa Clarita', '91387', NULL, '34.424739837646', '-118.4100189209', 0, '2020-12-24 19:25:40', '2020-12-24 19:25:40'),
(1043, '196.52.43.94', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2020-12-24 21:01:28', '2020-12-24 21:01:28'),
(1044, '172.104.15.54', 'Firefox (8.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Newark', '07103', NULL, '40.738731384277', '-74.194526672363', 0, '2020-12-24 22:05:24', '2020-12-24 22:05:24'),
(1045, '173.255.227.31', 'Firefox (8.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 23:15:06', '2020-12-24 23:15:06'),
(1046, '165.22.12.127', 'Chrome (79.0.3945.88)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 23:21:34', '2020-12-24 23:21:34'),
(1047, '84.17.48.9', 'Chrome (67.0.3396.79)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 02:44:39', '2020-12-25 02:44:42'),
(1048, '34.207.152.110', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 03:08:30', '2020-12-25 03:08:30'),
(1049, '89.187.168.130', 'Chrome (67.0.3396.62)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 03:57:45', '2020-12-25 03:57:48'),
(1050, '54.36.148.7', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 13:37:42', '2020-12-25 13:37:42'),
(1051, '102.165.30.5', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 14:04:48', '2021-01-19 22:38:59'),
(1052, '173.214.194.16', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 16:18:43', '2020-12-25 16:18:43'),
(1053, '138.99.216.112', 'Chrome (72.0.3626.121)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 17:33:41', '2020-12-25 17:33:41'),
(1054, '60.191.20.213', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 19:20:02', '2020-12-25 19:20:02'),
(1055, '34.208.22.0', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 19:44:36', '2020-12-25 19:44:36'),
(1056, '35.166.206.14', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-25 19:44:38', '2020-12-25 19:44:38'),
(1057, '37.120.156.19', 'Chrome (68.0.3440.106)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 06:48:51', '2020-12-26 06:48:55'),
(1058, '54.36.149.94', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 09:01:44', '2020-12-26 09:01:44'),
(1059, '192.241.196.212', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 10:09:00', '2020-12-26 10:09:00'),
(1060, '13.82.133.51', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 11:20:26', '2020-12-29 12:03:40'),
(1061, '37.131.56.64', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 14:00:54', '2020-12-26 14:00:54'),
(1062, '3.236.150.98', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 15:15:39', '2020-12-26 15:15:41'),
(1063, '3.236.213.243', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 15:17:25', '2020-12-26 15:17:26'),
(1064, '116.203.81.97', 'Safari (11.0)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 18:17:46', '2020-12-26 18:17:46'),
(1065, '213.108.196.20', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 22:25:27', '2020-12-26 22:25:27'),
(1066, '37.46.150.24', 'Firefox (76.0)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 23:34:05', '2020-12-26 23:34:05'),
(1067, '3.250.238.246', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 07:56:16', '2020-12-27 07:56:16'),
(1068, '209.17.96.50', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 08:21:10', '2020-12-27 08:21:10'),
(1069, '145.239.1.18', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 08:30:12', '2020-12-27 08:30:12'),
(1070, '216.158.226.150', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 10:32:06', '2020-12-27 10:32:06'),
(1071, '192.241.219.174', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 11:02:59', '2020-12-27 11:02:59'),
(1072, '54.36.148.108', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 17:00:12', '2020-12-27 17:00:12'),
(1073, '213.166.69.250', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 17:58:12', '2020-12-27 17:58:12'),
(1074, '5.172.255.157', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 18:39:11', '2020-12-27 18:39:11'),
(1075, '104.45.143.21', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 21:27:45', '2020-12-29 16:43:35'),
(1076, '54.202.204.87', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 04:51:40', '2020-12-28 04:51:40'),
(1077, '37.131.121.231', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 06:44:51', '2020-12-28 06:44:51'),
(1078, '209.17.96.186', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 08:38:56', '2020-12-28 08:38:56'),
(1079, '34.247.32.199', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 10:08:20', '2020-12-28 10:08:20'),
(1080, '34.253.46.5', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 12:04:36', '2020-12-28 12:04:36'),
(1081, '192.241.211.49', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 13:37:25', '2020-12-28 13:37:25'),
(1082, '47.254.170.110', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 18:01:09', '2020-12-28 18:01:32'),
(1083, '192.36.52.37', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 19:55:55', '2020-12-28 19:55:55'),
(1084, '84.255.184.219', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 23:59:50', '2020-12-28 23:59:50'),
(1085, '34.82.182.44', 'Chrome (41.0.2225.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 01:15:42', '2020-12-29 01:15:42'),
(1086, '35.233.254.218', 'Chrome (41.0.2227.0)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 01:15:43', '2020-12-29 01:15:43'),
(1087, '34.105.126.152', 'Chrome (41.0.2226.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 01:15:45', '2020-12-29 01:15:45'),
(1088, '34.83.93.181', 'Chrome (40.0.2214.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 01:15:47', '2020-12-29 01:15:47'),
(1089, '170.247.112.133', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 01:48:49', '2020-12-29 01:48:49'),
(1090, '168.119.123.80', 'Safari (11.0)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 02:23:21', '2020-12-29 02:23:21'),
(1091, '192.240.225.61', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 03:23:48', '2020-12-29 03:23:48'),
(1092, '193.188.123.27', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 05:33:27', '2020-12-29 05:33:27'),
(1093, '102.165.30.37', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 07:47:04', '2020-12-29 07:47:04'),
(1094, '165.227.174.111', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 09:41:57', '2020-12-29 09:54:26'),
(1095, '175.24.31.147', 'Firefox (79.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 10:58:03', '2021-01-09 10:28:37'),
(1096, '89.248.167.150', 'Chrome (87.0.4280.88)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 10:59:00', '2020-12-29 10:59:00'),
(1097, '18.27.197.252', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 12:22:15', '2020-12-29 12:22:15'),
(1098, '51.15.218.190', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 12:22:17', '2020-12-29 12:22:17'),
(1099, '54.36.148.61', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 15:25:47', '2021-02-08 12:37:20'),
(1100, '37.131.121.242', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 16:06:47', '2021-01-10 06:51:09'),
(1101, '192.241.215.32', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 16:25:40', '2020-12-29 16:25:40'),
(1102, '13.52.196.43', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 16:54:55', '2020-12-29 16:54:55'),
(1103, '67.162.153.15', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 17:43:37', '2020-12-29 18:06:29'),
(1104, '165.227.60.136', 'Chrome (55.0.2883.87)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 17:43:40', '2021-01-02 14:15:51'),
(1105, '96.127.175.10', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 17:57:16', '2020-12-29 17:57:16'),
(1106, '192.35.168.80', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 19:17:28', '2020-12-29 19:17:28'),
(1107, '167.114.159.183', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 06:06:54', '2020-12-30 06:08:32'),
(1108, '40.75.117.244', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 06:22:35', '2020-12-31 16:40:18'),
(1109, '54.36.148.155', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 10:34:48', '2020-12-30 10:34:48'),
(1110, '84.255.129.67', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 11:32:20', '2020-12-30 13:45:33'),
(1111, '92.118.160.9', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 13:37:22', '2020-12-30 13:37:22'),
(1112, '192.186.134.116', 'Opera (52.0.2871.64)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 14:25:08', '2020-12-30 14:25:11'),
(1113, '54.67.119.116', 'Chrome (40.0.2214.93)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 14:56:45', '2020-12-30 14:56:45'),
(1114, '216.19.195.72', 'Chrome (5.0.375.86)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 17:12:41', '2020-12-30 17:12:41'),
(1115, '192.241.220.135', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 18:04:27', '2020-12-30 18:04:27'),
(1116, '176.110.125.233', 'Chrome (69.0.3451.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 19:05:08', '2020-12-30 19:05:12'),
(1117, '195.2.71.9', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 21:58:01', '2020-12-30 21:58:01'),
(1118, '51.15.184.118', 'Firefox (81.0)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 23:55:55', '2020-12-30 23:55:55'),
(1119, '46.180.14.7', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 00:41:47', '2021-01-06 23:20:14'),
(1120, '89.248.167.158', 'Chrome (87.0.4280.88)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 00:44:39', '2020-12-31 00:44:39'),
(1121, '54.36.148.84', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 05:35:44', '2020-12-31 05:35:44'),
(1122, '3.1.195.245', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 09:35:15', '2020-12-31 09:35:16'),
(1123, '100.20.101.144', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 10:15:40', '2020-12-31 10:15:40'),
(1124, '130.255.162.164', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 11:05:51', '2020-12-31 11:05:51'),
(1125, '93.158.90.53', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 11:06:17', '2020-12-31 11:06:17'),
(1126, '93.158.90.90', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 11:07:27', '2020-12-31 11:07:27'),
(1127, '51.15.127.88', 'Firefox (79.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 13:33:16', '2020-12-31 13:33:16'),
(1128, '3.137.199.58', 'Chrome (85.0.4183.102)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 14:42:02', '2020-12-31 14:42:04'),
(1129, '69.171.249.7', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 14:43:15', '2020-12-31 14:43:15'),
(1130, '69.171.249.119', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 14:43:17', '2020-12-31 14:43:17'),
(1131, '64.225.50.196', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:37:11', '2020-12-31 15:37:11'),
(1132, '62.210.57.28', 'Firefox (50.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 17:01:42', '2020-12-31 17:01:42'),
(1133, '77.81.139.41', 'Chrome (68.0.3440.106)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 18:20:36', '2020-12-31 18:20:40'),
(1134, '2600:1900:2000:9::1', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 19:07:21', '2020-12-31 19:07:21'),
(1135, '35.243.23.60', 'Internet Explorer (9.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 19:07:21', '2020-12-31 19:07:21'),
(1136, '192.241.215.162', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 19:43:01', '2020-12-31 19:43:01'),
(1137, '135.148.33.107', 'Internet Explorer (10.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 19:46:50', '2020-12-31 19:46:50'),
(1138, '128.199.221.172', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 20:13:19', '2020-12-31 20:13:19'),
(1139, '198.50.163.55', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 20:18:07', '2020-12-31 20:18:07'),
(1140, '66.249.72.63', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 22:19:08', '2020-12-31 22:19:08'),
(1141, '34.233.119.151', 'Chrome (51.0.3108.96)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-01 00:31:09', '2021-01-01 00:31:09'),
(1142, '34.78.164.233', 'Firefox (52.0)', 'Apple', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2021-01-01 01:10:16', '2021-01-01 01:10:16'),
(1143, '54.36.148.238', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-01 03:06:48', '2021-01-01 03:06:48'),
(1144, '87.95.250.140', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'FI', 'Finland', 'South Karelia', 'Lappeenranta', '53100', NULL, '60.986980438232', '28.064649581909', 0, '2021-01-01 03:15:46', '2021-01-01 03:17:14'),
(1145, '194.127.179.243', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', 'NL', 'Netherlands', 'Flevoland', 'Zeewolde', NULL, NULL, '52.299999237061', '5.4499998092651', 0, '2021-01-01 03:45:46', '2021-01-01 10:14:47'),
(1146, '93.158.90.85', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-01 04:13:25', '2021-01-01 04:13:25'),
(1147, '66.42.76.138', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98121', NULL, '47.613479614258', '-122.3473815918', 0, '2021-01-01 06:59:03', '2021-01-01 06:59:03'),
(1148, '196.52.43.59', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-01 08:35:18', '2021-01-01 08:35:18'),
(1149, '92.118.161.5', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', NULL, NULL, NULL, NULL, '37.880001068115', '-96.794998168945', 0, '2021-01-01 09:14:11', '2021-01-01 09:14:11'),
(1150, '46.105.58.112', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'FR', 'France', 'Auvergne-Rhône-Alpes', 'Clermont-Ferrand', '63000', NULL, '45.777168273926', '3.0824201107025', 0, '2021-01-01 09:19:27', '2021-01-08 06:09:58'),
(1151, '149.28.86.150', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90012', NULL, '34.065551757812', '-118.24053955078', 0, '2021-01-01 11:47:33', '2021-01-01 11:50:50'),
(1152, '81.91.132.130', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'IR', 'Iran', 'Tehrān', 'Tehran', '10000', NULL, '35.6872215271', '51.415279388428', 0, '2021-01-01 18:15:17', '2021-01-01 18:15:17'),
(1153, '173.252.111.112', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2021-01-01 18:26:14', '2021-01-01 18:26:14'),
(1154, '173.252.111.17', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Menlo Park', '94025', NULL, '37.459030151367', '-122.18605804443', 0, '2021-01-01 18:26:17', '2021-01-01 18:26:17'),
(1155, '93.158.90.32', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-01 20:44:22', '2021-01-01 20:44:22'),
(1156, '37.47.231.95', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', 'PL', 'Poland', 'Mazovia', 'Śródmieście', '00-025', NULL, '52.231700897217', '21.018339157104', 0, '2021-01-01 21:14:21', '2021-01-01 21:14:21'),
(1157, '66.249.79.240', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2021-01-02 00:22:09', '2021-01-17 01:52:07'),
(1158, '178.79.129.208', 'Chrome (83.0.4103.61)', 'Windows', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'City of Westminster', 'SE5', NULL, '51.457778930664', '-0.085560001432896', 0, '2021-01-02 02:52:14', '2021-01-02 02:52:16'),
(1159, '3.235.228.20', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-02 03:15:44', '2021-01-02 03:15:46'),
(1160, '93.158.90.42', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-02 05:06:39', '2021-01-02 05:06:39'),
(1161, '85.248.227.164', 'Chrome (35.0.2117.157)', 'Windows', '0', 'Guest', 'SK', 'Slovakia', 'Bratislavský', 'Bratislava', '851 01', NULL, '48.124660491943', '17.101980209351', 0, '2021-01-02 05:10:00', '2021-01-02 05:10:00'),
(1162, '23.129.64.197', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-01-02 09:18:27', '2021-01-02 09:18:27'),
(1163, '192.241.219.211', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-01-02 12:57:18', '2021-01-02 12:57:18'),
(1164, '209.17.96.138', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-02 15:55:15', '2021-01-02 15:55:15'),
(1165, '13.92.189.20', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-01-02 16:07:16', '2021-01-02 16:07:17'),
(1166, '93.158.90.103', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-02 17:42:44', '2021-01-08 03:13:50'),
(1167, '54.36.149.102', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-02 20:18:57', '2021-01-02 20:18:57'),
(1168, '52.4.78.98', 'Chrome (66.0.3359.66)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-02 21:11:43', '2021-01-25 14:14:59'),
(1169, '192.176.249.42', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-02 23:59:31', '2021-01-02 23:59:31'),
(1170, '154.12.163.178', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Reston', '20190', NULL, '38.960971832275', '-77.342468261719', 0, '2021-01-03 01:55:41', '2021-01-03 01:55:41'),
(1171, '23.250.118.53', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-03 01:55:53', '2021-01-03 01:55:53'),
(1172, '103.69.144.1', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'IN', 'India', 'West Bengal', 'Bagdogra', '734003', NULL, '26.776100158691', '88.41130065918', 0, '2021-01-03 02:15:32', '2021-01-03 02:15:32'),
(1173, '81.91.137.52', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'IR', 'Iran', 'Tehrān', 'Tehran', '10000', NULL, '35.6872215271', '51.415279388428', 0, '2021-01-03 03:28:10', '2021-01-05 03:53:54'),
(1174, '107.6.168.242', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2021-01-03 03:52:41', '2021-01-24 18:34:58'),
(1175, '70.191.206.230', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'US', 'United States', 'Florida', 'Pensacola', '32526', NULL, '30.496559143066', '-87.305938720703', 0, '2021-01-03 07:58:58', '2021-01-03 08:26:57'),
(1176, '77.69.178.233', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-03 08:25:04', '2021-01-03 08:25:04'),
(1177, '89.148.49.196', 'iPhone (14.0.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-03 12:34:14', '2021-01-03 14:15:46'),
(1178, '192.241.223.184', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-03 13:26:59', '2021-01-03 13:26:59'),
(1179, '89.248.168.108', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-03 13:47:54', '2021-01-10 04:56:57'),
(1180, '54.36.148.187', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-03 16:12:52', '2021-01-03 16:12:52'),
(1181, '49.51.161.236', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2021-01-03 18:29:02', '2021-01-03 18:30:44'),
(1182, '104.236.59.46', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-03 20:28:45', '2021-01-03 20:28:45'),
(1183, '104.168.173.144', 'Chrome (36.0.1985.67)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98168', NULL, '47.49010848999', '-122.29152679443', 0, '2021-01-03 22:06:57', '2021-01-03 22:06:57'),
(1184, '172.245.27.140', 'Chrome (66.0.3359.181)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-04 02:21:43', '2021-01-04 02:21:46'),
(1185, '80.82.65.82', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-04 02:44:11', '2021-01-11 14:44:58'),
(1186, '133.130.96.81', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Tokyo', '162-0843', NULL, '35.696281433105', '139.7385559082', 0, '2021-01-04 03:20:10', '2021-01-04 03:37:42'),
(1187, '45.33.59.137', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94536', NULL, '37.566989898682', '-121.98265838623', 0, '2021-01-04 03:41:55', '2021-01-04 03:41:57');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(1188, '47.112.112.25', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Fuyang', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2021-01-04 05:50:35', '2021-01-04 05:50:35'),
(1189, '34.211.110.84', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-01-04 10:05:48', '2021-01-04 10:05:48'),
(1190, '200.113.253.185', 'Chrome (87.0.4280.88)', 'Apple', '0', 'Guest', 'HT', 'Haiti', 'Ouest', 'Delmas 73', NULL, NULL, '18.543500900269', '-72.305000305176', 0, '2021-01-04 10:56:14', '2021-01-04 10:56:14'),
(1191, '206.81.12.65', 'Chrome (79.0.3945.88)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-04 12:11:56', '2021-01-04 12:11:56'),
(1192, '206.41.186.35', 'Vivalidi (1.95.1077.60)', 'Windows', '0', 'Guest', 'US', 'United States', 'Delaware', 'Middletown', '19709', NULL, '39.477100372314', '-75.671730041504', 0, '2021-01-04 13:21:38', '2021-01-04 13:21:45'),
(1193, '206.189.239.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-04 15:53:49', '2021-01-04 15:53:49'),
(1194, '54.36.148.98', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-04 15:59:10', '2021-01-04 15:59:10'),
(1195, '129.213.19.98', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-04 17:29:28', '2021-01-04 17:29:30'),
(1196, '192.241.218.109', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-04 19:04:40', '2021-01-04 19:04:40'),
(1197, '80.82.65.80', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-04 19:47:33', '2021-01-13 03:25:09'),
(1198, '204.48.18.3', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-04 20:21:18', '2021-01-04 20:21:18'),
(1199, '167.172.22.175', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-04 22:55:54', '2021-01-04 22:55:54'),
(1200, '192.241.225.22', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-05 01:36:05', '2021-01-05 01:36:05'),
(1201, '65.49.20.68', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2021-01-05 01:36:44', '2021-02-04 06:16:30'),
(1202, '196.52.43.122', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-05 03:17:31', '2021-01-05 03:17:31'),
(1203, '88.201.0.9', 'iPhone (14.0.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-05 03:42:07', '2021-01-05 03:42:07'),
(1204, '177.79.127.100', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', 'BR', 'Brazil', 'Rio De Janeiro', 'Trajano De Morais', '28750-000', NULL, '-22.063329696655', '-42.066390991211', 0, '2021-01-05 07:07:49', '2021-01-05 07:07:49'),
(1205, '45.154.35.210', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RU', 'Russia', NULL, NULL, NULL, NULL, '60', '100', 0, '2021-01-05 08:41:08', '2021-01-05 08:41:08'),
(1206, '93.158.90.12', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '758 03', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-05 14:21:07', '2021-01-07 08:31:29'),
(1207, '130.255.163.161', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Uppsala', 'Uppsala', '750 26', NULL, '59.858558654785', '17.638929367065', 0, '2021-01-05 14:21:36', '2021-01-05 14:21:36'),
(1208, '192.36.217.7', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-05 14:22:41', '2021-01-05 14:22:41'),
(1209, '54.36.148.15', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-05 16:42:26', '2021-01-05 16:42:26'),
(1210, '18.205.169.82', 'Firefox (4.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-05 17:45:58', '2021-01-11 02:39:40'),
(1211, '2.57.122.9', 'Chrome (74.0.3729.169)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'Flevoland', 'Zeewolde', NULL, NULL, '52.299999237061', '5.4499998092651', 0, '2021-01-05 17:50:46', '2021-01-05 17:50:48'),
(1212, '37.131.116.240', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-05 18:43:30', '2021-01-05 18:45:00'),
(1213, '192.241.193.87', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-05 19:05:43', '2021-01-05 19:05:43'),
(1214, '88.201.6.104', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-05 19:27:40', '2021-01-05 19:27:40'),
(1215, '46.214.3.38', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'RO', 'Romania', 'Sălaj', 'Şimleu Silvaniei', '455300', NULL, '47.226100921631', '22.803800582886', 0, '2021-01-05 20:40:28', '2021-01-05 20:40:28'),
(1216, '188.225.78.114', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '196084', NULL, '59.939041137695', '30.315790176392', 0, '2021-01-06 01:36:51', '2021-01-06 01:50:51'),
(1217, '2.57.122.18', 'Safari (9.0.2)', 'Apple', '0', 'Guest', 'NL', 'Netherlands', 'Flevoland', 'Zeewolde', NULL, NULL, '52.299999237061', '5.4499998092651', 0, '2021-01-06 03:53:23', '2021-01-22 01:43:29'),
(1218, '78.46.176.21', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2021-01-06 04:07:17', '2021-01-06 04:07:48'),
(1219, '66.249.66.133', 'Chrome (88.0.4324.153)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-06 05:14:54', '2021-02-09 13:33:25'),
(1220, '66.249.66.137', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-06 05:31:44', '2021-02-09 14:33:05'),
(1221, '196.52.43.126', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-06 05:38:58', '2021-01-06 05:38:58'),
(1222, '194.48.199.121', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'City of Westminster', 'SE1', NULL, '51.457778930664', '-0.085560001432896', 0, '2021-01-06 07:08:05', '2021-01-06 07:08:05'),
(1223, '192.36.24.93', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-06 07:44:51', '2021-01-06 07:44:51'),
(1224, '45.83.67.207', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2021-01-06 10:47:50', '2021-01-06 10:47:50'),
(1225, '209.17.96.170', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-06 10:48:39', '2021-01-06 10:48:39'),
(1226, '65.49.20.67', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2021-01-06 16:13:38', '2021-01-26 05:41:44'),
(1227, '93.103.161.199', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'SI', 'Slovenia', 'Ljubljana', 'Ljubljana', '1000', NULL, '46.00590133667', '14.49079990387', 0, '2021-01-06 17:11:43', '2021-01-06 17:11:56'),
(1228, '141.164.88.173', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90014', NULL, '34.043029785156', '-118.25227355957', 0, '2021-01-06 19:26:57', '2021-01-06 19:26:57'),
(1229, '178.32.197.80', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Pays de la Loire', 'Nantes', '44000', NULL, '47.21683883667', '-1.5567400455475', 0, '2021-01-06 20:00:42', '2021-01-06 20:00:42'),
(1230, '107.174.149.211', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-06 21:12:19', '2021-01-06 21:12:19'),
(1231, '192.210.194.176', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90014', NULL, '34.043029785156', '-118.25227355957', 0, '2021-01-06 21:12:48', '2021-01-06 21:14:45'),
(1232, '192.241.209.140', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-06 21:38:02', '2021-01-06 21:38:02'),
(1233, '192.121.146.160', 'Chrome (75.0.3729.169)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-07 00:12:50', '2021-01-07 00:12:50'),
(1234, '66.249.72.61', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2021-01-07 03:28:35', '2021-01-07 04:31:16'),
(1235, '183.88.88.130', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'TH', 'Thailand', 'Nonthaburi', 'Mueang Nonthaburi', '11000', NULL, '13.855560302734', '100.50805664062', 0, '2021-01-07 04:22:27', '2021-01-07 04:22:27'),
(1236, '45.154.255.147', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-07 10:08:20', '2021-01-07 10:08:20'),
(1237, '221.218.139.188', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Changping', '102205', NULL, '40.138999938965', '116.13999938965', 0, '2021-01-07 11:04:24', '2021-01-07 11:04:24'),
(1238, '13.66.139.89', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-07 11:28:21', '2021-01-11 16:23:01'),
(1239, '66.249.75.205', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-07 13:30:32', '2021-02-02 14:58:57'),
(1240, '54.36.148.24', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-07 14:05:58', '2021-01-07 14:05:58'),
(1241, '66.249.75.209', 'Chrome (88.0.4324.113)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-07 15:06:00', '2021-02-01 08:06:16'),
(1242, '128.199.63.209', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-07 17:13:36', '2021-01-07 17:26:26'),
(1243, '67.227.43.33', 'Chrome (80.0.3987.122)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2021-01-07 18:46:17', '2021-01-07 18:46:17'),
(1244, '40.77.167.22', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Boydton', '23917', NULL, '36.640468597412', '-78.269950866699', 0, '2021-01-07 19:40:51', '2021-01-19 20:01:13'),
(1245, '23.94.151.85', 'unknown (unknown)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-07 23:20:40', '2021-01-07 23:20:40'),
(1246, '107.173.248.142', 'Internet Explorer (9.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-07 23:20:50', '2021-01-07 23:20:50'),
(1247, '66.249.70.93', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2021-01-07 23:53:38', '2021-02-04 13:55:13'),
(1248, '104.236.39.157', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-07 23:59:17', '2021-01-07 23:59:21'),
(1249, '107.174.54.17', 'Mozilla (5.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 00:01:25', '2021-01-08 00:01:25'),
(1250, '107.152.255.173', 'Safari (4.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 00:01:31', '2021-01-08 00:01:31'),
(1251, '107.172.97.24', 'Safari (5.0.1)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 00:41:48', '2021-01-08 00:41:48'),
(1252, '23.250.52.110', 'Chrome (20.0.1092.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 00:41:58', '2021-01-08 00:41:58'),
(1253, '192.241.205.143', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-01-08 00:54:00', '2021-01-08 00:54:00'),
(1254, '34.219.19.120', 'Chrome (76.0.3809.100)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-01-08 01:07:20', '2021-01-08 01:07:21'),
(1255, '107.172.238.41', 'Safari (5.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 01:22:36', '2021-01-08 01:22:36'),
(1256, '104.227.209.22', 'Safari (unknown)', 'OpenBSD', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2021-01-08 01:22:45', '2021-01-08 01:22:45'),
(1257, '104.227.205.131', 'Mozilla (4.77)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2021-01-08 02:03:20', '2021-01-08 02:03:20'),
(1258, '192.3.139.165', 'Chrome (83.0.4103.106)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Gates-North Gates', '14420', NULL, '43.209968566895', '-77.914260864258', 0, '2021-01-08 02:03:34', '2021-01-08 02:03:34'),
(1259, '107.172.61.113', 'Galeon (1.3.14)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 02:44:23', '2021-01-08 02:44:23'),
(1260, '107.174.6.100', 'Konqueror (3.3)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 02:44:28', '2021-01-08 02:44:28'),
(1261, '112.206.14.111', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'PH', 'Philippines', 'Metro Manila', 'Las Piñas', NULL, NULL, '14.434700012207', '121.04019927979', 0, '2021-01-08 03:01:20', '2021-01-08 03:01:20'),
(1262, '138.68.31.85', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-01-08 05:24:05', '2021-01-08 05:24:05'),
(1263, '45.154.35.222', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RU', 'Russia', NULL, NULL, NULL, NULL, '60', '100', 0, '2021-01-08 08:29:15', '2021-01-08 08:29:15'),
(1264, '23.96.107.160', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-01-08 08:48:32', '2021-01-08 08:48:34'),
(1265, '104.197.177.121', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2021-01-08 08:50:07', '2021-01-08 08:50:13'),
(1266, '178.128.178.186', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-01-08 09:35:31', '2021-01-08 09:35:31'),
(1267, '165.227.11.244', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-08 09:35:45', '2021-01-08 09:35:45'),
(1268, '59.15.154.121', 'unknown (unknown)', 'unknown', '0', 'Guest', 'KR', 'South Korea', 'Gyeonggi-do', 'Seongnam-si', '462-723', NULL, '37.433280944824', '127.16436767578', 0, '2021-01-08 10:08:40', '2021-01-08 10:08:40'),
(1269, '192.210.241.131', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-08 10:28:23', '2021-01-08 10:28:23'),
(1270, '160.116.240.20', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2021-01-08 10:38:36', '2021-01-08 10:38:46'),
(1271, '107.172.134.146', 'Chrome (83.0.4103.116)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 19:05:38', '2021-01-08 19:05:38'),
(1272, '206.217.136.199', 'Firefox (76.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-08 19:05:46', '2021-01-08 19:05:46'),
(1273, '107.172.225.100', 'Firefox (5.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 19:36:59', '2021-01-08 19:36:59'),
(1274, '198.12.125.232', 'Chrome (4.0.277.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Gates-North Gates', '14420', NULL, '43.209968566895', '-77.914260864258', 0, '2021-01-08 19:37:07', '2021-01-08 19:37:07'),
(1275, '52.209.176.31', 'Chrome (84.0.4147.105)', 'Windows', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2021-01-08 19:57:40', '2021-01-08 19:57:40'),
(1276, '3.237.197.236', 'Chrome (84.0.4147.105)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-08 20:07:31', '2021-01-08 20:08:00'),
(1277, '198.46.234.175', 'Konqueror (3.5)', 'SunOS', '0', 'Guest', 'US', 'United States', 'New York', 'Gates-North Gates', '14420', NULL, '43.209968566895', '-77.914260864258', 0, '2021-01-08 20:08:40', '2021-01-08 20:08:40'),
(1278, '104.168.91.51', 'Firefox (64.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90014', NULL, '34.043029785156', '-118.25227355957', 0, '2021-01-08 20:08:47', '2021-01-08 20:08:47'),
(1279, '104.227.209.117', 'Internet Explorer (10.6)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2021-01-08 20:41:00', '2021-01-08 20:41:00'),
(1280, '192.3.211.240', 'Chrome (83.0.4103.106)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-08 20:41:08', '2021-01-08 20:41:08'),
(1281, '91.129.97.193', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'EE', 'Estonia', 'Harjumaa', 'Tallinn', '10001', NULL, '59.434799194336', '24.743679046631', 0, '2021-01-08 21:09:18', '2021-01-08 21:09:18'),
(1282, '23.250.3.77', 'Mozilla (5.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 21:12:43', '2021-01-08 21:12:43'),
(1283, '107.175.238.190', 'Firefox (10.0.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 21:12:50', '2021-01-08 21:12:50'),
(1284, '3.85.111.58', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-08 21:19:15', '2021-01-08 21:19:15'),
(1285, '206.189.135.73', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IN', 'India', 'Karnataka', 'Bengaluru', '560001', NULL, '12.971599578857', '77.594596862793', 0, '2021-01-08 21:30:06', '2021-01-08 21:30:06'),
(1286, '198.46.165.27', 'Internet Explorer (5.15)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-08 21:45:25', '2021-01-08 21:45:25'),
(1287, '172.245.106.184', 'Internet Explorer (7.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-08 21:45:34', '2021-01-08 21:45:34'),
(1288, '107.173.248.145', 'Mozilla (1.8)', 'SunOS', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 22:17:26', '2021-01-08 22:17:26'),
(1289, '107.173.201.78', 'Konqueror (4.5)', 'NetBSD', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-08 22:17:33', '2021-01-08 22:17:33'),
(1290, '167.71.175.10', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-09 03:48:23', '2021-01-09 03:48:23'),
(1291, '34.72.161.35', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2021-01-09 04:12:05', '2021-01-09 04:12:10'),
(1292, '196.52.43.123', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-09 05:30:10', '2021-01-15 15:25:06'),
(1293, '141.164.88.250', 'Chrome (56.0.2926.50)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90014', NULL, '34.043029785156', '-118.25227355957', 0, '2021-01-09 06:57:21', '2021-01-09 06:57:21'),
(1294, '91.236.177.162', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'Moscow Oblast', 'Stupino', '142800', NULL, '54.898361206055', '38.086719512939', 0, '2021-01-09 07:21:40', '2021-01-30 15:20:40'),
(1295, '37.131.60.61', 'Chrome (87.0.4280.141)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-09 09:40:55', '2021-01-10 14:58:21'),
(1296, '37.131.101.45', 'Chrome (87.0.4280.101)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-09 09:41:04', '2021-01-09 10:11:11'),
(1297, '54.155.50.160', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2021-01-09 10:06:30', '2021-01-09 10:06:30'),
(1298, '77.69.178.135', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-09 10:07:07', '2021-01-09 10:07:07'),
(1299, '109.161.176.44', 'Chrome (87.0.4280.141)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-09 10:16:13', '2021-01-09 10:16:13'),
(1300, '154.12.162.54', 'Firefox (48.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-09 11:32:43', '2021-01-09 11:32:43'),
(1301, '138.68.59.23', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-01-09 12:08:15', '2021-01-09 12:08:15'),
(1302, '142.93.27.226', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-09 12:08:24', '2021-01-09 12:08:24'),
(1303, '192.241.214.190', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-01-09 13:09:18', '2021-01-09 13:09:18'),
(1304, '66.249.66.38', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-09 13:53:50', '2021-01-09 13:53:50'),
(1305, '196.52.43.56', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-09 14:17:41', '2021-01-09 14:17:41'),
(1306, '62.210.152.248', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-01-09 14:34:52', '2021-01-09 14:34:52'),
(1307, '168.91.42.207', 'Firefox (48.0)', 'Apple', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2021-01-09 15:06:18', '2021-01-09 15:06:18'),
(1308, '138.128.98.52', 'Firefox (45.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-09 16:32:51', '2021-01-09 16:32:51'),
(1309, '34.78.227.165', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2021-01-09 17:43:16', '2021-02-02 03:26:10'),
(1310, '154.12.163.156', 'Chrome (53.0.2804.81)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Reston', '20190', NULL, '38.960971832275', '-77.342468261719', 0, '2021-01-09 18:08:57', '2021-01-09 20:26:29'),
(1311, '54.255.241.184', 'Firefox (56.0)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-01-09 20:54:14', '2021-01-09 20:54:14'),
(1312, '209.127.40.192', 'Firefox (47.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-09 21:37:28', '2021-01-09 21:37:28'),
(1313, '13.81.117.122', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-10 00:34:09', '2021-01-10 00:35:22'),
(1314, '191.234.185.67', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'BR', 'Brazil', 'São Paulo', 'Campinas', '13010-000', NULL, '-22.89176940918', '-47.045299530029', 0, '2021-01-10 02:28:03', '2021-01-10 02:28:05'),
(1315, '51.158.127.119', 'unknown (unknown)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-01-10 03:48:12', '2021-01-10 03:48:12'),
(1316, '54.36.149.101', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-10 05:59:22', '2021-01-10 05:59:22'),
(1317, '45.154.35.219', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RU', 'Russia', NULL, NULL, NULL, NULL, '60', '100', 0, '2021-01-10 06:38:39', '2021-01-10 06:38:39'),
(1318, '185.205.194.107', 'Chrome (55.0.2909.87)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Nürnberg', '90439', NULL, '49.43579864502', '11.03839969635', 0, '2021-01-10 08:01:41', '2021-01-10 08:01:41'),
(1319, '34.211.95.28', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-01-10 10:18:18', '2021-01-10 10:18:18'),
(1320, '23.95.224.251', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-10 11:51:43', '2021-01-10 11:51:43'),
(1321, '192.3.215.247', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'EE', 'Estonia', 'Harjumaa', 'Tallinn', '13522', NULL, '59.427051544189', '24.659460067749', 0, '2021-01-10 11:51:49', '2021-01-10 11:51:55'),
(1322, '23.95.239.141', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-10 11:53:27', '2021-01-10 11:53:27'),
(1323, '5.28.107.233', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '10589', NULL, '52.522998809814', '13.306739807129', 0, '2021-01-10 15:05:02', '2021-01-10 15:05:02'),
(1324, '85.159.237.74', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'NL', 'Netherlands', 'North Brabant', 'Roosendaal', '4701', NULL, '51.533309936523', '4.4592099189758', 0, '2021-01-10 15:53:26', '2021-01-10 15:53:27'),
(1325, '193.188.113.111', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-10 19:32:42', '2021-01-11 06:19:08'),
(1326, '66.228.46.159', 'Firefox (8.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Pennsylvania', 'Philadelphia', '19106', NULL, '39.948841094971', '-75.14427947998', 0, '2021-01-10 20:17:56', '2021-01-10 21:50:10'),
(1327, '192.36.53.165', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-10 21:47:25', '2021-01-10 21:47:25'),
(1328, '37.30.29.248', 'Chrome (67.0.3396.87)', 'Windows', '0', 'Guest', 'PL', 'Poland', 'Mazovia', 'Mokotów', '02-674', NULL, '52.180480957031', '20.995889663696', 0, '2021-01-10 23:12:23', '2021-01-14 06:35:45'),
(1329, '54.36.148.91', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-11 00:46:45', '2021-01-11 00:46:45'),
(1330, '66.249.65.141', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-11 02:24:40', '2021-01-11 02:24:40'),
(1331, '66.249.65.143', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-01-11 02:54:39', '2021-02-05 17:49:58'),
(1332, '139.59.103.238', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-01-11 03:59:01', '2021-01-11 03:59:01'),
(1333, '185.104.184.123', 'Chrome (83.0.4096.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60314', NULL, '50.113700866699', '8.7118997573853', 0, '2021-01-11 05:30:45', '2021-01-11 05:30:45'),
(1334, '13.57.59.209', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-01-11 06:14:36', '2021-01-11 06:14:36'),
(1335, '198.58.75.9', 'Internet Explorer (7.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Texas', 'Carrollton', '75007', NULL, '33.003921508789', '-96.895927429199', 0, '2021-01-11 07:25:38', '2021-01-11 07:25:38'),
(1336, '179.43.167.228', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Zurich', 'Zürich', '8043', NULL, '47.374168395996', '8.5369501113892', 0, '2021-01-11 08:49:58', '2021-01-11 08:49:58'),
(1337, '157.38.46.242', 'Chrome (84.0.4147.125)', 'Linux', '0', 'Guest', 'IN', 'India', 'Rajasthan', 'Jaipur', '302013', NULL, '27.020099639893', '75.772003173828', 0, '2021-01-11 11:01:41', '2021-01-11 11:02:06'),
(1338, '110.54.133.159', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'PH', 'Philippines', 'Metro Manila', 'Taguig', '1630', NULL, '14.533329963684', '121.06667327881', 0, '2021-01-11 13:14:25', '2021-01-11 13:14:25'),
(1339, '136.27.62.24', 'Chrome (18.0.1025.46)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98121', NULL, '47.61674118042', '-122.34242248535', 0, '2021-01-11 13:53:54', '2021-01-11 13:53:54'),
(1340, '77.69.149.65', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-11 14:22:08', '2021-01-11 14:22:08'),
(1341, '89.148.13.120', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-11 14:30:35', '2021-01-11 14:30:35'),
(1342, '103.149.192.223', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3519999980927', '103.82499694824', 0, '2021-01-11 17:34:04', '2021-01-11 17:34:04'),
(1343, '165.227.198.175', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-11 17:43:14', '2021-01-11 17:43:14'),
(1344, '201.62.47.169', 'Chrome (77.0.3865.90)', 'Windows', '0', 'Guest', 'BR', 'Brazil', 'Espírito Santo', 'Vitória', '29010-001', NULL, '-20.322189331055', '-40.338088989258', 0, '2021-01-11 18:42:39', '2021-01-11 18:42:39'),
(1345, '179.60.150.44', 'Chrome (72.0.3626.121)', 'Linux', '0', 'Guest', 'BZ', 'Belize', NULL, NULL, NULL, NULL, '17.14999961853', '-88.449996948242', 0, '2021-01-11 18:44:06', '2021-01-11 18:44:06'),
(1346, '192.241.223.189', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-11 18:50:58', '2021-01-11 18:50:58'),
(1347, '54.36.148.205', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-11 20:39:53', '2021-01-11 20:39:53'),
(1348, '13.66.139.33', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-11 20:42:23', '2021-01-11 20:42:23'),
(1349, '80.82.77.227', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-11 23:21:31', '2021-01-11 23:21:31'),
(1350, '172.245.151.142', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-01-11 23:59:26', '2021-01-11 23:59:26'),
(1351, '54.177.8.173', 'Chrome (40.0.2214.93)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-01-12 02:26:04', '2021-01-12 02:26:04'),
(1352, '54.219.121.234', 'Chrome (77.0.3835.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-01-12 02:26:14', '2021-01-12 02:26:14'),
(1353, '54.153.91.124', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-01-12 02:26:15', '2021-01-12 02:26:21'),
(1354, '13.66.139.121', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-12 06:03:56', '2021-01-22 14:18:48'),
(1355, '191.101.113.32', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2021-01-12 08:02:11', '2021-01-12 08:02:11'),
(1356, '192.35.168.112', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2021-01-12 10:43:15', '2021-02-02 18:45:55'),
(1357, '85.142.179.196', 'Chrome (87.0.4280.141)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 13:32:54', '2021-01-12 13:32:54'),
(1358, '3.35.205.56', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'KR', 'South Korea', 'Incheon', 'Incheon', '400-011', NULL, '37.47354888916', '126.62036132812', 0, '2021-01-12 16:22:14', '2021-01-12 16:22:14'),
(1359, '35.226.104.125', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', 'US', 'United States', 'Iowa', 'Council Bluffs', '51501', NULL, '41.232959747314', '-95.87735748291', 0, '2021-01-12 16:28:31', '2021-01-12 23:39:16'),
(1360, '196.52.43.71', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-12 20:14:25', '2021-01-12 20:14:25'),
(1361, '54.36.148.204', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-12 20:32:01', '2021-01-12 20:32:01'),
(1362, '92.118.40.82', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Kirkland', '98033', NULL, '47.673160552979', '-122.19763183594', 0, '2021-01-12 22:52:30', '2021-01-12 22:52:30'),
(1363, '91.192.103.11', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Zug', 'Zug', '6331', NULL, '47.174041748047', '8.4268703460693', 0, '2021-01-13 02:10:47', '2021-01-13 02:10:47'),
(1364, '104.144.183.203', 'Chrome (49.0.2635.1)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-13 02:36:58', '2021-01-13 02:36:58'),
(1365, '178.63.87.197', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2021-01-13 04:20:46', '2021-01-13 04:21:11'),
(1366, '54.206.81.255', 'Chrome (83.0.4103.97)', 'Apple', '0', 'Guest', 'AU', 'Australia', 'New South Wales', 'Sydney', '2000', NULL, '-33.867141723633', '151.20710754395', 0, '2021-01-13 05:01:11', '2021-01-13 05:01:11'),
(1367, '121.243.22.130', 'Chrome (87.0.4280.66)', 'Windows', '0', 'Guest', 'IN', 'India', 'Uttar Pradesh', 'Noida', '110044', NULL, '28.509000778198', '77.320297241211', 0, '2021-01-13 06:06:48', '2021-01-13 06:06:48'),
(1368, '193.32.164.27', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2021-01-13 07:43:28', '2021-01-31 19:28:08'),
(1369, '104.144.158.177', 'Chrome (50.0.2669.18)', 'Linux', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-13 08:01:49', '2021-01-13 08:01:49'),
(1370, '212.47.251.118', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 08:18:50', '2021-01-13 08:18:50'),
(1371, '192.71.224.240', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-13 13:21:33', '2021-01-13 13:21:33'),
(1372, '159.203.44.177', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Ontario', 'Toronto', 'M3H 6A7', NULL, '43.703170776367', '-79.512191772461', 0, '2021-01-13 14:05:18', '2021-01-13 14:05:18'),
(1373, '196.52.43.118', 'Chrome (72.0.3602.2)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Edison', '08899', NULL, '40.524700164795', '-74.380599975586', 0, '2021-01-13 14:36:48', '2021-01-13 14:36:48'),
(1374, '54.36.148.76', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-13 18:53:57', '2021-02-06 07:19:17'),
(1375, '120.50.8.2', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', 'BD', 'Bangladesh', 'Dhaka', 'Paltan', '1000', NULL, '23.810300827026', '90.412498474121', 0, '2021-01-13 20:45:00', '2021-01-13 20:45:00'),
(1376, '107.191.46.80', 'Firefox (31.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Saint-Ouen', '93534', NULL, '48.908500671387', '2.3638000488281', 0, '2021-01-13 21:29:34', '2021-01-13 21:29:34'),
(1377, '45.155.205.90', 'Firefox (84.0)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '194292', NULL, '59.939041137695', '30.315790176392', 0, '2021-01-13 22:33:16', '2021-01-21 07:37:09'),
(1378, '23.129.64.201', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-01-13 22:46:59', '2021-01-13 22:46:59'),
(1379, '107.175.117.33', 'Chrome (88.0.4324.27)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-13 23:10:47', '2021-01-13 23:10:47'),
(1380, '104.144.54.184', 'Chrome (52.0.2752.79)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-13 23:24:10', '2021-01-13 23:24:10'),
(1381, '192.241.204.181', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-01-13 23:54:25', '2021-01-13 23:54:25'),
(1382, '104.144.97.189', 'Chrome (56.0.2969.53)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-14 02:51:13', '2021-01-14 02:51:13'),
(1383, '192.241.97.165', 'Chrome (56.0.2935.72)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-14 04:07:43', '2021-01-14 04:07:43'),
(1384, '198.22.224.242', 'Chrome (77.0.3865.120)', 'Windows', '0', 'Guest', 'US', 'United States', 'Alabama', 'Birmingham', '35209', NULL, '33.464530944824', '-86.806571960449', 0, '2021-01-14 04:40:39', '2021-01-14 04:40:39'),
(1385, '3.84.69.83', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-14 04:55:05', '2021-01-14 04:55:06'),
(1386, '3.236.93.73', 'Safari (12.0.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-14 05:59:54', '2021-01-14 05:59:54'),
(1387, '45.33.76.118', 'Chrome (87.0.4280.141)', 'Linux', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Newark', '07103', NULL, '40.738731384277', '-74.194526672363', 0, '2021-01-14 06:03:11', '2021-01-14 06:03:11'),
(1388, '209.17.96.194', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-14 06:05:16', '2021-01-14 06:05:16'),
(1389, '94.76.16.96', 'Chrome (87.0.4280.141)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-14 07:08:35', '2021-01-14 07:08:35'),
(1390, '159.203.196.79', 'Firefox (33.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-14 07:08:37', '2021-01-14 07:08:37'),
(1391, '88.201.7.15', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-14 09:16:47', '2021-01-14 09:16:47'),
(1392, '23.250.3.89', 'Internet Explorer (11.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-14 15:47:07', '2021-01-14 15:47:07'),
(1393, '54.36.148.88', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-14 17:55:26', '2021-01-14 17:55:26'),
(1394, '18.191.225.194', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2021-01-14 18:41:22', '2021-01-14 18:41:24'),
(1395, '163.172.18.192', 'Opera (52.0.2871.99)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-01-14 19:58:47', '2021-01-14 19:58:47'),
(1396, '128.14.209.146', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Diamond Bar', '91765', NULL, '33.994491577148', '-117.81831359863', 0, '2021-01-14 20:21:26', '2021-01-15 00:34:46'),
(1397, '52.251.42.173', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Virginia', 'Boydton', '23917', NULL, '36.640468597412', '-78.269950866699', 0, '2021-01-14 21:27:48', '2021-01-14 21:27:48'),
(1398, '107.174.255.54', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-14 23:18:16', '2021-01-14 23:18:16'),
(1399, '192.241.196.238', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-01-14 23:54:55', '2021-01-14 23:54:55'),
(1400, '178.159.37.163', 'Chrome (83.0.4103.34)', 'Windows', '0', 'Guest', 'UA', 'Ukraine', 'Kyiv City', 'Kyiv', '01000', NULL, '50.433330535889', '30.516670227051', 0, '2021-01-15 01:06:46', '2021-02-07 07:21:21'),
(1401, '104.248.38.109', 'Chrome (87.0.4280.88)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2021-01-15 02:40:00', '2021-01-15 02:40:00'),
(1402, '207.180.220.114', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2021-01-15 05:25:38', '2021-01-15 05:26:32'),
(1403, '83.110.227.246', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'AE', 'United Arab Emirates', 'Dubai', 'Dubai', NULL, NULL, '25.141080856323', '55.212108612061', 0, '2021-01-15 09:22:05', '2021-01-15 09:22:17'),
(1404, '89.187.168.139', 'Chrome (67.0.3396.99)', 'Windows', '0', 'Guest', 'AT', 'Austria', 'Vienna', 'Vienna', '1000', NULL, '48.208610534668', '16.374170303345', 0, '2021-01-15 13:28:38', '2021-01-15 13:28:42'),
(1405, '148.251.123.46', 'Mozilla (1.9)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2021-01-15 14:23:38', '2021-01-15 14:23:38'),
(1406, '23.229.114.237', 'Opera (7.23)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90013', NULL, '34.045639038086', '-118.24163818359', 0, '2021-01-15 16:21:43', '2021-01-15 16:21:43'),
(1407, '23.94.2.173', 'Firefox (77.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-15 16:21:50', '2021-01-15 16:21:50'),
(1408, '35.195.71.86', 'Firefox (52.0)', 'Apple', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2021-01-15 17:06:49', '2021-01-15 17:06:49'),
(1409, '67.21.36.2', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Bainbridge Island', '98110', NULL, '47.647609710693', '-122.53545379639', 0, '2021-01-15 18:57:32', '2021-01-15 18:57:32'),
(1410, '90.187.70.217', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Garching bei München', '85774', NULL, '48.192260742188', '11.640410423279', 0, '2021-01-15 23:57:01', '2021-01-16 00:05:42'),
(1411, '216.218.206.67', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2021-01-16 04:52:32', '2021-01-16 04:52:32'),
(1412, '134.209.214.202', 'Chrome (79.0.3945.88)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-16 05:41:33', '2021-01-16 05:41:33'),
(1413, '199.230.105.18', 'Firefox (76.0)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'Los Angeles', '90048', NULL, '34.070999145508', '-118.37618255615', 0, '2021-01-16 08:29:37', '2021-01-25 04:05:12'),
(1414, '24.133.177.13', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'TR', 'Turkey', 'Ankara', 'Ankara', NULL, NULL, '39.794998168945', '32.803001403809', 0, '2021-01-16 08:45:00', '2021-01-16 08:45:00'),
(1415, '54.36.148.166', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-16 08:47:29', '2021-01-16 08:47:29');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(1416, '185.100.87.190', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RO', 'Romania', 'Brasov', 'Victoria', '505700', NULL, '45.730701446533', '24.700899124146', 0, '2021-01-16 12:15:31', '2021-01-16 12:17:20'),
(1417, '93.174.95.106', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-16 12:55:32', '2021-01-23 11:03:49'),
(1418, '148.163.128.145', 'Chrome (55.0.2883.87)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'Sunnyvale', '94089', NULL, '37.425189971924', '-122.01725006104', 0, '2021-01-16 14:17:09', '2021-01-16 14:17:09'),
(1419, '209.17.96.226', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-16 14:59:52', '2021-01-16 14:59:52'),
(1420, '192.241.224.126', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-16 15:50:26', '2021-01-16 15:50:26'),
(1421, '107.189.11.153', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'LU', 'Luxembourg', 'Luxembourg', 'Luxembourg', '2326', NULL, '49.616241455078', '6.1062397956848', 0, '2021-01-16 18:19:16', '2021-01-16 18:19:16'),
(1422, '66.249.79.236', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2021-01-16 18:23:45', '2021-02-08 02:31:24'),
(1423, '40.74.121.39', 'Internet Explorer (6.1)', 'Linux', '0', 'Guest', 'JP', 'Japan', 'Ōsaka', 'Osaka', '542-0082', NULL, '34.67094039917', '135.50750732422', 0, '2021-01-16 20:14:42', '2021-01-21 01:22:19'),
(1424, '196.16.16.134', 'Firefox (81.0)', 'Apple', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60608', NULL, '41.848850250244', '-87.671249389648', 0, '2021-01-16 20:35:16', '2021-01-16 20:35:16'),
(1425, '207.46.13.217', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-16 23:24:11', '2021-01-16 23:24:11'),
(1426, '142.54.185.16', 'Chrome (71.0.3578.98)', 'Windows', '0', 'Guest', 'US', 'United States', 'Kansas', 'Prairie Village', '64116', NULL, '39.146381378174', '-94.570770263672', 0, '2021-01-17 02:40:30', '2021-01-17 02:40:38'),
(1427, '218.255.116.70', 'Firefox (67.0)', 'Linux', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2021-01-17 03:21:01', '2021-01-17 03:21:05'),
(1428, '107.174.244.103', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-17 04:53:27', '2021-01-17 07:03:43'),
(1429, '66.249.79.238', 'Chrome (87.0.4280.90)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94043', NULL, '37.419158935547', '-122.07540893555', 0, '2021-01-17 06:22:52', '2021-01-20 06:01:51'),
(1430, '173.214.194.52', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2021-01-17 07:00:24', '2021-01-17 07:00:24'),
(1431, '168.81.94.155', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'City of Westminster', 'SW2', NULL, '51.45832824707', '-0.11416999995708', 0, '2021-01-17 07:00:35', '2021-01-17 07:00:35'),
(1432, '52.146.0.177', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-01-17 11:22:18', '2021-01-17 11:22:18'),
(1433, '191.102.153.225', 'Edge (D3117A87)', 'Windows', '0', 'Guest', 'US', 'United States', 'South Carolina', 'Orangeburg', '29115', NULL, '33.486301422119', '-80.873931884766', 0, '2021-01-17 11:46:24', '2021-01-17 11:46:24'),
(1434, '80.128.229.141', 'Firefox (84.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'North Rhine-Westphalia', 'Köln', '50667', NULL, '50.939170837402', '6.9568400382996', 0, '2021-01-17 15:32:36', '2021-01-17 15:32:36'),
(1435, '5.45.79.19', 'Chrome (68.0.3440.84)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-01-17 18:20:40', '2021-01-17 18:20:40'),
(1436, '192.241.219.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-01-17 19:01:26', '2021-01-17 19:01:26'),
(1437, '157.55.39.195', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-17 23:08:37', '2021-01-17 23:08:37'),
(1438, '107.175.204.213', 'Safari (11.1.2)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-18 00:23:33', '2021-01-19 00:44:16'),
(1439, '85.169.54.125', 'Firefox (3.5.3)', 'Windows', '0', 'Guest', 'FR', 'France', 'Provence-Alpes-Côte d\'Azur', 'Marseille 01', '13001', NULL, '43.29833984375', '5.3832201957703', 0, '2021-01-18 01:02:45', '2021-01-18 01:02:46'),
(1440, '107.172.230.78', 'Edge (12.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-18 01:04:52', '2021-01-18 01:04:52'),
(1441, '103.149.192.17', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3519999980927', '103.82499694824', 0, '2021-01-18 01:10:52', '2021-01-18 01:10:52'),
(1442, '54.36.148.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-18 01:55:20', '2021-01-18 01:55:20'),
(1443, '149.129.70.249', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'HK', 'Hong Kong SAR China', 'Tsuen Wan', 'Tsuen Wan', NULL, NULL, '22.39640045166', '114.10949707031', 0, '2021-01-18 03:23:33', '2021-01-18 03:23:33'),
(1444, '139.155.59.176', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2021-01-18 03:25:28', '2021-01-29 11:45:16'),
(1445, '23.129.64.227', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-01-18 09:51:26', '2021-01-18 09:51:26'),
(1446, '37.131.81.150', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-18 10:43:44', '2021-01-18 10:43:44'),
(1447, '18.191.22.230', 'Chrome (85.0.4183.102)', 'Linux', '0', 'Guest', 'US', 'United States', 'Ohio', 'Columbus', '43201', NULL, '39.995578765869', '-82.999458312988', 0, '2021-01-18 16:47:11', '2021-01-18 16:47:12'),
(1448, '207.246.66.45', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'US', 'United States', 'Florida', 'Flagami', '33142', NULL, '25.812530517578', '-80.240440368652', 0, '2021-01-18 17:14:58', '2021-01-23 04:40:34'),
(1449, '52.32.88.53', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-01-18 18:01:16', '2021-01-18 18:01:16'),
(1450, '147.139.170.102', 'unknown (unknown)', 'unknown', '0', 'Guest', 'ID', 'Indonesia', 'Jakarta', 'Jakarta', '10110', NULL, '-6.1737999916077', '106.82669830322', 0, '2021-01-18 18:33:02', '2021-01-18 18:38:00'),
(1451, '192.241.222.233', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-18 20:17:18', '2021-01-18 20:17:18'),
(1452, '192.35.168.128', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2021-01-18 21:34:15', '2021-01-18 21:34:15'),
(1453, '2.57.122.19', 'Edge (12.246)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'Flevoland', 'Zeewolde', NULL, NULL, '52.299999237061', '5.4499998092651', 0, '2021-01-18 22:51:51', '2021-02-10 02:38:12'),
(1454, '23.129.64.202', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-01-18 22:52:33', '2021-01-18 22:52:33'),
(1455, '108.163.220.2', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-01-18 22:53:18', '2021-01-18 22:53:18'),
(1456, '199.241.136.5', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Tustin', '92780', NULL, '33.737628936768', '-117.82116699219', 0, '2021-01-19 02:19:45', '2021-01-19 02:22:09'),
(1457, '52.250.3.61', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-19 03:40:36', '2021-01-19 03:40:36'),
(1458, '170.106.81.19', 'Chrome (86.0.4)', 'Linux', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-01-19 04:08:36', '2021-01-19 04:08:41'),
(1459, '2.59.1.187', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Blackheath', 'EC4R', NULL, '51.512218475342', '0', 0, '2021-01-19 04:12:55', '2021-01-19 04:12:55'),
(1460, '37.120.143.166', 'Chrome (67.0.3396.99)', 'Windows', '0', 'Guest', 'BE', 'Belgium', 'Brussels Capital', 'Brussels', '1000', NULL, '50.846740722656', '4.3524899482727', 0, '2021-01-19 05:53:24', '2021-01-19 05:53:27'),
(1461, '66.240.205.34', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', 'US', 'United States', 'California', 'San Diego', '92123', NULL, '32.808750152588', '-117.13761138916', 0, '2021-01-19 07:44:12', '2021-02-06 07:09:57'),
(1462, '51.83.171.25', 'unknown (unknown)', 'unknown', '0', 'Guest', 'PL', 'Poland', 'Mazovia', 'Śródmieście', '00-043', NULL, '52.237911224365', '21.017210006714', 0, '2021-01-19 15:14:01', '2021-01-19 15:14:01'),
(1463, '34.240.12.120', 'unknown (unknown)', 'unknown', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2021-01-19 15:35:32', '2021-01-19 15:35:32'),
(1464, '35.161.55.221', 'Chrome (44.0.2403.89)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-01-19 17:56:20', '2021-01-19 17:56:22'),
(1465, '54.36.149.59', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-01-19 20:52:55', '2021-01-19 20:52:55'),
(1466, '179.43.167.230', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CH', 'Switzerland', 'Zurich', 'Zürich', '8043', NULL, '47.374168395996', '8.5369501113892', 0, '2021-01-19 21:18:15', '2021-01-19 21:18:15'),
(1467, '104.227.89.43', 'Chrome (86.0.4240.183)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-19 23:54:53', '2021-01-19 23:54:53'),
(1468, '192.241.202.200', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-20 00:33:22', '2021-01-20 00:33:22'),
(1469, '65.49.20.66', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2021-01-20 04:22:20', '2021-01-20 04:22:20'),
(1470, '185.107.47.215', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Brabant', 'Roosendaal', '4701', NULL, '51.533309936523', '4.4592099189758', 0, '2021-01-20 06:32:16', '2021-01-20 06:32:16'),
(1471, '185.189.114.119', 'Chrome (67.0.3396.62)', 'Windows', '0', 'Guest', 'HU', 'Hungary', 'Budapest', 'Budapest', '1191', NULL, '47.4599609375', '19.14967918396', 0, '2021-01-20 07:01:24', '2021-02-04 02:54:33'),
(1472, '89.31.194.18', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-20 07:30:39', '2021-01-20 07:31:23'),
(1473, '109.161.172.173', 'iPhone (unknown)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-20 12:59:46', '2021-01-20 12:59:46'),
(1474, '124.65.95.138', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2021-01-20 13:57:03', '2021-01-20 13:57:03'),
(1475, '58.210.85.58', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Jiangsu', 'Suzhou', '215000', NULL, '31.296390533447', '120.60305786133', 0, '2021-01-20 16:18:36', '2021-01-20 16:18:36'),
(1476, '192.71.23.211', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-01-20 19:22:08', '2021-01-20 19:22:08'),
(1477, '157.55.39.229', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-01-20 20:02:16', '2021-01-24 20:40:47'),
(1478, '191.96.185.105', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', 'SC', 'Seychelles', 'English River', 'Victoria', NULL, NULL, '-4.6170001029968', '55.444999694824', 0, '2021-01-20 21:00:22', '2021-01-20 21:00:22'),
(1479, '172.58.75.84', 'Chrome (87.0.4280.141)', 'Android', '0', 'Guest', 'US', 'United States', 'Nevada', 'Spring Valley', '89117', NULL, '36.136989593506', '-115.28383636475', 0, '2021-01-20 21:56:45', '2021-01-20 21:56:45'),
(1480, '45.57.163.199', 'Chrome (84.0.4147.89)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-01-21 00:00:50', '2021-01-21 00:00:50'),
(1481, '192.241.214.88', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-01-21 01:05:11', '2021-01-21 01:05:11'),
(1482, '45.83.66.159', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2021-01-21 02:55:26', '2021-01-21 02:55:26'),
(1483, '104.206.128.62', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Arizona', 'Ahwatukee Foothills', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2021-01-21 05:44:46', '2021-01-21 05:44:46'),
(1484, '23.129.64.223', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-01-21 07:33:08', '2021-01-21 07:33:08'),
(1485, '104.248.72.78', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-21 10:05:54', '2021-01-21 10:05:54'),
(1486, '178.46.164.5', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Sverdlovsk', 'Yekaterinburg', '620014', NULL, '56.842781066895', '60.58943939209', 0, '2021-01-21 10:58:56', '2021-01-21 10:59:51'),
(1487, '209.17.96.18', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-01-21 14:14:32', '2021-01-21 14:14:32'),
(1488, '188.240.223.167', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Blekinge', 'Karlskrona', '371 00', NULL, '56.161220550537', '15.586899757385', 0, '2021-01-21 17:01:51', '2021-01-21 17:01:51'),
(1489, '37.131.124.84', 'iPhone (14.0.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-21 19:29:09', '2021-01-21 19:29:17'),
(1490, '3.231.93.171', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-01-21 19:49:55', '2021-01-21 19:49:56'),
(1491, '194.76.32.123', 'Firefox (85.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Kirkland', '98033', NULL, '47.673160552979', '-122.19763183594', 0, '2021-01-21 23:13:15', '2021-01-21 23:13:15'),
(1492, '192.241.204.54', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-01-22 04:53:08', '2021-01-22 04:53:08'),
(1493, '129.211.205.136', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2021-01-22 08:44:08', '2021-01-22 08:44:08'),
(1494, '148.251.9.145', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Gunzenhausen', '91710', NULL, '49.115940093994', '10.753399848938', 0, '2021-01-22 08:46:05', '2021-01-22 08:46:12'),
(1495, '94.76.22.143', 'Chrome (87.0.4280.141)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-22 15:31:59', '2021-01-22 15:46:50'),
(1496, '46.42.67.155', 'Chrome (87.0.4280.141)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-01-22 19:45:24', '2021-01-22 19:45:24'),
(1497, '47.74.84.52', 'unknown (unknown)', 'unknown', '0', 'Guest', 'AU', 'Australia', 'Victoria', 'Melbourne', '3000', NULL, '-37.814250946045', '144.9631652832', 0, '2021-01-22 20:02:54', '2021-01-22 20:03:21'),
(1498, '37.154.29.238', 'Chrome (88.0.4324.93)', 'Android', '0', 'Guest', 'TR', 'Turkey', 'Adana', 'Adana', '01000', NULL, '37.001941680908', '35.33166885376', 0, '2021-01-22 20:20:41', '2021-01-22 20:20:41'),
(1499, '172.88.26.128', 'Chrome (88.0.4324.93)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'San Fernando', '91325', NULL, '34.233020782471', '-118.51921844482', 0, '2021-01-22 20:30:55', '2021-01-22 20:30:55'),
(1500, '52.179.100.232', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-01-22 21:53:42', '2021-01-22 21:53:43'),
(1501, '192.126.217.192', 'Chrome (84.0.4147.89)', 'Apple', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98112', NULL, '47.631980895996', '-122.28740692139', 0, '2021-01-23 00:49:02', '2021-01-23 00:49:02'),
(1502, '92.118.160.5', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2021-01-23 05:14:58', '2021-01-30 13:04:55'),
(1503, '82.221.105.7', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 09:47:44', '2021-01-23 09:47:44'),
(1504, '124.104.124.191', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 10:39:47', '2021-01-23 10:39:47'),
(1505, '104.206.128.38', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 10:48:38', '2021-01-23 10:48:38'),
(1506, '45.153.241.248', 'Chrome (26.0.1410.63)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 13:44:49', '2021-01-23 13:44:49'),
(1507, '77.69.178.96', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 14:37:27', '2021-01-23 14:37:27'),
(1508, '71.6.146.130', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 15:22:05', '2021-01-23 15:22:05'),
(1509, '23.95.204.41', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 16:03:53', '2021-01-23 16:03:53'),
(1510, '23.95.239.195', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 16:04:02', '2021-01-23 16:05:15'),
(1511, '71.6.199.23', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 16:49:34', '2021-01-23 16:49:34'),
(1512, '188.169.169.104', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 19:12:00', '2021-01-23 19:12:00'),
(1513, '192.241.219.178', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 20:49:17', '2021-01-23 20:49:17'),
(1514, '155.94.232.107', 'Firefox (83.0)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 00:27:06', '2021-01-24 00:27:06'),
(1515, '173.211.105.216', 'Chrome (58.0.3029.110)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 06:50:36', '2021-01-24 06:50:36'),
(1516, '173.231.59.125', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 09:27:42', '2021-01-24 09:27:44'),
(1517, '60.208.94.158', 'Chrome (83.0.4103.116)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 10:37:12', '2021-01-24 10:37:12'),
(1518, '23.129.64.206', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 18:04:06', '2021-01-24 18:04:06'),
(1519, '109.234.39.49', 'iPhone (12.0)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 18:20:07', '2021-01-25 13:40:08'),
(1520, '179.61.149.182', 'Chrome (85.0.4183.83)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 00:28:29', '2021-01-25 00:28:29'),
(1521, '198.199.94.59', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 01:03:30', '2021-01-25 01:03:30'),
(1522, '18.144.49.11', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 03:23:15', '2021-01-25 03:23:15'),
(1523, '93.158.161.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 03:36:04', '2021-02-03 13:13:06'),
(1524, '23.94.177.166', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 04:31:46', '2021-01-25 04:31:46'),
(1525, '23.94.150.146', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 04:32:11', '2021-01-25 04:34:13'),
(1526, '54.36.148.169', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 05:35:28', '2021-01-25 05:35:28'),
(1527, '64.225.19.60', 'Firefox (33.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 06:35:05', '2021-01-25 06:35:28'),
(1528, '23.129.64.228', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 07:56:28', '2021-01-25 07:56:28'),
(1529, '52.250.65.139', 'Chrome (54.0.2840.98)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 10:38:13', '2021-01-30 08:46:37'),
(1530, '94.79.208.223', 'Chrome (88.0.4324.104)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 12:07:00', '2021-01-28 11:59:38'),
(1531, '92.19.8.111', 'Chrome (83.0.4103.106)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 12:36:28', '2021-01-25 12:36:28'),
(1532, '174.138.51.85', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 12:48:05', '2021-01-25 12:50:58'),
(1533, '45.33.25.129', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 14:20:47', '2021-01-25 14:20:47'),
(1534, '13.85.63.67', 'Chrome (79.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 14:39:13', '2021-01-25 14:39:14'),
(1535, '37.131.125.22', 'iPhone (unknown)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 17:26:22', '2021-01-25 17:31:21'),
(1536, '89.148.0.138', 'iPhone (unknown)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 19:05:08', '2021-01-25 19:05:08'),
(1537, '198.38.85.170', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 19:21:56', '2021-01-25 19:21:56'),
(1538, '181.214.65.124', 'Chrome (86.0.4240.75)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 23:25:21', '2021-01-27 23:31:08'),
(1539, '54.36.148.107', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 23:46:49', '2021-01-25 23:46:49'),
(1540, '54.202.62.167', 'Chrome (26.0.1410.65)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 01:10:26', '2021-01-26 01:10:26'),
(1541, '42.81.142.99', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 02:15:40', '2021-01-26 02:15:40'),
(1542, '20.198.178.215', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 03:05:17', '2021-01-26 11:08:35'),
(1543, '3.228.20.146', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 03:18:23', '2021-01-26 03:18:23'),
(1544, '18.191.191.137', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 03:49:18', '2021-01-26 03:49:18'),
(1545, '114.113.233.210', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 05:35:45', '2021-01-26 05:35:45'),
(1546, '192.241.201.12', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 05:51:20', '2021-01-26 05:51:20'),
(1547, '124.156.208.90', 'Chrome (86.0.4)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 08:45:24', '2021-01-26 08:48:25'),
(1548, '102.165.30.1', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 08:57:16', '2021-01-26 08:57:16'),
(1549, '40.94.104.42', 'Chrome (80.0.3987.87)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 11:43:52', '2021-01-26 11:43:52'),
(1550, '54.218.140.71', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 12:17:51', '2021-01-26 12:17:53'),
(1551, '181.130.159.196', 'Chrome (88.0.4324.104)', 'Windows', '21', 'Murphy Horta Camargo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 12:32:22', '2021-02-02 14:55:40'),
(1552, '82.194.54.19', 'Chrome (88.0.4324.93)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 17:22:46', '2021-01-26 17:22:46'),
(1553, '136.143.177.44', 'Chrome (59.0.3071.115)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 17:37:35', '2021-01-26 17:37:35'),
(1554, '167.99.168.133', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 17:56:16', '2021-01-26 17:56:16'),
(1555, '47.92.124.223', 'Chrome (76.0.3809.132)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 18:52:44', '2021-01-26 18:52:44'),
(1556, '186.168.167.197', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 19:00:55', '2021-01-26 19:00:55'),
(1557, '157.55.39.222', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 21:25:36', '2021-01-29 21:13:25'),
(1558, '54.36.148.40', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 21:27:09', '2021-01-26 21:27:09'),
(1559, '173.231.63.101', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 22:31:10', '2021-01-26 22:31:17'),
(1560, '51.104.240.110', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 00:05:36', '2021-01-27 00:05:36'),
(1561, '142.147.109.82', 'Chrome (87.0.4280.66)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 00:31:02', '2021-01-27 00:31:02'),
(1562, '192.241.208.196', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 05:56:59', '2021-01-27 05:56:59'),
(1563, '77.69.128.163', 'Chrome (88.0.4324.96)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 06:36:39', '2021-01-27 06:36:39'),
(1564, '31.31.196.201', 'Chrome (5.0.375.99)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 07:50:42', '2021-01-27 07:50:42'),
(1565, '223.227.10.5', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 08:21:43', '2021-01-27 08:21:43'),
(1566, '84.17.51.109', 'Chrome (68.0.3440.75)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 09:55:00', '2021-01-27 09:55:03'),
(1567, '104.140.188.6', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 10:31:58', '2021-01-27 10:31:58'),
(1568, '186.168.183.74', 'Chrome (87.0.4280.141)', 'Windows', '20', 'Miguel Celis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 13:51:01', '2021-01-27 20:26:15'),
(1569, '47.241.66.187', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 17:42:57', '2021-01-27 17:43:29'),
(1570, '77.222.115.46', 'Chrome (83.0.4103.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 20:17:36', '2021-01-27 20:17:39'),
(1571, '95.90.216.3', 'Firefox (84.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 21:28:33', '2021-01-27 21:28:33'),
(1572, '54.36.149.89', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 21:47:21', '2021-01-27 21:47:21'),
(1573, '217.160.46.6', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 03:19:06', '2021-01-28 03:19:06'),
(1574, '45.129.56.200', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 07:35:42', '2021-01-28 07:35:42'),
(1575, '40.94.89.99', 'Chrome (79.0.3945.136)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 09:29:19', '2021-01-28 09:29:19'),
(1576, '192.241.211.188', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 10:03:52', '2021-01-28 10:03:52'),
(1577, '41.37.2.238', 'Firefox (65.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 11:47:02', '2021-01-28 11:47:02'),
(1578, '194.220.189.231', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 13:46:03', '2021-01-28 13:46:03'),
(1579, '37.30.28.12', 'Chrome (66.0.3359.170)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 13:49:38', '2021-01-28 13:49:38'),
(1580, '40.94.104.93', 'Chrome (80.0.3987.87)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 14:03:11', '2021-01-28 14:03:11'),
(1581, '40.94.89.84', 'Chrome (79.0.3945.136)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 14:03:26', '2021-01-28 14:03:26'),
(1582, '78.147.227.208', 'Chrome (83.0.4103.106)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 14:41:44', '2021-01-28 14:41:44'),
(1583, '45.57.159.100', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 16:08:19', '2021-01-28 16:08:19'),
(1584, '104.227.170.78', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 16:08:25', '2021-01-28 16:08:29'),
(1585, '104.248.207.155', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 18:46:43', '2021-01-28 18:46:43'),
(1586, '94.76.22.92', 'Chrome (68.0.3440.91)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 21:07:28', '2021-01-28 21:07:42'),
(1587, '54.36.149.67', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 21:35:45', '2021-01-28 21:35:45'),
(1588, '91.224.92.200', 'Chrome (79.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 22:20:52', '2021-01-28 22:20:53'),
(1589, '46.101.91.243', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 22:31:45', '2021-01-28 22:31:45'),
(1590, '35.210.98.204', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 00:00:04', '2021-01-29 00:00:04'),
(1591, '52.25.44.38', 'Opera (10.61)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 00:43:59', '2021-01-29 00:43:59'),
(1592, '107.172.12.9', 'Firefox (82.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 00:45:30', '2021-01-29 00:45:30'),
(1593, '198.20.87.98', 'Chrome (34.0.1847.137)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 01:51:23', '2021-01-29 01:51:23'),
(1594, '52.189.249.225', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 04:19:56', '2021-01-30 23:10:19'),
(1595, '206.189.150.49', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 05:29:38', '2021-01-29 05:29:39'),
(1596, '192.99.4.168', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 06:04:42', '2021-01-29 06:07:09'),
(1597, '94.50.156.30', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 09:14:07', '2021-01-29 09:15:26'),
(1598, '138.197.111.136', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 09:17:34', '2021-01-29 09:17:34'),
(1599, '18.183.46.74', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 10:34:21', '2021-01-29 10:34:22'),
(1600, '109.161.166.119', 'Chrome (88.0.4324.93)', 'Android', '3', 'Face Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 13:07:40', '2021-01-29 13:10:32'),
(1601, '186.116.196.128', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 13:49:33', '2021-01-29 13:49:45'),
(1602, '34.242.141.183', 'iPhone (8.0)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 14:54:25', '2021-01-29 14:54:25'),
(1603, '63.35.189.10', 'iPhone (8.0)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 14:54:25', '2021-01-29 14:54:25'),
(1604, '54.36.148.1', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 18:30:28', '2021-01-29 18:30:28'),
(1605, '109.70.100.46', 'Chrome (83.0.4103.14)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 18:32:02', '2021-01-29 18:32:02'),
(1606, '185.170.114.25', 'Chrome (83.0.4103.14)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 18:32:07', '2021-01-29 18:32:07'),
(1607, '89.163.143.8', 'Chrome (83.0.4103.14)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 18:32:11', '2021-01-29 18:32:11'),
(1608, '107.189.11.207', 'Chrome (83.0.4103.14)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 18:32:14', '2021-01-29 18:32:14'),
(1609, '47.185.93.214', 'Chrome (83.0.4098.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 19:56:35', '2021-01-29 19:56:41'),
(1610, '45.81.235.126', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 22:21:51', '2021-01-29 22:26:01'),
(1611, '161.35.189.117', 'Internet Explorer (6.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 22:41:34', '2021-01-29 22:41:34'),
(1612, '181.215.204.62', 'Firefox (81.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-29 23:02:09', '2021-01-29 23:02:09'),
(1613, '102.165.30.33', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 00:36:41', '2021-01-30 00:36:41'),
(1614, '103.149.192.194', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 04:59:12', '2021-01-30 04:59:12'),
(1615, '173.252.111.7', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 05:59:35', '2021-01-30 05:59:35'),
(1616, '80.82.77.192', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 09:02:00', '2021-01-30 09:02:00'),
(1617, '209.17.97.98', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 10:22:12', '2021-01-30 10:22:12'),
(1618, '81.214.251.142', 'Chrome (88.0.4324.93)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 11:13:29', '2021-01-30 11:13:29'),
(1619, '125.234.120.206', 'Chrome (61.0.3163.100)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 11:15:21', '2021-01-30 11:15:21'),
(1620, '161.35.187.189', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 13:00:48', '2021-01-30 13:00:48'),
(1621, '13.66.139.137', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 13:46:23', '2021-02-01 13:59:08'),
(1622, '96.9.74.195', 'Firefox (85.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 14:24:58', '2021-01-30 14:24:58'),
(1623, '35.195.75.117', 'Firefox (52.0)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 16:45:05', '2021-01-30 16:45:05'),
(1624, '185.230.126.12', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 18:16:42', '2021-01-30 18:16:50'),
(1625, '179.183.45.157', 'iPhone (14.0.2)', 'iPhone', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 20:03:26', '2021-01-30 20:04:44'),
(1626, '46.5.17.73', 'Chrome (88.0.4324.104)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 20:10:02', '2021-01-30 20:10:02'),
(1627, '195.58.38.164', 'Chrome (34.0.1847.131)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 23:55:51', '2021-01-30 23:55:51'),
(1628, '23.129.64.221', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 01:47:37', '2021-01-31 01:47:37'),
(1629, '190.237.43.25', 'Chrome (88.0.4324.104)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 01:54:38', '2021-01-31 01:54:38'),
(1630, '138.68.161.204', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 02:43:31', '2021-02-10 00:30:54'),
(1631, '192.241.222.158', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 05:25:22', '2021-01-31 05:25:22'),
(1632, '34.240.137.174', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 07:21:22', '2021-01-31 07:21:22'),
(1633, '51.222.43.127', 'Chrome (45.0.2454.94)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 12:48:58', '2021-01-31 12:49:06'),
(1634, '150.136.228.223', 'Chrome (73.0.3683.90)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 12:54:39', '2021-01-31 21:26:00'),
(1635, '171.25.193.78', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 14:36:18', '2021-01-31 14:36:18'),
(1636, '72.13.62.25', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 15:38:14', '2021-01-31 15:38:14'),
(1637, '94.232.46.140', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 16:04:08', '2021-01-31 16:04:08'),
(1638, '164.90.136.175', 'Internet Explorer (8.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 16:11:29', '2021-01-31 16:11:29'),
(1639, '67.190.95.243', 'Chrome (88.0.4324.96)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 18:18:41', '2021-01-31 18:18:41'),
(1640, '194.9.191.20', 'Mozilla (5.0)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 22:39:53', '2021-01-31 22:39:53'),
(1641, '213.16.63.201', 'unknown (unknown)', 'unknown', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 23:08:20', '2021-01-31 23:08:20'),
(1642, '34.204.74.192', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 23:58:38', '2021-01-31 23:58:39'),
(1643, '167.114.211.168', 'Chrome (85.0.4183.83)', 'Windows', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2021-02-01 03:30:25', '2021-02-01 03:30:26'),
(1644, '192.241.224.51', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-02-01 11:35:05', '2021-02-01 11:35:05'),
(1645, '103.149.192.24', 'Chrome (79.0.3945.130)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3519999980927', '103.82499694824', 0, '2021-02-01 12:27:53', '2021-02-01 12:27:53'),
(1646, '54.36.149.35', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-02-01 12:51:52', '2021-02-01 12:51:52'),
(1647, '54.229.157.93', 'Chrome (78.0.3882.0)', 'Linux', '0', 'Guest', 'IE', 'Ireland', 'Leinster', 'Dublin', NULL, NULL, '53.353889465332', '-6.2433300018311', 0, '2021-02-01 13:15:42', '2021-02-01 13:15:42'),
(1648, '94.76.8.55', 'Chrome (88.0.4324.146)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-01 13:28:06', '2021-02-08 13:21:15'),
(1649, '13.52.254.215', 'Chrome (40.0.2214.93)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-02-01 16:40:05', '2021-02-01 16:40:05'),
(1650, '91.144.142.19', 'Chrome (67.0.3396.62)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Tatarstan Republic', 'Kazan', '420087', NULL, '55.796539306641', '49.108200073242', 0, '2021-02-01 16:56:12', '2021-02-01 16:56:12'),
(1651, '66.249.75.207', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-02-01 17:49:45', '2021-02-02 06:14:35'),
(1652, '209.97.148.99', 'Chrome (88.0.4240.193)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-02-01 18:39:01', '2021-02-01 18:39:03'),
(1653, '213.136.87.57', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2021-02-01 20:04:31', '2021-02-01 20:04:31'),
(1654, '66.249.75.199', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-02-01 20:40:25', '2021-02-01 20:40:25'),
(1655, '186.116.66.205', 'Chrome (87.0.4280.141)', 'Windows', '20', 'Miguel Celis', 'CO', 'Colombia', 'Bolívar', 'Cartagena', '130005', NULL, '10.400710105896', '-75.483261108398', 0, '2021-02-01 22:08:51', '2021-02-01 22:10:02'),
(1656, '104.140.188.34', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Arizona', 'Ahwatukee Foothills', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2021-02-01 22:16:09', '2021-02-01 22:16:09'),
(1657, '165.227.76.224', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-02-01 23:21:02', '2021-02-01 23:21:02'),
(1658, '138.68.73.41', 'unknown (unknown)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2021-02-02 01:21:37', '2021-02-02 01:21:37'),
(1659, '77.88.5.217', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2021-02-02 05:12:43', '2021-02-03 07:22:56'),
(1660, '192.71.42.108', 'unknown (unknown)', 'unknown', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-02-02 05:45:45', '2021-02-02 05:45:45'),
(1661, '27.109.113.246', 'Firefox (85.0)', 'Windows', '0', 'Guest', 'KH', 'Cambodia', 'Phnom Penh', 'Phnom Penh', '12101', NULL, '11.562999725342', '104.91500091553', 0, '2021-02-02 09:19:19', '2021-02-02 10:12:53'),
(1662, '99.198.101.34', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-02-02 09:22:48', '2021-02-02 09:22:48'),
(1663, '192.241.200.127', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-02-02 11:33:57', '2021-02-02 11:33:57'),
(1664, '173.236.9.186', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-02-02 11:39:00', '2021-02-04 10:32:07'),
(1665, '93.158.161.55', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Massachusetts', 'Newburyport', '01950', NULL, '42.814231872559', '-70.874519348145', 0, '2021-02-02 12:44:42', '2021-02-10 00:30:54'),
(1666, '49.36.145.145', 'Chrome (88.0.4324.96)', 'Linux', '0', 'Guest', 'IN', 'India', 'Haryana', 'Bithan', '127201', NULL, '28.600160598755', '75.76912689209', 0, '2021-02-02 13:21:19', '2021-02-02 13:32:56'),
(1667, '49.44.84.5', 'Chrome (85.0.4183.83)', 'Windows', '0', 'Guest', 'IN', 'India', 'Haryana', 'Gurgaon', '122001', NULL, '28.459499359131', '77.02660369873', 0, '2021-02-02 13:31:58', '2021-02-02 13:31:58'),
(1668, '13.66.139.141', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-02 14:27:20', '2021-02-10 23:26:10'),
(1669, '105.67.0.105', 'Chrome (79.0.3945.116)', 'Android', '0', 'Guest', 'MA', 'Morocco', 'Marrakech-Safi', 'Marrakech', '40000', NULL, '31.589239120483', '-7.8387598991394', 0, '2021-02-02 16:43:19', '2021-02-02 16:43:19'),
(1670, '8.208.91.112', 'unknown (unknown)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Camden Town', 'WC1A', NULL, '51.540000915527', '-0.16861000657082', 0, '2021-02-02 18:03:09', '2021-02-02 18:03:33'),
(1671, '157.230.58.101', 'Safari (4.0.7)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-02-02 18:32:02', '2021-02-02 18:32:02'),
(1672, '191.102.221.200', 'Chrome (88.0.4324.96)', 'Windows', '0', 'Guest', 'CO', 'Colombia', 'Atlántico', 'Palmar de Varela', '084007', NULL, '10.649959564209', '-74.800071716309', 0, '2021-02-02 19:49:53', '2021-02-02 19:49:53'),
(1673, '186.168.190.63', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'CO', 'Colombia', 'Bogota D.C.', 'Bogotá', NULL, NULL, '4.5999999046326', '-74.08332824707', 0, '2021-02-02 20:15:15', '2021-02-02 20:15:15'),
(1674, '168.61.39.6', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-02-02 21:44:31', '2021-02-02 21:44:31'),
(1675, '91.241.19.175', 'unknown (unknown)', 'unknown', '0', 'Guest', 'RU', 'Russia', 'St.-Petersburg', 'Saint Petersburg', '197375', NULL, '59.939041137695', '30.315790176392', 0, '2021-02-02 22:17:06', '2021-02-02 22:17:06'),
(1676, '46.166.139.111', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Brabant', 'Roosendaal', '4701', NULL, '51.533309936523', '4.4592099189758', 0, '2021-02-02 22:57:57', '2021-02-02 22:57:57');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `created_at`, `updated_at`) VALUES
(1677, '66.249.69.139', 'Chrome (88.0.4324.140)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-02-03 00:30:27', '2021-02-03 00:30:27'),
(1678, '3.101.110.31', 'Chrome (74.0.3729.131)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-02-03 00:36:41', '2021-02-03 00:36:41'),
(1679, '66.249.69.141', 'Chrome (88.0.4324.140)', 'Android', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-02-03 01:00:49', '2021-02-03 09:25:21'),
(1680, '79.124.62.182', 'unknown (unknown)', 'unknown', '0', 'Guest', 'BG', 'Bulgaria', 'Razgrad', 'Isperih', '7400', NULL, '43.716201782227', '26.830699920654', 0, '2021-02-03 04:23:29', '2021-02-03 04:23:29'),
(1681, '119.94.67.247', 'Chrome (86.0.4240.198)', 'Windows', '0', 'Guest', 'PH', 'Philippines', 'Metro Manila', 'Makati City', '0700', NULL, '14.566670417786', '121.03333282471', 0, '2021-02-03 07:11:26', '2021-02-03 07:11:26'),
(1682, '77.88.5.20', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FI', 'Finland', 'Uusimaa', 'Helsinki', '00100', NULL, '60.165000915527', '24.934999465942', 0, '2021-02-03 07:30:12', '2021-02-03 07:30:12'),
(1683, '67.212.167.242', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-02-03 07:32:50', '2021-02-03 07:32:50'),
(1684, '99.198.114.202', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-02-03 09:10:53', '2021-02-03 09:10:53'),
(1685, '66.249.69.143', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Mountain View', '94041', NULL, '37.388019561768', '-122.07431030273', 0, '2021-02-03 09:35:16', '2021-02-03 09:35:16'),
(1686, '185.220.100.251', 'Opera (11.01)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bayern', 'Hassfurt', '97437', NULL, '50.031539916992', '10.506739616394', 0, '2021-02-03 09:39:02', '2021-02-03 09:39:02'),
(1687, '144.168.213.235', 'Chrome (67.0.3396.87)', 'Windows', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-02-03 11:50:18', '2021-02-03 11:50:18'),
(1688, '173.236.9.250', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'US', 'United States', 'Illinois', 'Chicago', '60604', NULL, '41.87712097168', '-87.624732971191', 0, '2021-02-03 11:56:00', '2021-02-03 11:56:00'),
(1689, '198.20.103.18', 'Chrome (60.0.3112.113)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2021-02-03 13:33:55', '2021-02-03 13:33:55'),
(1690, '77.69.235.191', 'Chrome (87.0.4280.141)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-03 14:54:11', '2021-02-03 14:54:11'),
(1691, '192.241.205.179', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94124', NULL, '37.73078918457', '-122.38475036621', 0, '2021-02-03 15:18:59', '2021-02-03 15:18:59'),
(1692, '34.220.31.122', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-02-03 16:01:04', '2021-02-04 04:52:09'),
(1693, '169.47.43.210', 'Firefox (47.3)', 'Windows', '0', 'Guest', 'US', 'United States', 'Washington', 'Shaw', '20026', NULL, '38.906898498535', '-77.028396606445', 0, '2021-02-03 16:01:28', '2021-02-03 16:01:28'),
(1694, '45.7.165.29', 'Chrome (88.0.4324.93)', 'Android', '0', 'Guest', 'BR', 'Brazil', 'Espírito Santo', 'São Mateus', '29932-010', NULL, '-18.715990066528', '-39.871929168701', 0, '2021-02-03 17:53:31', '2021-02-03 17:53:31'),
(1695, '45.83.67.154', 'Firefox (65.0)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Berlin', 'Berlin', '12489', NULL, '52.435600280762', '13.543199539185', 0, '2021-02-03 19:08:58', '2021-02-03 19:08:58'),
(1696, '104.206.128.54', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Arizona', 'Ahwatukee Foothills', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2021-02-03 19:34:56', '2021-02-03 19:34:56'),
(1697, '185.247.224.66', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'RO', 'Romania', 'Bucureşti', 'Bucharest', '010011', NULL, '44.436550140381', '26.099349975586', 0, '2021-02-03 20:15:22', '2021-02-09 12:50:48'),
(1698, '85.159.209.106', 'Safari (5.1)', 'Apple', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'Leeds', 'LS1', NULL, '53.810279846191', '-1.5444400310516', 0, '2021-02-03 20:55:10', '2021-02-03 20:55:10'),
(1699, '207.46.13.109', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-03 21:17:55', '2021-02-03 21:17:55'),
(1700, '139.155.87.237', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Beijing', 'Beijing', '100000', NULL, '39.911758422852', '116.37922668457', 0, '2021-02-04 04:24:30', '2021-02-04 04:24:30'),
(1701, '46.101.24.44', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'GB', 'United Kingdom', 'England', 'North Shields', 'NE27', NULL, '55.026000976562', '-1.4859999418259', 0, '2021-02-04 04:53:29', '2021-02-04 05:08:45'),
(1702, '54.36.148.144', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-02-04 06:29:59', '2021-02-04 06:29:59'),
(1703, '82.78.180.119', 'Chrome (88.0.4324.146)', 'Windows', '0', 'Guest', 'RO', 'Romania', 'Bucureşti', 'Bucharest', '050557', NULL, '44.433841705322', '26.071479797363', 0, '2021-02-04 08:14:50', '2021-02-04 08:14:50'),
(1704, '84.255.151.182', 'Chrome (88.0.4324.96)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-04 08:47:24', '2021-02-04 08:47:24'),
(1705, '107.6.157.2', 'Chrome (66.0.3359.117)', 'Windows', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Amsterdam', '1014', NULL, '52.386779785156', '4.8467998504639', 0, '2021-02-04 14:25:05', '2021-02-04 14:25:05'),
(1706, '49.36.151.235', 'Chrome (88.0.4324.96)', 'Apple', '0', 'Guest', 'IN', 'India', 'Haryana', 'Miran', '127046', NULL, '28.848630905151', '75.73787689209', 0, '2021-02-04 14:55:18', '2021-02-04 14:55:18'),
(1707, '77.69.234.158', 'Chrome (88.0.4324.104)', 'Windows', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-04 16:17:44', '2021-02-04 16:17:44'),
(1708, '39.49.68.46', 'Chrome (88.0.4324.104)', 'Windows', '0', 'Guest', 'PK', 'Pakistan', 'Punjab', 'Rawalpindi', '46000', NULL, '33.61888885498', '73.056938171387', 0, '2021-02-04 17:26:51', '2021-02-04 17:26:51'),
(1709, '77.69.180.233', 'Chrome (49.0.2623.75)', 'Linux', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-04 18:18:11', '2021-02-04 18:18:11'),
(1710, '192.241.193.85', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-02-04 19:26:37', '2021-02-04 19:26:37'),
(1711, '180.149.125.171', 'Chrome (60.0.3112.90)', 'Windows', '0', 'Guest', 'MN', 'Mongolia', 'Ulaanbaatar', 'Ulan Bator', '13010', NULL, '47.919998168945', '106.91999816895', 0, '2021-02-04 19:44:08', '2021-02-04 19:44:08'),
(1712, '54.70.174.38', 'Internet Explorer (7.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-02-05 01:07:21', '2021-02-05 01:07:21'),
(1713, '192.241.214.134', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94538', NULL, '37.535888671875', '-121.96466827393', 0, '2021-02-05 02:01:18', '2021-02-05 02:01:18'),
(1714, '92.118.160.33', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2021-02-05 02:28:11', '2021-02-05 02:28:11'),
(1715, '23.90.145.59', 'Chrome (86.0.4)', 'Linux', '0', 'Guest', 'DE', 'Germany', 'Lower Saxony', 'Stade', '21680', NULL, '53.585300445557', '9.4637002944946', 0, '2021-02-05 02:29:36', '2021-02-05 02:29:36'),
(1716, '84.246.145.114', 'Chrome (85.0.4183.121)', 'Windows', '0', 'Guest', 'IT', 'Italy', 'Piedmont', 'Tortona', '15057', NULL, '44.892700195312', '8.8027000427246', 0, '2021-02-05 03:44:04', '2021-02-05 03:44:04'),
(1717, '65.49.20.69', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Fremont', '94539', NULL, '37.528789520264', '-121.91031646729', 0, '2021-02-05 05:59:19', '2021-02-05 05:59:19'),
(1718, '54.36.149.49', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-02-05 07:55:19', '2021-02-05 07:55:19'),
(1719, '43.252.248.40', 'Chrome (89.0.4389.40)', 'Windows', '0', 'Guest', 'IN', 'India', 'Tamil Nadu', 'Saint Thomas Mount', '600001', NULL, '13.052399635315', '80.250801086426', 0, '2021-02-05 08:19:25', '2021-02-05 08:19:25'),
(1720, '107.189.30.85', 'Internet Explorer (10.0,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Cheyenne', '82001', NULL, '41.141841888428', '-104.77919006348', 0, '2021-02-05 08:37:20', '2021-02-11 02:58:11'),
(1721, '13.66.139.2', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-05 08:44:32', '2021-02-10 14:07:38'),
(1722, '45.56.100.192', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Utah', 'Provo', '84602', NULL, '40.248748779297', '-111.64987945557', 0, '2021-02-05 11:34:59', '2021-02-05 11:34:59'),
(1723, '209.17.96.162', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'New York', 'Manhattan', '10020', NULL, '40.758911132812', '-73.979019165039', 0, '2021-02-05 14:45:55', '2021-02-05 14:45:55'),
(1724, '84.17.60.85', 'Internet Explorer (11.0)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75001', NULL, '48.860229492188', '2.3410699367523', 0, '2021-02-05 15:34:17', '2021-02-05 15:34:17'),
(1725, '205.185.121.107', 'Internet Explorer (10.0,)', 'Windows', '0', 'Guest', 'US', 'United States', 'Nevada', 'Spring Valley', '89146', NULL, '36.142398834229', '-115.22485351562', 0, '2021-02-05 17:20:03', '2021-02-05 17:20:03'),
(1726, '92.118.161.33', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', NULL, NULL, NULL, NULL, '37.880001068115', '-96.794998168945', 0, '2021-02-05 18:05:51', '2021-02-05 18:05:51'),
(1727, '38.18.42.165', 'Chrome (80.0.3987.122)', 'Windows', '0', 'Guest', 'US', 'United States', 'Ohio', 'Hough', '44127', NULL, '41.473861694336', '-81.647338867188', 0, '2021-02-05 18:31:19', '2021-02-05 18:31:19'),
(1728, '89.187.164.249', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'Texas', 'Dallas', '75219', NULL, '32.805431365967', '-96.814231872559', 0, '2021-02-05 19:24:32', '2021-02-05 19:24:39'),
(1729, '81.91.132.132', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'IR', 'Iran', 'Tehrān', 'Tehran', '10000', NULL, '35.6872215271', '51.415279388428', 0, '2021-02-05 20:14:42', '2021-02-05 20:14:42'),
(1730, '54.191.238.199', 'Chrome (76.0.3809.100)', 'Apple', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-02-05 22:14:28', '2021-02-05 22:14:29'),
(1731, '45.63.87.204', 'Firefox (77.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95113', NULL, '37.334060668945', '-121.89206695557', 0, '2021-02-06 01:10:17', '2021-02-06 01:10:17'),
(1732, '162.142.125.121', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Michigan', 'Ann Arbor', '48104', NULL, '42.273170471191', '-83.714179992676', 0, '2021-02-06 03:40:59', '2021-02-06 03:40:59'),
(1733, '188.165.210.14', 'Chrome (46.0.2490.80)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Vitry-sur-Seine', '94400', NULL, '48.789440155029', '2.389319896698', 0, '2021-02-06 03:55:46', '2021-02-06 03:57:35'),
(1734, '95.91.107.69', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Thuringia', 'Gera', '07548', NULL, '50.865001678467', '12.026000022888', 0, '2021-02-06 04:32:34', '2021-02-06 04:32:54'),
(1735, '165.227.165.108', 'GoogleBot (2.1)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Hesse', 'Frankfurt am Main', '60311', NULL, '50.110900878906', '8.6821002960205', 0, '2021-02-06 05:05:56', '2021-02-06 05:05:56'),
(1736, '23.129.64.230', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-02-06 06:38:25', '2021-02-06 06:38:25'),
(1737, '144.168.36.114', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'JP', 'Japan', 'Tokyo', 'Urayasu', '135-0043', NULL, '35.663139343262', '139.80975341797', 0, '2021-02-06 07:23:51', '2021-02-08 10:33:04'),
(1738, '207.148.71.41', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'SG', 'Singapore', NULL, 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-02-06 07:56:40', '2021-02-06 07:56:40'),
(1739, '192.241.218.190', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-02-06 13:18:40', '2021-02-06 13:18:40'),
(1740, '47.133.98.219', 'Chrome (44.0.2403.133)', 'Android', '0', 'Guest', 'US', 'United States', 'North Carolina', 'Manteo', '27954', NULL, '35.89501953125', '-75.670677185059', 0, '2021-02-06 13:54:08', '2021-02-06 13:54:08'),
(1741, '80.76.42.148', 'unknown (unknown)', 'unknown', '0', 'Guest', 'UA', 'Ukraine', NULL, NULL, NULL, NULL, '49', '32', 0, '2021-02-06 18:15:58', '2021-02-07 11:10:01'),
(1742, '178.32.197.81', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Pays de la Loire', 'Nantes', '44000', NULL, '47.21683883667', '-1.5567400455475', 0, '2021-02-06 20:07:49', '2021-02-06 20:07:49'),
(1743, '185.220.101.200', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'DE', 'Germany', 'Brandenburg', 'Hennigsdorf', '14621', NULL, '52.619831085205', '13.127429962158', 0, '2021-02-06 20:14:53', '2021-02-06 20:14:53'),
(1744, '107.175.38.29', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-02-07 01:34:22', '2021-02-07 01:34:22'),
(1745, '198.46.210.62', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14202', NULL, '42.888301849365', '-78.885398864746', 0, '2021-02-07 01:34:51', '2021-02-07 01:36:48'),
(1746, '54.205.41.117', 'Chrome (60.0.3004.101)', 'Windows', '0', 'Guest', 'US', 'United States', 'Virginia', 'Ashburn', '20147', NULL, '39.043701171875', '-77.474197387695', 0, '2021-02-07 06:28:44', '2021-02-07 06:28:44'),
(1747, '207.46.13.80', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-07 11:59:42', '2021-02-07 11:59:42'),
(1748, '54.36.149.53', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Hauts-de-France', 'Roubaix', '59100', NULL, '50.691268920898', '3.1732099056244', 0, '2021-02-07 15:12:40', '2021-02-07 15:12:40'),
(1749, '205.185.115.150', 'Firefox (5.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'Wyoming', 'Cheyenne', '82001', NULL, '41.141841888428', '-104.77919006348', 0, '2021-02-07 16:28:18', '2021-02-08 00:24:23'),
(1750, '192.241.211.230', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-02-07 17:39:17', '2021-02-07 17:39:17'),
(1751, '106.210.103.34', 'Chrome (90.0.4408.5)', 'Windows', '0', 'Guest', 'IN', 'India', 'Haryana', 'Gurgaon', '122051', NULL, '28.354209899902', '76.968627929688', 0, '2021-02-07 18:13:09', '2021-02-07 18:13:09'),
(1752, '163.172.69.204', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-02-07 18:50:11', '2021-02-07 18:51:36'),
(1753, '217.182.189.33', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'FR', 'France', 'Nouvelle-Aquitaine', 'Bordeaux', '33000', NULL, '44.837371826172', '-0.57613998651505', 0, '2021-02-07 19:07:27', '2021-02-07 19:22:01'),
(1754, '144.91.101.221', 'Opera (54.0.2952.64)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '81549', NULL, '48.108898162842', '11.607399940491', 0, '2021-02-07 22:03:33', '2021-02-07 22:03:33'),
(1755, '31.171.155.6', 'Chrome (68.0.3440.106)', 'Windows', '0', 'Guest', 'AL', 'Albania', 'Tirana', 'Tirana', NULL, NULL, '41.329990386963', '19.829990386963', 0, '2021-02-07 22:41:06', '2021-02-07 22:41:09'),
(1756, '54.183.172.191', 'Chrome (50.0.2661.102)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-02-08 01:28:23', '2021-02-08 01:28:23'),
(1757, '192.99.18.108', 'Firefox (72.0)', 'Linux', '0', 'Guest', 'CA', 'Canada', 'Quebec', 'Montréal', 'H2Y 2J7', NULL, '45.50207901001', '-73.56201171875', 0, '2021-02-08 02:14:34', '2021-02-08 02:14:39'),
(1758, '13.66.139.139', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-08 03:36:12', '2021-02-08 04:05:24'),
(1759, '18.236.188.40', 'Chrome (88.0.4324.96)', 'Windows', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-02-08 05:19:40', '2021-02-08 05:19:41'),
(1760, '178.128.75.83', 'Safari (5.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-02-08 05:40:34', '2021-02-08 05:40:34'),
(1761, '217.226.223.146', 'Chrome (88.0.4324.150)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Bavaria', 'Munich', '80331', NULL, '48.136199951172', '11.57289981842', 0, '2021-02-08 08:56:11', '2021-02-08 08:56:11'),
(1762, '218.26.172.61', 'Chrome (83.0.4103.97)', 'Windows', '0', 'Guest', 'CN', 'China', 'Shanxi', 'Taiyuan', '030000', NULL, '37.846668243408', '112.561668396', 0, '2021-02-08 09:40:03', '2021-02-08 09:40:03'),
(1763, '94.76.23.56', 'Safari (14.0.3)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-08 11:06:57', '2021-02-08 11:06:57'),
(1764, '51.15.191.81', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-02-08 12:46:27', '2021-02-08 12:46:27'),
(1765, '195.154.62.232', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Paris', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-02-08 13:40:00', '2021-02-08 13:40:00'),
(1766, '107.172.64.184', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-02-08 16:20:29', '2021-02-08 16:20:29'),
(1767, '23.94.230.251', 'Chrome (65.0.3325.181)', 'Apple', '0', 'Guest', 'US', 'United States', 'New York', 'Cheektowaga', '14211', NULL, '42.907581329346', '-78.819129943848', 0, '2021-02-08 16:20:40', '2021-02-08 16:22:59'),
(1768, '171.13.14.76', 'Chrome (75.0.3765.0)', 'Android', '0', 'Guest', 'CN', 'China', 'Henan', 'Zhengzhou', '450000', NULL, '34.741111755371', '113.68556213379', 0, '2021-02-08 16:54:40', '2021-02-08 16:54:40'),
(1769, '180.163.220.4', 'Chrome (57.0.2987.108)', 'Android', '0', 'Guest', 'CN', 'China', 'Shanghai', 'Shanghai', '200000', NULL, '31.228469848633', '121.47020721436', 0, '2021-02-08 16:55:44', '2021-02-08 16:55:44'),
(1770, '171.13.14.35', 'Chrome (78.0.3904.87)', 'Windows', '0', 'Guest', 'CN', 'China', 'Henan', 'Zhengzhou', '450000', NULL, '34.741111755371', '113.68556213379', 0, '2021-02-08 16:55:47', '2021-02-08 16:55:47'),
(1771, '94.76.15.133', 'iPhone (14.0.2)', 'iPhone', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-08 18:12:27', '2021-02-08 18:12:27'),
(1772, '157.55.39.223', 'Bing Bot (2.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Quincy', '98848', NULL, '47.206031799316', '-119.79933929443', 0, '2021-02-08 18:14:28', '2021-02-08 18:14:28'),
(1773, '40.71.118.135', 'Safari (5.1)', 'Apple', '0', 'Guest', 'US', 'United States', 'Virginia', 'Washington', '22747', NULL, '38.730781555176', '-78.171966552734', 0, '2021-02-08 18:30:16', '2021-02-08 18:30:16'),
(1774, '192.241.210.26', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94117', NULL, '37.76916885376', '-122.44249725342', 0, '2021-02-08 19:38:59', '2021-02-08 19:38:59'),
(1775, '193.37.33.7', 'Chrome (80.0.3987.149)', 'Windows', '0', 'Guest', 'SG', 'Singapore', 'South West', 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-02-08 20:28:42', '2021-02-08 20:28:42'),
(1776, '91.185.71.198', 'Chrome (74.0.3729.169)', 'Windows', '0', 'Guest', 'RU', 'Russia', 'Udmurtiya Republic', 'Izhevsk', '426000', NULL, '56.849758148193', '53.204479217529', 0, '2021-02-09 01:56:10', '2021-02-09 01:56:10'),
(1777, '159.65.206.10', 'unknown (unknown)', 'unknown', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-02-09 02:16:08', '2021-02-09 02:16:08'),
(1778, '94.76.23.11', 'Chrome (88.0.4324.150)', 'Apple', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-09 05:37:39', '2021-02-11 09:24:37'),
(1779, '45.33.88.226', 'Firefox (8.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Newark', '07103', NULL, '40.738731384277', '-74.194526672363', 0, '2021-02-09 05:45:16', '2021-02-09 05:45:16'),
(1780, '45.33.86.118', 'Firefox (8.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'New Jersey', 'Newark', '07103', NULL, '40.738731384277', '-74.194526672363', 0, '2021-02-09 07:12:19', '2021-02-09 07:12:19'),
(1781, '23.129.64.217', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Washington', 'Seattle', '98104', NULL, '47.602130889893', '-122.32843017578', 0, '2021-02-09 08:19:40', '2021-02-09 08:19:40'),
(1782, '44.227.13.4', 'Chrome (83.0.4103.97)', 'Linux', '0', 'Guest', 'US', 'United States', 'Oregon', 'Boardman', '97818', NULL, '45.737228393555', '-119.81143188477', 0, '2021-02-09 10:05:18', '2021-02-09 10:05:18'),
(1783, '103.141.137.214', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'VN', 'Vietnam', 'Ha Noi', 'Me Linh', '142002', NULL, '21.192279815674', '105.72415161133', 0, '2021-02-09 18:59:00', '2021-02-09 18:59:00'),
(1784, '163.172.25.234', 'Chrome (27.0.1453.93)', 'Windows', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Saint-Ouen', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-02-09 22:56:13', '2021-02-09 22:56:13'),
(1785, '89.248.165.33', 'Chrome (81.0.4044.129)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-02-09 23:49:12', '2021-02-09 23:51:15'),
(1786, '80.82.77.42', 'Chrome (81.0.4044.129)', 'Linux', '0', 'Guest', 'NL', 'Netherlands', 'North Holland', 'Diemen', '1101', NULL, '52.309051513672', '4.9401898384094', 0, '2021-02-09 23:50:50', '2021-02-09 23:53:32'),
(1787, '192.241.222.149', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-02-10 00:57:08', '2021-02-10 00:57:08'),
(1788, '62.4.14.198', 'Firefox (58.0)', 'Linux', '0', 'Guest', 'FR', 'France', 'Île-de-France', 'Saint-Ouen', '75008', NULL, '48.881401062012', '2.3364999294281', 0, '2021-02-10 02:56:28', '2021-02-10 02:56:28'),
(1789, '77.89.228.66', 'Firefox (9.0.1)', 'Windows', '0', 'Guest', 'MD', 'Moldova', 'Chișinău Municipality', 'Chisinau', 'MD-2000', NULL, '47.026901245117', '28.841600418091', 0, '2021-02-10 07:29:44', '2021-02-10 07:29:44'),
(1790, '216.151.27.66', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'San Francisco', '94105', NULL, '37.788539886475', '-122.39386749268', 0, '2021-02-10 08:04:08', '2021-02-11 07:34:34'),
(1791, '130.185.156.142', 'Edge (17.17134,gzipgfe)', 'Windows', '0', 'Guest', 'SE', 'Sweden', 'Stockholm', 'Stockholm', '118 58', NULL, '59.315120697021', '18.051319122314', 0, '2021-02-10 08:53:17', '2021-02-10 08:53:17'),
(1792, '170.130.187.22', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Arizona', 'Ahwatukee Foothills', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2021-02-10 08:56:39', '2021-02-10 08:56:39'),
(1793, '13.56.211.208', 'Chrome (79.0)', 'Windows', '0', 'Guest', 'US', 'United States', 'California', 'San Jose', '95122', NULL, '37.330528259277', '-121.83822631836', 0, '2021-02-10 12:08:53', '2021-02-10 12:08:54'),
(1794, '162.241.148.86', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Utah', 'Provo', '84606', NULL, '40.215801239014', '-111.61242675781', 0, '2021-02-10 13:54:13', '2021-02-10 13:54:13'),
(1795, '129.146.121.54', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'US', 'United States', 'Arizona', 'Alhambra', '85013', NULL, '33.509380340576', '-112.08255004883', 0, '2021-02-10 18:48:37', '2021-02-10 18:48:38'),
(1796, '39.96.140.103', 'unknown (unknown)', 'unknown', '0', 'Guest', 'CN', 'China', 'Zhejiang', 'Hangzhou', '310000', NULL, '30.235559463501', '120.15888977051', 0, '2021-02-10 19:22:15', '2021-02-10 19:22:55'),
(1797, '31.171.155.9', 'Chrome (68.0.3440.106)', 'Windows', '0', 'Guest', 'AL', 'Albania', 'Tirana', 'Tirana', NULL, NULL, '41.329990386963', '19.829990386963', 0, '2021-02-10 20:02:06', '2021-02-10 20:02:11'),
(1798, '78.42.192.153', 'Chrome (88.0.4324.150)', 'Windows', '0', 'Guest', 'DE', 'Germany', 'Baden-Württemberg', 'Stuttgart', '70173', NULL, '48.775398254395', '9.1817998886108', 0, '2021-02-10 21:09:55', '2021-02-10 21:09:55'),
(1799, '167.172.97.238', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Colorado', 'Broomfield', '80021', NULL, '39.892608642578', '-105.14920043945', 0, '2021-02-10 23:27:21', '2021-02-10 23:27:21'),
(1800, '104.140.188.38', 'unknown (unknown)', 'unknown', '0', 'Guest', 'US', 'United States', 'Arizona', 'Ahwatukee Foothills', '85282', NULL, '33.393901824951', '-111.92906188965', 0, '2021-02-11 00:51:29', '2021-02-11 00:51:29'),
(1801, '20.184.3.245', 'Chrome (78.0.3904.108)', 'Windows', '0', 'Guest', 'SG', 'Singapore', 'South West', 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-02-11 00:56:19', '2021-02-11 00:56:22'),
(1802, '192.241.218.119', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'California', 'Palo Alto', '94301', NULL, '37.442958831787', '-122.15119934082', 0, '2021-02-11 03:13:35', '2021-02-11 03:13:35'),
(1803, '124.156.241.4', 'Chrome (86.0.4)', 'Linux', '0', 'Guest', 'SG', 'Singapore', 'South West', 'Singapore', NULL, NULL, '1.3200000524521', '103.81980133057', 0, '2021-02-11 04:57:32', '2021-02-11 04:57:32'),
(1804, '77.69.229.231', 'Chrome (88.0.4324.146)', 'Android', '0', 'Guest', 'BH', 'Bahrain', 'Manama', 'Manama', '317', NULL, '26.227779388428', '50.584720611572', 0, '2021-02-11 08:38:17', '2021-02-11 08:59:04'),
(1805, '209.17.97.90', 'Mozilla (5.0)', 'unknown', '0', 'Guest', 'US', 'United States', 'Florida', 'Flagami', '33144', NULL, '25.762859344482', '-80.311958312988', 0, '2021-02-11 09:11:00', '2021-02-11 09:11:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`),
  ADD UNIQUE KEY `companies_phone_unique` (`phone`);

--
-- Indexes for table `company_users`
--
ALTER TABLE `company_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_users_user_id_index` (`user_id`),
  ADD KEY `company_users_company_id_index` (`company_id`);

--
-- Indexes for table `confirmation_tokens`
--
ALTER TABLE `confirmation_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `confirmation_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`),
  ADD KEY `projects_company_id_index` (`company_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_role_id_index` (`role_id`),
  ADD KEY `role_permissions_permission_id_index` (`permission_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_users`
--
ALTER TABLE `team_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_users_team_id_index` (`team_id`),
  ADD KEY `team_users_user_id_index` (`user_id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_ticket_id_unique` (`ticket_id`);

--
-- Indexes for table `two_factor`
--
ALTER TABLE `two_factor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `two_factor_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `user_permissions_user_id_index` (`user_id`),
  ADD KEY `user_permissions_permission_id_index` (`permission_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `visitlogs`
--
ALTER TABLE `visitlogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_users`
--
ALTER TABLE `company_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `confirmation_tokens`
--
ALTER TABLE `confirmation_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `team_users`
--
ALTER TABLE `team_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2978;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `two_factor`
--
ALTER TABLE `two_factor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visitlogs`
--
ALTER TABLE `visitlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1806;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company_users`
--
ALTER TABLE `company_users`
  ADD CONSTRAINT `company_users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `company_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `confirmation_tokens`
--
ALTER TABLE `confirmation_tokens`
  ADD CONSTRAINT `confirmation_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_users`
--
ALTER TABLE `team_users`
  ADD CONSTRAINT `team_users_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `team_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `two_factor`
--
ALTER TABLE `two_factor`
  ADD CONSTRAINT `two_factor_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
