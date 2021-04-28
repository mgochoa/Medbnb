GRANT ALL PRIVILEGES ON medbnb.* TO 'backend'@'%';

CREATE TABLE `user` (
  `id` VARCHAR(36) PRIMARY KEY,
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
  `id` VARCHAR(36) PRIMARY KEY,
  `status` VARCHAR(255) NOT NULL,
  `location` POINT NOT NULL,
  `amenities` JSON NOT NULL,
  `photos` JSON NOT NULL,
  `owner` VARCHAR(36) NOT NULL,
  `max_guests` INTEGER,
  `beds` JSON NOT NULL,
  `description` LONGTEXT NOT NULL
);

CREATE INDEX `idx_property__owner` ON `property` (`owner`);

ALTER TABLE `property` ADD CONSTRAINT `fk_property__owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `rate` (
  `id` VARCHAR(36) PRIMARY KEY,
  `property` VARCHAR(36) NOT NULL,
  `rate` DOUBLE NOT NULL,
  `message` LONGTEXT NOT NULL,
  `user` VARCHAR(36) NOT NULL
);

CREATE INDEX `idx_rate__property` ON `rate` (`property`);

CREATE INDEX `idx_rate__user` ON `rate` (`user`);

ALTER TABLE `rate` ADD CONSTRAINT `fk_rate__property` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE;

ALTER TABLE `rate` ADD CONSTRAINT `fk_rate__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `request` (
  `id` VARCHAR(36) PRIMARY KEY,
  `status` VARCHAR(255) NOT NULL,
  `property` VARCHAR(36) NOT NULL,
  `owner` VARCHAR(36) NOT NULL,
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
  `id` VARCHAR(36) PRIMARY KEY,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request` VARCHAR(36) NOT NULL
);

CREATE INDEX `idx_comment__request` ON `comment` (`request`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`) ON DELETE CASCADE;

CREATE TABLE `payment` (
  `id` VARCHAR(36) PRIMARY KEY,
  `user` VARCHAR(36) NOT NULL,
  `request` VARCHAR(36),
  `status` VARCHAR(255) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_payment__request` ON `payment` (`request`);

CREATE INDEX `idx_payment__user` ON `payment` (`user`);

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`) ON DELETE SET NULL;

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

CREATE TABLE `reservation` (
  `id` VARCHAR(36) PRIMARY KEY,
  `start_date` DATETIME,
  `end_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `owner` VARCHAR(36) NOT NULL,
  `property` VARCHAR(36) NOT NULL,
  `request` VARCHAR(36) NOT NULL
);

CREATE INDEX `idx_reservation__owner` ON `reservation` (`owner`);

CREATE INDEX `idx_reservation__property` ON `reservation` (`property`);

CREATE INDEX `idx_reservation__request` ON `reservation` (`request`);

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__property` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE;

ALTER TABLE `reservation` ADD CONSTRAINT `fk_reservation__request` FOREIGN KEY (`request`) REFERENCES `request` (`id`)