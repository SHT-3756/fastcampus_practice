import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Study'),
      ),
      body: Row(children: [
        Container(
          color: Colors.red,
          height: 40,
          width: 40,
        ),
        Container(
          color: Colors.yellow,
          height: 40,
          width: 40,
        ),
        Container(
          color: Colors.blue,
          height: 40,
          width: 40,
        ),
        Container(
          color: Colors.green,
          height: 40,
          width: 40,
        ),
        const Expanded(
            child: Text(
                '안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다. 안녕하세요 지금은 테스트 중입니다.')),
        Container(
          color: Colors.orange,
          height: 40,
          width: 40,
        ),
      ]),
    );
  }
}
