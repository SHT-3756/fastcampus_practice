import 'package:flutter/material.dart';

class NaviGatorPage extends StatelessWidget {
  const NaviGatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        'hello',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
