import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/models/medicine_alarm.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
