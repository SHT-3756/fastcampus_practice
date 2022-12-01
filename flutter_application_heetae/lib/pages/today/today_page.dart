import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/components/custom_page_route.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:flutter_application_heetae/models/medicine_alarm.dart';
import 'package:flutter_application_heetae/models/medicine_history.dart';
import 'package:flutter_application_heetae/pages/bottomsheet/time_setting_bottomsheet.dart';
import 'package:flutter_application_heetae/pages/today/empty_widget.dart';
import 'package:flutter_application_heetae/pages/today/today_take_title.dart';
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
        Expanded(
            // ListView.builder() : list 기반으로 view 가 그려진다.
            // ListView.separated(separatorBuilder) : itemBuilder 사이사이마다 separatorBuilder 의 위젯을 추가
            child: ValueListenableBuilder(
                valueListenable: medicineRepository.medicineBox.listenable(),
                builder: _builderMEdicineListView)),
      ],
    );
  }

  Widget _builderMEdicineListView(context, Box<Medicine> box, _) {
    final medicines = box.values.toList();
    final medicineAlarms = <MedicineAlarm>[];

    if (medicines.isEmpty) {
      return const TodayEmpty();
    }

    for (var medicine in medicines) {
      for (var alarm in medicine.alarms) {
        medicineAlarms.add(MedicineAlarm(medicine.id, medicine.name,
            medicine.imagePath, alarm, medicine.key));
      }
    }

    return Column(children: [
      const Divider(
        // 구분선
        height: 1,
        thickness: 1.0,
      ),
      Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: smallSpace),
          itemCount: medicineAlarms.length,
          itemBuilder: (context, index) {
            return AfterTakeTitle(
              medicineAlarm: medicineAlarms[index],
            );
          },
          // itemBuilder 사이 구분 하기 위한 위젯(여백을 넣어서 구분하게 만들었다.)
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: regularSpace,
            );
          },
        ),
      ),
      const Divider(
        // 구분선
        height: 1,
        thickness: 1.0,
      ),
    ]);
  }
}
