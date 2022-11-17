import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:study_package/page/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  // 플러터 엔진과 상호작용을 위해서 선언
  WidgetsFlutterBinding.ensureInitialized();
  _initNotiSetting();
  runApp(const MyApp());
}
// flutter_local_notifications 패키지 안에 FlutterLocalNotificationsPlugin의 생성자가 필요하기 때문에,import 해주자!
// 그리고 외부에서 이 생성자를 접근 할 일이 있으니, _initNotiSetting() 안에 넣지 않았다.

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// private 으로 작성된 이유는 이 파일 내부에서만 접근할 것이기 때문
void _initNotiSetting() async {
  tz.initializeTimeZones();

// 'Asia/Seoul'
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

  tz.setLocalLocation(tz.getLocation(timeZoneName));

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // 메개변수를 보면 알듯이 6개의 매개변수가 defaultValue 가 true 이다. 변경하려면 이렇게 작성
  // 앱이 처음 구동 되면 Permission 을 체크하는데, 지금은 앱이 추가된 시점에 물어보겠다라는 의미로 false
  const initializationSettingsIOS = DarwinInitializationSettings(
    // 이 포그라운드에 있는 동안 알림이 트리거되면 경고를 나타내는 기본 설정이 표시
    requestAlertPermission: true,
    // 앱이 포그라운드에 있는 동안 알림이 트리거될 때 배지 값을 적용해야 하는지 여부
    requestBadgePermission: true,
    // 앱이 포그라운드에 있을 때 알림이 트리거될 때 소리를 재생해야 하는지 여부
    requestSoundPermission: true,
  );

  // ios, android 초기화 하는 함수들을 변수에 저장해두고  InitializationSettings 생성자에 보낸다.
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
