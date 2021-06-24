/* 返利 */
ALTER TABLE `user` ADD `c_rebate` INT(11) NOT NULL DEFAULT '0' COMMENT '循环返利';
ALTER TABLE `user` ADD `rebate` INT(11) NOT NULL DEFAULT '-1' COMMENT '返利百分比';

/* 套餐购买记录增加生效套餐字段 */
ALTER TABLE `bought` ADD `usedd` INT(2) NOT NULL DEFAULT '0' COMMENT '生效套餐' AFTER `price`;

/* 商店支付回调购买套餐 */
ALTER TABLE `paylist` 
ADD COLUMN `shop` text NULL COMMENT '商店支付回调购买套餐' AFTER `datetime`;

/* 节点使用单独的端口, 协议, 混淆, 加密 */
ALTER TABLE	`ss_node` ADD `protocol` VARCHAR(50) NULL AFTER `method`,
ADD	`obfs` VARCHAR(50) NULL AFTER `protocol`,
ADD	`port` INT NULL AFTER `obfs`,
ADD	`passwd` VARCHAR(50) NULL AFTER `port`;

/* 节点筛选 */
ALTER TABLE `link` ADD COLUMN `filter` TEXT NULL DEFAULT NULL COMMENT '节点筛选' AFTER `method`;
-- --------------------------------------------------------

--
-- 表的结构 `help`
--

CREATE TABLE `help`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `markdown` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `ontop` int(11) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `help_class`
--

CREATE TABLE `help_class`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `upid` int(10) NULL DEFAULT NULL COMMENT '上级分类ID',
  `li` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字体图标',
  `pageshow` int(5) NULL DEFAULT NULL COMMENT '是否在页面显示',
  `sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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