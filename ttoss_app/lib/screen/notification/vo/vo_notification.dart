import 'package:ttoss_app/screen/notification/vo/notification_type.dart';

class Notification {
  final NotificationType type;
  final String description;
  final DateTime time;

  Notification(this.type, this.description, this.time);
}