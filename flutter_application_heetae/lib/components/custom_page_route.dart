import 'package:flutter/material.dart';

class CustomFadePageRoute extends PageRouteBuilder {
  final Widget page;

  CustomFadePageRoute({required this.page})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
