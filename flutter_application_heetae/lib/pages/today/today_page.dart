import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:flutter_application_heetae/models/medicine_alarm.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘 약 복용할 약은?',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: regularSpace),
        const Divider(
          // 구분선
          height: 1,
          thickness: 2.0,
        ),
        Expanded(
            // ListView.builder() : list 기반으로 view 가 그려진다.
            // ListView.separated(separatorBuilder) : itemBuilder 사이사이마다 separatorBuilder 의 위젯을 추가
            child: ValueListenableBuilder(
                valueListenable: medicineRepository.medicineBox.listenable(),
                builder: _builderMEdicineListView)),
        const Divider(
          // 구분선
          height: 1,
          thickness: 2.0,
        ),
      ],
    );
  }

  Widget _builderMEdicineListView(context, Box<Medicine> box, _) {
    final medicines = box.values.toList();
    final medicineAlarms = <MedicineAlarm>[];

    for (var medicine in medicines) {
      for (var alarm in medicine.alarms) {
        medicineAlarms.add(MedicineAlarm(medicine.id, medicine.name,
            medicine.imagePath, alarm, medicine.key));
      }
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: smallSpace),
      itemCount: medicineAlarms.length,
      itemBuilder: (context, index) {
        return MedicineListTitle(
          medicineAlarm: medicineAlarms[index],
        );
      },
      // itemBuilder 사이 구분 하기 위한 위젯(여백을 넣어서 구분하게 만들었다.)
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: regularSpace,
        );
      },
    );
  }
}

class MedicineListTitle extends StatelessWidget {
  const MedicineListTitle({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: CircleAvatar(
            radius: 40,
            foregroundImage: medicineAlarm.imagePath == null
                ? null
                : FileImage(File(medicineAlarm.imagePath!)),
          ),
        ),
        const SizedBox(
          width: smallSpace,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '🕐${medicineAlarm.alarmsTime}',
              style: textStyle,
            ),
            const SizedBox(
              height: 6,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(
                  medicineAlarm.name,
                  style: textStyle,
                ),
                TileActionButton(
                  onTap: () {},
                  title: '지금',
                ),
                Text(
                  '|',
                  style: textStyle,
                ),
                TileActionButton(
                  onTap: () {},
                  title: '아까',
                ),
                Text(
                  '먹었어요',
                  style: textStyle,
                ),
              ],
            )
          ]),
        ),
        CupertinoButton(
            onPressed: () {
              medicineRepository.deleteMedicine(medicineAlarm.key);
            },
            child: const Icon(CupertinoIcons.ellipsis_vertical))
      ],
    );
  }
}

class TileActionButton extends StatelessWidget {
  const TileActionButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w500);
    return GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: buttonTextStyle,
        ));
  }
}
