/* 返利 */
ALTER TABLE `user` ADD `c_rebate` INT(11) NOT NULL DEFAULT '0' COMMENT '循环返利';
ALTER TABLE `user` ADD `rebate` INT(11) NOT NULL DEFAULT '-1' COMMENT '返利百分比';