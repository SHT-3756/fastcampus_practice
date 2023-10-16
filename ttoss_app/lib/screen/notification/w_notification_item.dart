import 'package:flutter/material.dart';
import 'package:ttoss_app/common/common.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'vo/vo_notification.dart';

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;

  const NotificationItemWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const leftPadding = 10.0;
  static const iconWidth = 25.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: widget.notification.isRead
          ? context.backgroundColor
          : context.appColors.unReadColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Width(leftPadding),
              Image.asset(
                widget.notification.type.iconPath,
                width: iconWidth,
              ),
              widget.notification.type.name.text
                  .size(12)
                  .color(context.appColors.lessImportantText)
                  .make(),
              emptyExpanded,
              timeago
                  .format(widget.notification.time, locale: context.locale.languageCode)
                  .text
                  .size(13)
                  .make(),
              width10,
            ],
          ),
          widget.notification.description.text
              .make()
              .pOnly(left: leftPadding + iconWidth)
        ],
      ),
    );
  }
}
