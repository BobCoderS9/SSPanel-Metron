/* 节点使用单独的端口, 协议, 混淆, 加密 */
ALTER TABLE	`ss_node` ADD `protocol` VARCHAR(50) NULL AFTER `method`,
ADD	`obfs` VARCHAR(50) NULL AFTER `protocol`,
ADD	`port` INT NULL AFTER `obfs`,
ADD	`passwd` VARCHAR(50) NULL AFTER `port`;