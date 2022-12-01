import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/custom_colors.dart';
import '../../components/custom_constant.dart';
import '../../components/custom_widget.dart';

class TimeSettingBottomSheet extends StatelessWidget {
  const TimeSettingBottomSheet(
      {Key? key,
      required this.initialTime,
      this.submitTitle = '선택',
      this.bottomWidget})
      : super(key: key);

  final String initialTime;
  final String submitTitle;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    final initialTimeData = DateFormat('HH:mm').parse(initialTime);
    final now = DateTime.now();
    final initialDateTime = DateTime(now.year, now.month, now.day,
        initialTimeData.hour, initialTimeData.minute);
    DateTime setDateTime = initialDateTime;

    return BottomSheetBody(children: [
      SizedBox(
          // CupertinoDatePicker 함수 사용시, 사이즈를 선언 안해주면 에러가 난다.
          height: 200,
          child: CupertinoDatePicker(
            onDateTimeChanged: (dateTime) {
              setDateTime = dateTime;
            },
            // 시간만 뜨게 적용
            mode: CupertinoDatePickerMode.time,
            initialDateTime: initialDateTime,
          )),
      const SizedBox(width: smallSpace),
      if (bottomWidget != null) bottomWidget!,
      const SizedBox(width: smallSpace),
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
                    onPressed: () => Navigator.pop(context),
                    child: const Text('취소'))),
          ),
          const SizedBox(width: smallSpace),
          Expanded(
            child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.subtitle1),
                    onPressed: () {
                      Navigator.pop(context, setDateTime);
                    },
                    child: Text(submitTitle))),
          ),
        ],
      )
    ]);
  }
}
