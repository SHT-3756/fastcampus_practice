import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_heetae/components/custom_colors.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/components/custom_widget.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_medicine_page.dart';
import 'package:intl/intl.dart';

import 'components/add_page_widget.dart';

class AddAlarmPage extends StatefulWidget {
  // 이미지와 이름의 파라미터를 필수값으로 설정
  AddAlarmPage({super.key, this.medicineImage, required this.medicineName});

  // 이미지가 저장될 변수 선언
  // final 변할 값이 없으니
  final File? medicineImage;
  // 이름이 저장될 변수 선언
  final String medicineName;

  @override
  State<AddAlarmPage> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  // 중복 체크를 위해 Date 타입 보단 String 타입으로 설정
  final _alarms = <String>{
    '08:00',
    '13:00',
    '19:00',
  };

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
          children: alarmWidgets
          // [AlarmBox(), AlarmBox(), AlarmBox(), AddAlarmButton()]
          ,
        ))
        // medicineImage == null ? Container() : Image.file(medicineImage!),
        // Text(medicineName),
      ]),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () {},
        text: '완료',
      ),
    );
  }

  List<Widget> get alarmWidgets {
    final children = <Widget>[];

    children.addAll(_alarms.map((alarmTime) => AlarmBox(
          time: alarmTime,
          onPressedMinus: () {
            setState(() {
              _alarms.remove(alarmTime);
            });
          },
        )));
    children.add(AddAlarmButton(
      onPressedPlus: () {
        final now = DateTime.now();
        final nowTime = DateFormat('HH:mm').format(now);
        setState(() {
          _alarms.add(nowTime);
        });
      },
    ));
    return children;
  }
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
    required this.time,
    required this.onPressedMinus,
  }) : super(key: key);

  final String time;
  final VoidCallback onPressedMinus;

  @override
  Widget build(BuildContext context) {
    final initTime = DateFormat('HH:mm').parse(time);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: onPressedMinus,
              icon: const Icon(CupertinoIcons.minus_circle)),
        ),
        Expanded(
          flex: 5,
          child: TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle2),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TimePickerBottomSheet(
                    initialDateTime: initTime,
                  );
                },
              );
            },
            child: Text(time),
          ),
        ),
      ],
    );
  }
}

class TimePickerBottomSheet extends StatelessWidget {
  const TimePickerBottomSheet({
    Key? key,
    required this.initialDateTime,
  }) : super(key: key);

  final DateTime initialDateTime;
  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(children: [
      SizedBox(
          // CupertinoDatePicker 함수 사용시, 사이즈를 선언 안해주면 에러가 난다.
          height: 200,
          child: CupertinoDatePicker(
            onDateTimeChanged: (dateTime) {},
            // 시간만 뜨게 적용
            mode: CupertinoDatePickerMode.time,
            initialDateTime: initialDateTime,
          )),
      const SizedBox(width: regularSpace),
      Row(
        children: [
          Expanded(
            child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.subtitle1,
                        foregroundColor: CustomColors.primaryColor,
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('취소'))),
          ),
          const SizedBox(width: smallSpace),
          Expanded(
            child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.subtitle1),
                    onPressed: () {},
                    child: const Text('선택'))),
          ),
        ],
      )
    ]);
  }
}

class AddAlarmButton extends StatelessWidget {
  AddAlarmButton({Key? key, required this.onPressedPlus}) : super(key: key);

  VoidCallback onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // TextButton 에 내장되어있는 padding을 컨트롤하기 위함
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: onPressedPlus,
      child: Row(
        children: const [
          Expanded(flex: 1, child: Icon(CupertinoIcons.plus_circle_fill)),
          Expanded(
            flex: 5,
            child: Center(child: Text('복용시간 추가12312')),
          ),
        ],
      ),
    );
  }
}
