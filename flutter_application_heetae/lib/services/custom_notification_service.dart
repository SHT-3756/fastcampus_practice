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
    // permissionNotification 의 return 값이 false 이면은 return false
    if (!await permissionNotification) {
      // sho native setting page
      // 알람 권한이 없으면 설정창으로 돌아가서 다시 추가해줘
      return false;
    }

    // 예외
    final now = tz.TZDateTime.now(tz.local);
    final alarmTime = DateFormat('HH:mm').parse(alarmTimeStr);

    // 조건 1 세팅알람 시(hour)가 현재 시(hour) 보다 적은 경우 또는
    // 조건 2 (세팅알람 시(hour)가 현재 시(hour)와 같은 경우 그리고 세팅알람 분(minute)이 현재 분(minute)와 같거나 작은 경우)
    // 결과 true -> 현재 일(day) + 1일
    // 결과 false -> 현재 일(day)
    final day = (alarmTime.hour < now.hour ||
            alarmTime.hour == now.hour && alarmTime.minute <= now.minute)
        ? now.day + 1
        : now.day;

    // id
    final alarmTimeId = alarmTimeStr.replaceAll(':', '');

    // add schedule notification
    final details = _notificationDetails(
      alarmTimeId, // unique
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
    // android 일때는 true 로 리턴
    if (Platform.isAndroid) {
      return true;
    }
    // ios 일때는 권한을 묻는다. 만약에 권한이 없을경우 false 로 리턴
    if (Platform.isIOS) {
      return await notification
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
    // android 와 ios 가 아닐경우 false 로 리턴
    return false;
  }
}
