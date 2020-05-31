USE `smartpension`;
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('1', '0', 1, '卡号消失', '若30s内未接收到信号则判断卡消失', '30');
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('2', '0', 2, '卡离开区域', '若5s内未出现在区域内则判断卡已离开区域', '5');
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('3', '0', 3, '卡进入区域', '12s内有五次落入区域内认为进去该区域', '12');
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('4', '0', 4, '不动报警', '范围小于1米时为不动状态', '1');
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('5', '0', 5, '报警间隔', '告警间隔5s(除开呼救、求救、低电压报警)', '5');
INSERT INTO `iotlocation_system` (`id`, `shop_id`, `type`, `label`, `context`, `value`) VALUES ('6', '0', 6, '最远距离', '告警发生地点距离摄像头的距离范围30m', '30');