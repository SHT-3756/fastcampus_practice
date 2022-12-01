import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:flutter_application_heetae/models/medicine_history.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomHive {
  Future<void> initializeHive() async {
    //   hive 초기화
    await Hive.initFlutter();

    Hive.registerAdapter<Medicine>(MedicineAdapter());
    Hive.registerAdapter<MedicineHistory>(MedicineHistoryAdapter());

    await Hive.openBox<Medicine>(CustomHiveBox.medicine);
    await Hive.openBox<MedicineHistory>(CustomHiveBox.medicineHistory);
  }
}

class CustomHiveBox {
  static const medicine = 'medicine';
  static const medicineHistory = 'medicine_history';
}
