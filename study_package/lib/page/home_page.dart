import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                  _showToast();
                },
                child: const Text('btn')),
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
