import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:study_package/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // 눌렀을때 함수 호출
                  // _showToast();
                  EasyLoading.showSuccess('Great Success!');
                  EasyLoading.addStatusCallback((status) {
                    print('EasyLoading Status $status');
                  });

                  EasyLoading.removeAllCallbacks();
                },
                child: const Text('btn')),
            ElevatedButton(
                onPressed: () async {
                  // flutterLocalNotificationsPlugin 객체를 불러온다.
                  final notification = flutterLocalNotificationsPlugin;
                  // android AndroidNotificationDetails 객체 생성
                  const android = AndroidNotificationDetails(
                    '0',
                    'android 알림 제목',
                    channelDescription: 'android 알림 바디',
                    importance: Importance.max,
                    priority: Priority.max,
                  );
                  // ios DarwinNotificationDetails 객체 생성
                  const ios = DarwinNotificationDetails();

                  const detail = NotificationDetails(
                    android: android,
                    iOS: ios,
                  );

                  // 비동기로 작성한 이유는, requestPErmissions 의 결과값이 중요하기 때문
                  // 안드로이드일때는 무조건 true 이고, ios 일때는 requestPermission 결과를 가져와야함
                  // requestPermissions 가 nullable 한값이기 때문에 만약에 null 로 오면 false 로 값받는다.
                  final permission = Platform.isAndroid
                      ? true
                      : await notification
                              .resolvePlatformSpecificImplementation<
                                  IOSFlutterLocalNotificationsPlugin>()
                              ?.requestPermissions(
                                  alert: true, badge: true, sound: true) ??
                          false;
                  if (!permission) {
                    // 만약 permission 이 false 라면 알람을 띄워줄 수 없으니, 조건문 작성
                    // await showNotiPermissionDialog(context);
                    // return toast 권한이 없습니다.
                    return;
                  }
                  await flutterLocalNotificationsPlugin.show(
                      0, 'ios 알림 제목', 'ios 알림 내용', detail);
                },
                child: const Text('알림 버튼')),
            const Center(
              child: Text('hi'),
            )
          ]),
    );
  }

  void _showToast() {
    // 위젯을 toast 라는 변수에 담은것.
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      // 박스 데코레이션, 박스 테두리 둥글게, 색 조정
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          // 아이콘
          Icon(Icons.check),
          // 여백을 위한 SizedBox
          SizedBox(
            width: 12.0,
          ),
          // 글자
          Text("This is a Custom Toast"),
        ],
      ),
    );

    // 호출 방법 1
    fToast.showToast(
      // child 가 받는 반환타입 은 위젯(Type: widget)
      child: toast,
      // 어느 위치에 출력할 것인지
      gravity: ToastGravity.BOTTOM,
      // 토스트 메세지를 얼마나 표시할 것인지
      toastDuration: const Duration(seconds: 2),
    );

    // 호출 방법 2
    // 포지션 커스텀 : 포지션을 정해서 child 담긴 toast 를 그린 것이다.
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 10),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }
}
