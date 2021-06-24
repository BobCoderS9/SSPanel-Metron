/* 代理商 */
ALTER TABLE `user` ADD `back_money` decimal(12, 2) NOT NULL DEFAULT '0.00' COMMENT '返利金额' AFTER `rebate`;
ALTER TABLE `user` ADD `agent` INT(2) NOT NULL DEFAULT '0' COMMENT '代理商' AFTER `back_money`;
ALTER TABLE `user` ADD `config` text DEFAULT NULL COMMENT '用户配置' AFTER `agent`;

/* 提现记录表 */
CREATE TABLE `payback_take_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(3) NULL DEFAULT 0,
  `userid` int(11) NULL DEFAULT 0,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT 0,
  `datetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;