import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/main.dart';
import 'package:flutter_application_heetae/models/medicine.dart';
import 'package:flutter_application_heetae/models/medicine_history.dart';
import 'package:flutter_application_heetae/pages/today/today_take_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '잘 복용했어요',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: regularSpace),
        const Divider(height: 1, thickness: 1.0),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: historyRepository.historyBox.listenable(),
                builder: _buildListView))
      ],
    );
  }

  Widget _buildListView(context, Box<MedicineHistory> historyBox, _) {
    final histories = historyBox.values.toList().reversed.toList();
    return ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          final history = histories[index];
          return _TimeTile(history: history);
        });
  }
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({
    Key? key,
    required this.history,
  }) : super(key: key);

  final MedicineHistory history;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            //'2022\n12.01.목
            DateFormat('yyyy\nMM.dd E', 'ko_KR').format(history.takeTime),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                height: 1.6,
                // font의 수직 정렬이 default 로 하단에 정렬되는데, 중앙에 정렬시키겠다.
                leadingDistribution: TextLeadingDistribution.even),
          ),
        ),
        Stack(
          alignment: const Alignment(0.0, -0.3),
          children: const [
            SizedBox(
              height: 130,
              child: VerticalDivider(
                width: 1,
                thickness: 1,
              ),
            ),
            CircleAvatar(
              radius: 4,
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
        Expanded(
            flex: 3,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Visibility if 문이랑 같다.
              Visibility(
                  visible: medicine.imagePath != null,
                  child: MedicineImageButton(imagePath: medicine.imagePath)),
              const SizedBox(
                width: smallSpace,
              ),
              Text(
                '${DateFormat('a hh:mm', 'ko').format(history.takeTime)}\n${medicine.name}',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    height: 1.6,
                    leadingDistribution: TextLeadingDistribution.even),
              ),
            ])),
      ],
    );
  }

  // medicine 객체를 리턴하는 getter
  Medicine get medicine {
    return medicineRepository.medicineBox.values.singleWhere(
        (element) =>
            element.id == history.medicineId &&
            element.key == history.medicineKey,
        orElse: () =>
            Medicine(id: -1, name: '삭제된 약입니다.', imagePath: null, alarms: []));
  }
}
