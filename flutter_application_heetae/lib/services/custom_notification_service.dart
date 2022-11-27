import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// FlutterLocalNotificationsPlugin 을 전역변수로 선언
final notification = FlutterLocalNotificationsPlugin();

class CustomNotificationService {
  // timezone
  Future<void> initializeTimeZone() async {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  // 초기화
  Future<void> initializeNotification() async {
    // android
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true, // 유저에게 알림창 표시 권한 요청
      requestBadgePermission: true, // 유저에게 알림 배지 권한 요청
      requestSoundPermission: true, // 유저에게 소리 재생 권한 요청
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notification.initialize(initializationSettings);
  }

  Future<bool> addNotification({
    required String alarmTimeStr,
    required String title, // HH:mm 약 먹을 시간이예요!
    required String body, // {약이름} 복약했다고 알려주세요!
  }) async {
    if (!await permissionNotification) {
      return false;
    }

    final now = tz.TZDateTime.now(tz.local);
    final alarmTime = DateFormat('HH:mm').parse(alarmTimeStr);

    final day = (alarmTime.hour < now.hour ||
            alarmTime.hour == now.hour && alarmTime.minute <= now.minute)
        ? now.day + 1
        : now.day;

    // id
    final alarmTimeId = alarmTimeStr.replaceAll(':', '');

    final details = _notificationDetails(
      alarmTimeId,
      title: title,
      body: body,
    );

    await notification.zonedSchedule(
      int.parse(alarmTimeId), // unique
      title,
      body,
      tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        day,
        alarmTime.hour,
        alarmTime.minute,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    return true;
  }

  NotificationDetails _notificationDetails(
    // unique
    String id, {
    required String title,
    required String body,
  }) {
    final android = AndroidNotificationDetails(
      id,
      title,
      channelDescription: body,
      importance: Importance.max,
      priority: Priority.max,
    );
    const ios = DarwinNotificationDetails();

    return NotificationDetails(
      android: android,
      iOS: ios,
    );
  }

  Future<bool> get permissionNotification async {
    if (Platform.isAndroid) {
      return true;
    }

    if (Platform.isIOS) {
      return await notification
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }

    return false;
  }
}
