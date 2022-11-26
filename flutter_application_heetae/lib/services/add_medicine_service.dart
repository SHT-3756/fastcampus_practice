import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

// setState 를 안쓰고, Service 에서 컨트롤 하면서, 앱에 상태가 변화하는 것을 바로 볼수 있게 with ChangeNorifier 추가
class AddMedicineService with ChangeNotifier {
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
}
