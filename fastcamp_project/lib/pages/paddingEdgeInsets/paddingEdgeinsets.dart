import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        // alignment: Alignment.topCenter,
        alignment: const Alignment(0, -1),
        // height: 110.0,
        // width: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        // margin: const EdgeInsets.all(100),
        // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: const Text('center'),
      ),
    );
  }
}
