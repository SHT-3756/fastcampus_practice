import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // X 버튼
        leading: const CloseButton(),
      ),
      body: GestureDetector(
        onTap: () {
          // 포커싱 해제
          FocusScope.of(context).unfocus();
        },
        child: Column(
          // 반대축 정렬 start
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '어떤 약인가요?',
              style: Theme.of(context).textTheme.headline4,
            ),
            Center(
              child: CircleAvatar(
                // 사이즈
                radius: 40,
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.photo_camera_solid,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              '약 이름',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(),
          ],
        ),
      ),
      bottomNavigationBar:
          // ios x 이상만 영향이 간다. 이전 버전은 아무 변화 없다.
          SafeArea(
              child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.subtitle1),
        child: Text('다음'),
      )),
    );
  }
}
