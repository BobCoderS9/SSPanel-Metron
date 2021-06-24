/* 套餐购买记录增加生效套餐字段 */
ALTER TABLE `bought` ADD `usedd` INT(2) NOT NULL DEFAULT '0' COMMENT '生效套餐' AFTER `price`;