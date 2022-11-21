import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
        child: Padding(
          padding: pagePadding,
          child: Column(
            // 반대축 정렬 start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '어떤 약인가요?',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: largeSpace,
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
              const SizedBox(
                height: largeSpace + regularSpace,
              ),
              Text(
                '약 이름',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextFormField(
                controller: _nameController,
                maxLength: 20,
                // 키패트 타입
                keyboardType: TextInputType.text,
                // 키패드의 submit 버튼
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.bodyText1,
                // 글자를 입력할때 스타일
                decoration: InputDecoration(
                  hintText: '복용할 막 이름을 기입 해주세요.',
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  // 가로 여백 6만큼 적용
                  contentPadding: textFieldContentPadding,
                ),
              ),
            ],
          ),
        ),
      ),
      // SafeArea : ios x 이상만 영향이 간다. 이전 버전은 아무 변화 없다.
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: submitButtonBoxPadding,
        child: SizedBox(
          height: submitButtonHeight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle1),
            child: Text('다음'),
          ),
        ),
      )),
    );
  }
}
