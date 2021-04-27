create database medbnb;

use medbnb;

CREATE TABLE `user` (
  `id` BINARY(16) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rate` DOUBLE,
  `languages` JSON NOT NULL,
  `picture` VARCHAR(255)
);

CREATE TABLE `property` (
  `id` BINARY(16) PRIMARY KEY,
  `status` VARCHAR(255) NOT NULL,
  `location` POINT NOT NULL,
  `amenities` JSON NOT NULL,
  `photos` JSON NOT NULL,
  `owner` BINARY(16) NOT NULL,
  `max_guests` INTEGER,
  `beds` JSON NOT NULL,
  `description` LONGTEXT NOT NULL
);

CREATE INDEX `idx_property__owner` ON `property` (`owner`);

ALTER TABLE `property` ADD CONSTRAINT `fk_property__owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `rate` (
  `id` BINARY(16) PRIMARY KEY,
  `property` BINARY(16) NOT NULL,
  `rate` DOUBLE NOT NULL,
  `message` LONGTEXT NOT NULL,
  `user` BINARY(16) NOT NULL
);

CREATE INDEX `idx_rate__property` ON `rate` (`property`);

CREATE INDEX `idx_rate__user` ON `rate` (`user`);

ALTER TABLE `rate` ADD CONSTRAINT `fk_rate__property` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE;

ALTER TABLE `rate` ADD CONSTRAINT `fk_rate__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `request` (
  `id` BINARY(16) PRIMARY KEY,
  `status` VARCHAR(255) NOT NULL,
  `property` BINARY(16) NOT NULL,
  `owner` BINARY(16) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `start_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `end_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `check_in` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `check_out` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `guests` INTEGER
);

CREATE INDEX `idx_request__owner` ON `request` (`owner`);

CREATE INDEX `idx_request__property` ON `request` (`property`);

ALTER TABLE `request` ADD CONSTRAINT `fk_request__owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

ALTER TABLE `request` ADD CONSTRAINT `fk_request__property` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE;

CREATE TABLE `comment` (
  `id` BINARY(16) PRIMARY KEY,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request` BINARY(16) NOT NULL
);

CREATE INDEX `idx_comment__request` ON `comment` (`request`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`) ON DELETE CASCADE;

CREATE TABLE `payment` (
  `id` BINARY(16) PRIMARY KEY,
  `user` BINARY(16) NOT NULL,
  `request` BINARY(16),
  `status` VARCHAR(255) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_payment__request` ON `payment` (`request`);

CREATE INDEX `idx_payment__user` ON `payment` (`user`);

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`) ON DELETE SET NULL;

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `reservation` (
  `id` BINARY(16) PRIMARY KEY,
  `start_date` DATETIME,
  `end_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `owner` BINARY(16) NOT NULL,
  `property` BINARY(16) NOT NULL,
  `request` BINARY(16) NOT NULL
);

CREATE INDEX `idx_reservation__owner` ON `reservation` (`owner`);

CREATE INDEX `idx_reservation__property` ON `reservation` (`property`);

CREATE INDEX `idx_reservation__request` ON `reservation` (`request`);

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__property` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE;

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`)
