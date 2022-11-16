import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _index = 2;
  double _slider = 0;
  TextEditingController _text = TextEditingController();

  // int _index = 1;
  // double _sliderValue = 0;
  // TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('title')),
      body: Center(
        child: Column(
          children: [
            const Placeholder(),
            Slider(
              value: _slider,
              onChanged: (value) => setState(() {
                _slider = value;
              }),
            ),
            Text('slider : ${(_slider * 100).toStringAsFixed(0)}'),
            TextField(
              controller: _text,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: '숫자만 입력하세요.'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onSubmitted: (value) => setState(() {
                if (double.parse(value) > 100) {
                  _slider = 1;
                  _text.text = '100';
                }
                if (double.parse(value) <= 100) {
                  _slider = double.parse(value) * 0.01;
                }
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // 기본 default index 설정
          currentIndex: _index,
          onTap: (value) => setState(() {
                _index = value;
              }),
          // BottomNavigationBar 사용할 때는 제네릭 타입 꼭 선언해줘야한다. const <BottomNavigationBarItem>
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'star'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
          ]),
    );
  }
}
