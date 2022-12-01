import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/components/custom_page_route.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:flutter_application_heetae/models/medicine_alarm.dart';
import 'package:flutter_application_heetae/models/medicine_history.dart';
import 'package:flutter_application_heetae/pages/bottomsheet/time_setting_bottomsheet.dart';
import 'package:flutter_application_heetae/pages/today/image_detail_page.dart';
import 'package:intl/intl.dart';

class BeforeTakeTitle extends StatelessWidget {
  const BeforeTakeTitle({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Row(
      children: [
        _MedicineImageButton(medicineAlarm: medicineAlarm),
        const SizedBox(
          width: smallSpace,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildTileBody(textStyle, context)),
        ),
        _MoreButton(medicineAlarm: medicineAlarm)
      ],
    );
  }

  List<Widget> _buildTileBody(TextStyle? textStyle, BuildContext context) {
    return [
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
            onTap: () {
              historyRepository.addHistory(MedicineHistory(
                  medicineId: medicineAlarm.id,
                  alarmTime: medicineAlarm.alarmsTime,
                  takeTime: DateTime.now()));
            },
            title: '지금',
          ),
          Text(
            '|',
            style: textStyle,
          ),
          TileActionButton(
            onTap: () => _onPreviousTake(context),
            title: '아까',
          ),
          Text(
            '먹었어요',
            style: textStyle,
          ),
        ],
      )
    ];
  }

  void _onPreviousTake(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          TimeSettingBottomSheet(initialTime: medicineAlarm.alarmsTime),
    ).then((takeDateTime) {
      if (takeDateTime == null || takeDateTime is! DateTime) {
        return;
      }

      historyRepository.addHistory(MedicineHistory(
          medicineId: medicineAlarm.id,
          alarmTime: medicineAlarm.alarmsTime,
          takeTime: takeDateTime));
    });
  }
}

class AfterTakeTitle extends StatelessWidget {
  const AfterTakeTitle({
    Key? key,
    required this.medicineAlarm,
    required this.history,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;
  final MedicineHistory history;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Row(
      children: [
        // 이미지를 겹겹이 쌓음
        Stack(
          children: [
            _MedicineImageButton(medicineAlarm: medicineAlarm),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green.withOpacity(0.5),
              child: const Icon(
                CupertinoIcons.check_mark,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: smallSpace,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildTileBody(textStyle, context)),
        ),
        _MoreButton(medicineAlarm: medicineAlarm)
      ],
    );
  }

  List<Widget> _buildTileBody(TextStyle? textStyle, BuildContext context) {
    return [
      // 조금더 bold 처리
      Text.rich(TextSpan(
          text: '✅ ${medicineAlarm.alarmsTime} → ',
          style: textStyle,
          children: [
            TextSpan(
                text: takeTimeStr,
                style: textStyle?.copyWith(fontWeight: FontWeight.w500))
          ])),
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
            onTap: () => _onTap(context),
            title: DateFormat('HH시 mm분에').format(history.takeTime),
          ),
          Text(
            '먹었어요',
            style: textStyle,
          ),
        ],
      )
    ];
  }

  String get takeTimeStr => DateFormat('HH:mm').format(history.takeTime);

  void _onTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => TimeSettingBottomSheet(initialTime: takeTimeStr),
    ).then((takeDateTime) {
      if (takeDateTime == null || takeDateTime is! DateTime) {
        return;
      }

      historyRepository.updateHistory(
          key: history.key,
          history: MedicineHistory(
              medicineId: medicineAlarm.id,
              alarmTime: medicineAlarm.alarmsTime,
              takeTime: takeDateTime));
    });
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          medicineRepository.deleteMedicine(medicineAlarm.key);
        },
        child: const Icon(CupertinoIcons.ellipsis_vertical));
  }
}

class _MedicineImageButton extends StatelessWidget {
  const _MedicineImageButton({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: medicineAlarm.imagePath == null
          ? null
          : () {
              Navigator.push(
                  context,
                  CustomFadePageRoute(
                      page: ImageDetailPage(medicineAlarm: medicineAlarm)));
            },
      child: CircleAvatar(
        radius: 40,
        foregroundImage: medicineAlarm.imagePath == null
            ? null
            : FileImage(File(medicineAlarm.imagePath!)),
      ),
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
