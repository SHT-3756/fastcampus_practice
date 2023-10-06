import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';
import 'package:ttoss_app/common/cli_common.dart';
import 'package:ttoss_app/common/util/async/flutter_async.dart';
import 'package:ttoss_app/screen/main/s_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    delay(() {
      Nav.clearAllAndPush(const MainScreen());
    }, 1500.ms);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/image/splash/splash.png",
        width: 192,
        height: 192,
      ),
    );
  }
}
