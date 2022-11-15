import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  StatefulWidgetPage({super.key});

  @override
  State<StatefulWidgetPage> createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElevatedButton study'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            if (count > 9) {
                              return;
                            }
                            count++;
                          }),
                      child: const Text('Plus')),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () => setState(() {
                            if (count < 1) {
                              return;
                            }
                            count--;
                          }),
                      child: const Text('Minus')),
                ),
              ],
            ),
            Center(child: Text('$count')),
          ]),
    );
  }
}
