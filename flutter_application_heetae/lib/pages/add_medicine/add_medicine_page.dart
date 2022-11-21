import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:image_picker/image_picker.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();

  File? _pickedImage;

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
                    padding: _pickedImage == null ? null : EdgeInsets.zero,
                    onPressed: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((xFile) {
                        // xFile 값 null 이면 return
                        if (xFile == null) return;
                        //xFile 값 있으면 File 객체 사용해서 _pickedImage 변수에 저장
                        setState(() {
                          _pickedImage = File(xFile.path);
                        });
                      });
                    },
                    child: _pickedImage == null
                        ? const Icon(
                            CupertinoIcons.photo_camera_solid,
                            size: 30,
                            color: Colors.white,
                          )
                        : CircleAvatar(
                            // nullCheck ! 를 해주어 무조건 들어온다 라는 것을 의미
                            foregroundImage: FileImage(_pickedImage!),
                            radius: 40,
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
