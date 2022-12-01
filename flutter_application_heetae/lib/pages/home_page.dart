import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_colors.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_medicine_page.dart';
import 'package:flutter_application_heetae/pages/history/history_page.dart';
import 'package:flutter_application_heetae/pages/today/today_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _pages = [
    const TodayPage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pagePadding,
        child: SafeArea(child: _pages[_currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onAddMedicine(context);
          },
          child: const Icon(CupertinoIcons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
        child: Container(
      height: kBottomNavigationBarHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoButton(
              child: Icon(
                CupertinoIcons.checkmark,
                color: _currentIndex == 0
                    ? CustomColors.primaryColor
                    : Colors.grey[400],
              ),
              onPressed: () => _onSelectPage(0)),
          CupertinoButton(
              child: Icon(
                CupertinoIcons.text_badge_checkmark,
                color: _currentIndex == 1
                    ? CustomColors.primaryColor
                    : Colors.grey[400],
              ),
              onPressed: () => _onSelectPage(1))
        ],
      ),
    ));
  }

  void _onSelectPage(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  void _onAddMedicine(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddMedicinePage(),
        ));
  }
}
