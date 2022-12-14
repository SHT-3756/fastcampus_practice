import 'package:flutter/foundation.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:intl/intl.dart';

// setState 를 안쓰고, Service 에서 컨트롤 하면서, 앱에 상태가 변화하는 것을 바로 볼수 있게 with ChangeNorifier 추가
class AddMedicineService with ChangeNotifier {
  // 수정할때 필요한 생성자 추가
  AddMedicineService(int updateMedicineId) {
    final isUpdate = updateMedicineId != -1;

    if (isUpdate) {
      final updateAlarms = medicineRepository.medicineBox.values
          .singleWhere(
            (medicine) => medicine.id == updateMedicineId,
          )
          .alarms;

      _alarms.clear();
      _alarms.addAll(updateAlarms);
    }
  }
  final _alarms = <String>{
    '08:00',
    '13:00',
    '19:00',
  };

// 다른 곳에서 get 만 가능하게 getter 함수 선언
  Set<String> get alarms => _alarms;

  // 알람을 추가하는 함수
  void addNowAlarm() {
    final now = DateTime.now();
    final nowTime = DateFormat('HH:mm').format(now);

    _alarms.add(nowTime);

    // 상태값이 변화하는 것을 지켜본다.
    notifyListeners();
  }

  // 알람을 삭제하는 함수
  void removeAlarm(String alarmTime) {
    _alarms.remove(alarmTime);

    // 상태값이 변화하는 것을 지켜본다.
    notifyListeners();
  }

  // 알람 시간 설정하는 함수
  void SetAlarm({required String prevTime, required DateTime setTime}) {
    final setTimeStr = DateFormat('HH:mm').format(setTime);

    // 기존 값은 삭제
    _alarms.remove(prevTime);
    // 새로운 값은 추가
    _alarms.add(setTimeStr);

    // 상태값이 변화하는 것을 지켜본다.
    notifyListeners();
  }
}
