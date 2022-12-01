import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_theme.dart';
import 'package:flutter_application_heetae/pages/home_page.dart';
import 'package:flutter_application_heetae/repositories/custom_hive.dart';
import 'package:flutter_application_heetae/repositories/medicine_history_repository.dart';
import 'package:flutter_application_heetae/repositories/medicine_repository.dart';
import 'package:flutter_application_heetae/services/custom_notification_service.dart';

final notification = CustomNotificationService();
final hive = CustomHive();
final medicineRepository = MedicineRepository();
final historyRepository = MedicineHistoryRepository();

void main() async {
  // 서버나 SharedPreferences 등 비동기데이터 작업 후 runApp 실행시 추가
  WidgetsFlutterBinding.ensureInitialized();

  // 초기화
  await notification.initializeNotification();
  await notification.initializeTimeZone();

  // hive 의 openBox 를 해주고 실행해야 에러가 안나기떄문에 비동기로 작성
  await hive.initializeHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
