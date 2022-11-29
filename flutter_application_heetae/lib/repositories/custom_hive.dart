import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomHive {
  Future<void> initializeHive() async {
    //   hive 초기화
    await Hive.initFlutter();

    Hive.registerAdapter<Medicine>(MedicineAdapter());

    await Hive.openBox<Medicine>(CustomHiveBox.medicine);
  }
}

class CustomHiveBox {
  static const medicine = 'medicine';
}
