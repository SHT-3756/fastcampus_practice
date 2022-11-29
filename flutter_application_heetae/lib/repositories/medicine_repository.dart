import 'dart:developer';

import 'package:flutter_application_heetae/repositories/custom_hive.dart';
import 'package:hive/hive.dart';

import 'package:flutter_application_heetae/models/medicine.dart';

class MedicineRepository {
  // Medicine 타입의 멤버변수 생성
  Box<Medicine>? _medicineBox;

  // getter 함수
  Box<Medicine> get medicineBox {
    // if(_medicineBox == null) 이면 처리해준다.
    _medicineBox ??= Hive.box<Medicine>(CustomHiveBox.medicine);
    return _medicineBox!;
  }

  void addMedicine(Medicine medicine) async {
    int key = await medicineBox.add(medicine);

    log('[addMedicine] add (key:$key) $medicine');
    log('result ${medicineBox.values.toList()}');
  }

  void deleteMedicine(int key) async {
    await medicineBox.delete(key);

    log('[addMedicine] delete (key:$key)');
    log('result ${medicineBox.values.toList()}');
  }

  void updateMedicine({
    required int key,
    required Medicine medicine,
  }) async {
    await medicineBox.put(key, medicine);

    log('[addMedicine] update (key:$key) $medicine');
  }

  int get newId {
    final lastId = medicineBox.values.isEmpty ? 0 : medicineBox.values.last.id;
    return lastId + 1;
  }
}
