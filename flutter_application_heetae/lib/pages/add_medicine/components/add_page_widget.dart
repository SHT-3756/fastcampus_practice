import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_constant.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 포커싱 해제
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: pagePadding,
        child: Column(
            // 반대축 정렬 start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ),
    );
  }
}

// 바텀전송버튼 클래스
class BottomSubmitButton extends StatelessWidget {
  const BottomSubmitButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: submitButtonBoxPadding,
      child: SizedBox(
        height: submitButtonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.subtitle1),
          child: Text(text),
        ),
      ),
    ));
  }
}
