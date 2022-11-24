import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_medicine_page.dart';

import 'components/add_page_widget.dart';

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
      appBar: AppBar(),
      body: AddPageBody(children: [
        Text(
          '매일 복약 잊지 말아요',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: largeSpace,
        ),
        Expanded(
            child: ListView(
          children: [AlarmBox(), AlarmBox(), AlarmBox(), AddAlarmButton()],
        ))
        // medicineImage == null ? Container() : Image.file(medicineImage!),
        // Text(medicineName),
      ]),
    );
  }
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.minus_circle)),
        ),
        Expanded(
          flex: 5,
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle2),
            onPressed: () {},
            child: Text('10:00'),
          ),
        ),
      ],
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // TextButton 에 내장되어있는 padding을 컨트롤하기 위함
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: () {},
      child: Row(
        children: const [
          Expanded(flex: 1, child: Icon(CupertinoIcons.plus_circle_fill)),
          Expanded(
            flex: 5,
            child: Center(child: Text('복용시간 추가')),
          ),
        ],
      ),
    );
  }
}
