-- CreateTable
CREATE TABLE `Tb_situation` (
    `id_situation` INTEGER NOT NULL AUTO_INCREMENT,
    `opened` BOOLEAN NOT NULL,
    `mask` VARCHAR(200) NOT NULL,
    `towel` VARCHAR(200) NOT NULL,
    `fountain` VARCHAR(200) NOT NULL,
    `locker_room` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`id_situation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tb_address` (
    `id_address` INTEGER NOT NULL AUTO_INCREMENT,
    `street` VARCHAR(200) NOT NULL,
    `number` VARCHAR(45) NULL,
    `district` VARCHAR(200) NOT NULL,
    `city` VARCHAR(200) NOT NULL,
    `state` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`id_address`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tb_schedules` (
    `id_schedules` INTEGER NOT NULL AUTO_INCREMENT,
    `weekday_open` VARCHAR(50) NOT NULL,
    `weekday_close` VARCHAR(50) NOT NULL,
    `weekday_hour_open` VARCHAR(50) NOT NULL,
    `weekday_hour_close` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_schedules`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tb_unit` (
    `id_unit` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `Fk_id_address` INTEGER NOT NULL,
    `Fk_id_situation` INTEGER NOT NULL,

    UNIQUE INDEX `Tb_unit_Fk_id_address_key`(`Fk_id_address`),
    UNIQUE INDEX `Tb_unit_Fk_id_situation_key`(`Fk_id_situation`),
    PRIMARY KEY (`id_unit`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tb_unit_schedules` (
    `Fk_id_unit` INTEGER NOT NULL,
    `Fk_id_schedules` INTEGER NOT NULL,

    PRIMARY KEY (`Fk_id_unit`, `Fk_id_schedules`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Tb_unit` ADD CONSTRAINT `Tb_unit_Fk_id_address_fkey` FOREIGN KEY (`Fk_id_address`) REFERENCES `Tb_address`(`id_address`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tb_unit` ADD CONSTRAINT `Tb_unit_Fk_id_situation_fkey` FOREIGN KEY (`Fk_id_situation`) REFERENCES `Tb_situation`(`id_situation`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tb_unit_schedules` ADD CONSTRAINT `Tb_unit_schedules_Fk_id_unit_fkey` FOREIGN KEY (`Fk_id_unit`) REFERENCES `Tb_unit`(`id_unit`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tb_unit_schedules` ADD CONSTRAINT `Tb_unit_schedules_Fk_id_schedules_fkey` FOREIGN KEY (`Fk_id_schedules`) REFERENCES `Tb_schedules`(`id_schedules`) ON DELETE RESTRICT ON UPDATE CASCADE;
