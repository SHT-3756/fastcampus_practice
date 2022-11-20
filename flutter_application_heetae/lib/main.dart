import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_theme.dart';
import 'package:flutter_application_heetae/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
