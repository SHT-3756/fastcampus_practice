import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter My App Bar'),
      ),
      body: Align(
        alignment: const Alignment(0, 0),
        child: Container(
          color: Colors.green,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
