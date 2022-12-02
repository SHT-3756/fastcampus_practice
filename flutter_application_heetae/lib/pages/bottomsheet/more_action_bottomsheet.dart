import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_widget.dart';

class MoreActionBottomSheet extends StatelessWidget {
  const MoreActionBottomSheet(
      {super.key,
      this.onPressedModify,
      this.onPressedDeleteOnlyMedicine,
      this.onPressedDeleteAll});

  final VoidCallback? onPressedModify;
  final VoidCallback? onPressedDeleteOnlyMedicine;
  final VoidCallback? onPressedDeleteAll;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(
      children: [
        TextButton(onPressed: onPressedModify, child: const Text('약 정보 수정')),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: onPressedDeleteOnlyMedicine,
          child: const Text('약 정보 삭제'),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: onPressedDeleteAll,
          child: const Text('약 기록과 함께 약 정보 삭제'),
        ),
      ],
    );
  }
}
