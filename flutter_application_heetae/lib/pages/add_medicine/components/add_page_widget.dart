import 'package:flutter/cupertino.dart';

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
