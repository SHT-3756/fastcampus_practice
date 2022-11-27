import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_theme.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_medicine_page.dart';
import 'package:flutter_application_heetae/pages/home_page.dart';
import 'package:flutter_application_heetae/services/custom_notification_service.dart';

void main() {
  // 서버나 SharedPreferences 등 비동기데이터 작업 후 runApp 실행시 추가
  WidgetsFlutterBinding.ensureInitialized();

  final notification = CustomNotificationService();
  // 초기화
  notification.initializeNotification();
  notification.initializeTimeZone();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const AddMedicinePage(),
    );
  }
}
