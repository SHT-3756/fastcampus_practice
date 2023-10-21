import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';
import 'package:ttoss_app/screen/notification/w_notification_item.dart';

import 'vo/vo_notification.dart';

class NotificationDialog extends DialogWidget {
  final List<TtossNotification> notification;

  NotificationDialog(this.notification, {Key? key}) : super(key: key, animation: NavAni.Bottom);

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 투명
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...widget.notification.map(
            (e) => NotificationItemWidget(
              notification: e,
              onTap: () {
                widget.hide();
              },
            ),
          )
        ],
      ),
    );
  }
}
