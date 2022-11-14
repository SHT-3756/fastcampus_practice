import 'package:flutter/material.dart';

class SpacerPage extends StatelessWidget {
  const SpacerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter'),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.yellow,
            height: 40,
            width: 40,
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            color: Colors.green,
            height: 40,
            width: 40,
          ),
          Container(
            color: Colors.blue,
            height: 40,
            width: 40,
          ),
          const Spacer(),
          Container(
            color: Colors.red,
            height: 40,
            width: 40,
          ),
          Container(
            color: Colors.purple,
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}
