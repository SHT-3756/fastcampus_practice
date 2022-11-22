import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddAlarmPage extends StatelessWidget {
  // 이미지와 이름의 파라미터를 필수값으로 설정
  const AddAlarmPage(
      {super.key, this.medicineImage, required this.medicineName});

  // 이미지가 저장될 변수 선언
  // final 변할 값이 없으니
  final File? medicineImage;
  // 이름이 저장될 변수 선언
  final String medicineName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        medicineImage == null ? Container() : Image.file(medicineImage!),
        Text(medicineName),
      ]),
    );
  }
}
