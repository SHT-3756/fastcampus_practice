import 'package:ttoss_app/common/dart/extension/num_duration_extension.dart';
import 'package:ttoss_app/screen/notification/vo/notification_type.dart';
import 'package:ttoss_app/screen/notification/vo/vo_notification.dart';

final notificationDummies = <TtossNotification>[
  TtossNotification(
    NotificationType.tossPay,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.luck,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(1.hours),
  ),
  TtossNotification(
    NotificationType.moneyTip,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.people,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.stock,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.walk,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  TtossNotification(
    NotificationType.tossPay,
    '이번주에 영화 한편 어때요? 할인 쿠폰 두장 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),

];
