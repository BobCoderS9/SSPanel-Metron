ALTER TABLE `paylist` 
ADD COLUMN `shop` text NULL COMMENT '商店支付回调购买套餐' AFTER `datetime`;