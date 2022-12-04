import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_heetae/components/custom_colors.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/components/custom_widget.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_medicine_page.dart';
import 'package:flutter_application_heetae/services/add_medicine_service.dart';
import 'package:flutter_application_heetae/services/custom_file_service.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../bottomsheet/time_setting_bottomsheet.dart';
import 'components/add_page_widget.dart';

// ignore: must_be_immutable
class AddAlarmPage extends StatelessWidget {
  // 이미지와 이름의 파라미터를 필수값으로 설정
  AddAlarmPage(
      {super.key,
      required this.medicineImage,
      required this.medicineName,
      required this.updateMedicineId}) {
    service = AddMedicineService(updateMedicineId);
  }

  // 이미지가 저장될 변수 선언
  // final 변할 값이 없으니
  final File? medicineImage;
  // 이름이 저장될 변수 선언
  final String medicineName;
  // 수정시 확인할 id 값
  final int updateMedicineId;
  // 중복 체크를 위해 Date 타입 보단 String 타입으로 설정
  // 멤버변수에는 변동되는 값을 넣어주지 못한다.
  late AddMedicineService service;

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
            //  상태값이 변화하는 것을 지켜보는 곳에다가 AnimateBuilder 를 감싸준다. (ChangeNotifier 을 위함)
            child: AnimatedBuilder(
          animation: service,
          builder: (context, _) {
            return ListView(
              children: alarmWidgets,
            );
          },
        ))
        // medicineImage == null ? Container() : Image.file(medicineImage!),
        // Text(medicineName),
      ]),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () async {
          final isUpdate = updateMedicineId != -1;
          isUpdate
              ? await _onUpdateMedicine(context)
              : await _onAddMedicine(context);
        },
        text: '완료',
      ),
    );
  }

  Future<void> _onUpdateMedicine(BuildContext context) async {
    bool result = false;
    // 1-1. 전 알람 삭제
    final alarmIds = _updateMedicine.alarms
        .map((alarmTime) => notification.alarmId(updateMedicineId, alarmTime));
    await notification.deleteMultipleAlarm(alarmIds);

    // 1-2. 알람 추가
    for (var alarm in service.alarms) {
      result = await notification.addNotification(
          medicineId: medicineRepository.newId,
          alarmTimeStr: alarm,
          title: '$alarm 약 먹을 시간이에요!',
          body: '$medicineName 복약했다고 알려주세요!');
    }

    if (!result) {
      return showPermissionDenied(context, permissionMessage: '알람');
    }

    String? imageFilePath = _updateMedicine.imagePath;

    // 내가 수정하려는 이미지 경로랑저장된 이미지 경로가같지 않을때만
    if (_updateMedicine.imagePath != medicineImage?.path) {
      // 2-1. 전 이미지 삭제
      if (_updateMedicine.imagePath != null) {
        deleteImage(_updateMedicine.imagePath!);
      }
      // 2-2. 이미지 저장 (로컬)
      if (medicineImage != null) {
        imageFilePath = await saveImageToLocalDirectory(medicineImage!);
      }
      //
    }

    // 3. medicine model 추가 (로컬, hive)
    final medicine = Medicine(
        id: _updateMedicine.id,
        name: medicineName,
        imagePath: imageFilePath,
        alarms: service.alarms.toList());
    medicineRepository.updateMedicine(
        key: _updateMedicine.key, medicine: medicine);

    // depth 가 많을 경우는 pop 여러번이 아닌 popUntil 을 사용해준다.
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  Future<void> _onAddMedicine(BuildContext context) async {
    bool result = false;

    // 1. 알람 추가
    for (var alarm in service.alarms) {
      result = await notification.addNotification(
          medicineId: medicineRepository.newId,
          alarmTimeStr: alarm,
          title: '$alarm 약 먹을 시간이에요!',
          body: '$medicineName 복약했다고 알려주세요!');
    }

    if (!result) {
      return showPermissionDenied(context, permissionMessage: '알람');
    }

    // 2. 이미지 저장 (로컬)
    String? imageFilePath;

    if (medicineImage != null) {
      imageFilePath = await saveImageToLocalDirectory(medicineImage!);
    }
    // 3. medicine model 추가 (로컬, hive)
    final medicine = Medicine(
        id: medicineRepository.newId,
        name: medicineName,
        imagePath: imageFilePath,
        alarms: service.alarms.toList());
    medicineRepository.addMedicine(medicine);

    // depth 가 많을 경우는 pop 여러번이 아닌 popUntil 을 사용해준다.
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  // getter
  Medicine get _updateMedicine => medicineRepository.medicineBox.values
      .singleWhere((medicine) => medicine.id == updateMedicineId);

  List<Widget> get alarmWidgets {
    final children = <Widget>[];

    children.addAll(service.alarms.map((alarmTime) => AlarmBox(
          time: alarmTime,
          service: service,
        )));
    children.add(AddAlarmButton(
      service: service,
    ));
    return children;
  }
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
    required this.time,
    required this.service,
  }) : super(key: key);

  final String time;
  final AddMedicineService service;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: () {
                service.removeAlarm(time);
              },
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
                  return TimeSettingBottomSheet(
                    initialTime: time,
                  );
                },
              ).then((value) {
                if (value == null || value is! DateTime) return;
                service.SetAlarm(prevTime: time, setTime: value);
              });
            },
            child: Text(time),
          ),
        ),
      ],
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({Key? key, required this.service}) : super(key: key);

  final AddMedicineService service;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // TextButton 에 내장되어있는 padding을 컨트롤하기 위함
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: service.addNowAlarm,
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
