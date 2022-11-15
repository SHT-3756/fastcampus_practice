import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const _ImageHomePage(),
    );
  }
}

class _ImageHomePage extends StatelessWidget {
  const _ImageHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://www.galvanizeaction.org/wp-content/uploads/2022/06/Wow-gif.gif',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/image/panda.jpeg',
              width: 500,
              height: 500,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/image/120430f.gif',
              width: 200,
              height: 300,
              fit: BoxFit.none,
            ),
          ],
        ),
      ),
    );
  }
}
