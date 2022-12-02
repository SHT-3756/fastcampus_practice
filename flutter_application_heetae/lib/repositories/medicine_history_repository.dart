import 'dart:developer';

import 'package:flutter_application_heetae/models/medicine_history.dart';
import 'package:flutter_application_heetae/repositories/custom_hive.dart';
import 'package:hive/hive.dart';

class MedicineHistoryRepository {
  // Medicine 타입의 멤버변수 생성
  Box<MedicineHistory>? _historyBox;

  // getter 함수
  Box<MedicineHistory> get historyBox {
    // if(_historyBox == null) 이면 처리해준다.
    _historyBox ??= Hive.box<MedicineHistory>(CustomHiveBox.medicineHistory);
    return _historyBox!;
  }

  void addHistory(MedicineHistory history) async {
    int key = await historyBox.add(history);

    log('[addHistoryMedicine] add (key:$key) $history');
    log('result ${historyBox.values.toList()}');
  }

  void deleteHistory(int key) async {
    await historyBox.delete(key);

    log('[deleteHistory] delete (key:$key)');
    log('result ${historyBox.values.toList()}');
  }

  void updateHistory({
    required int key,
    required MedicineHistory history,
  }) async {
    await historyBox.put(key, history);

    log('[updateHistory] update (key:$key) $history');
  }

  void deleteAllHistory(Iterable<int> keys) async {
    await historyBox.deleteAll(keys);

    log('[deleteHistory] delete (key:$keys)');
    log('result ${historyBox.values.toList()}');
  }
}
