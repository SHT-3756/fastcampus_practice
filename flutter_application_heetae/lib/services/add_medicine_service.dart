import 'package:intl/intl.dart';

class AddMedicineService {
  final _alarms = <String>{
    '08:00',
    '13:00',
    '19:00',
  };

// 다른 곳에서 get 만 가능하게 getter 함수 선언
  Set<String> get alarms => _alarms;

  void addNowAlarm() {
    final now = DateTime.now();
    final nowTime = DateFormat('HH:mm').format(now);

    _alarms.add(nowTime);
  }

  void removeAlarm(String alarmTime) {
    _alarms.remove(alarmTime);
  }
}
