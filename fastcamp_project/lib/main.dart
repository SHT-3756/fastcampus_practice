import 'package:fastcamp_project/pages/alignSpacerExpanded/align.dart';
import 'package:fastcamp_project/pages/alignSpacerExpanded/expanded.dart';
import 'package:fastcamp_project/pages/alignSpacerExpanded/spacer.dart';
import 'package:fastcamp_project/pages/buttonWidget/elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:fastcamp_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ElevatedButtonPage(),
    );
  }
}
