import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_widget.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet(
      {super.key, this.onPressedCamera, this.onPressedGallery});

  final VoidCallback? onPressedCamera;
  final VoidCallback? onPressedGallery;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(
      children: [
        TextButton(onPressed: onPressedCamera, child: const Text('카메라 열기')),
        TextButton(onPressed: onPressedGallery, child: const Text('갤러리 열기')),
      ],
    );
  }
}
