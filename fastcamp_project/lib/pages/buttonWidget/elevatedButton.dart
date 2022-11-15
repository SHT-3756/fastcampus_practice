import 'package:flutter/material.dart';

class ElevatedButtonPage extends StatelessWidget {
  const ElevatedButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElevatedButton study'),
      ),
      body: Column(children: [
        // ElevatedButton, OutlinedButton, TextButton 는 생성자가 똑같다!
        ElevatedButton(
            onPressed: null,
            onLongPress: () => print('onLongPress_ElevatedButton'),
            child: const Text('ElevatedButton')),
        Row(
          children: [
            ElevatedButton(
                onPressed: () => print('onPressed_ElevatedButton'),
                // child 안에 TextStyle 스타일 지정하는 것은 권장하지 않고, styleForm() 태그로 적용하길 권장
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey),
                // primary -> foregroundColor 변경, onPrimary -> backgroundColor 변경
                child: const Text('ElevatedButton_grey')),
            // 비활성화 버튼
            // onSurface -> disabledForegroundColor 로 변경
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.red.withOpacity(0.38),
                  disabledBackgroundColor: Colors.red.withOpacity(0.12)),
              child: const Text('ElevatedButton_비활성화'),
            ),
          ],
        ),

        Row(
          children: [
            OutlinedButton(
                onPressed: () => print('press_OutlinedButton'),
                onLongPress: () => print('long_press_OutlinedButton'),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.yellow,
                    backgroundColor: Colors.green,
                    side: const BorderSide(color: Colors.black)),
                child: const Text('OutlinedButton')),
            OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  // withOpacity() 로 불투명도 조정
                  disabledForegroundColor: Colors.blue.withOpacity(0.38),
                ),
                child: const Text('OutlinedButton2')),
          ],
        ),
        Row(
          children: [
            TextButton(
                onPressed: () => print('onPressed_TextButton'),
                onLongPress: () => print('onLongPress_TextButton'),
                style: TextButton.styleFrom(foregroundColor: Colors.green),
                child: const Text('TextButton')),
            TextButton(
                onPressed: () => print('onPressed_TextButton'),
                onLongPress: () => print('onLongPress_TextButton'),
                style: TextButton.styleFrom(foregroundColor: Colors.green),
                child: const Text('TextButton')),
          ],
        ),
        GestureDetector(
            onTap: () => print('onTap_GestureDetector'),
            onDoubleTap: () => print('onDoubleTap_onTap_GestureDetector'),
            onTapDown: (details) => print(
                '${details.globalPosition} | ${details.kind} | ${details.localPosition}'),
            child: const Text('GestureDetector')),
        GestureDetector(
            onTap: () => print('onTap_GestureDetector'),
            onDoubleTap: () => print('onDoubleTap_onTap_GestureDetector'),
            child: Container(
              color: Colors.yellow,
              height: 100,
            )),
      ]),
    );
  }
}
