import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';
import 'package:flutter_application_heetae/components/custom_page_route.dart';
import 'package:flutter_application_heetae/components/custom_widget.dart';
import 'package:flutter_application_heetae/pages/add_medicine/add_alarm_page.dart';
import 'package:image_picker/image_picker.dart';

import 'components/add_page_widget.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();

  File? _medicineImage;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: SingleChildScrollView(
        child: AddPageBody(
          children: [
            Text(
              '어떤 약인가요?',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: largeSpace,
            ),
            Center(
              child: MedicineImageButton(
                changeImageFile: (File? value) {
                  _medicineImage = value;
                },
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
              onChanged: (str) => setState(() {}),
            ),
          ],
        ),
      ),

      // SafeArea : ios x 이상만 영향이 간다. 이전 버전은 아무 변화 없다.
      bottomNavigationBar: BottomSubmitButton(
          onPressed: _nameController.text.isEmpty ? null : _onAddAlarmPage,
          text: '다음'),
    );
  }

  void _onAddAlarmPage() {
    Navigator.push(
        context,
        // 페이지 이름만 전달하면 되도록 클래스
        CustomFadePageRoute(
            page: AddAlarmPage(
                medicineName: _nameController.text,
                medicineImage: _medicineImage)));
  }
}

// 이미지 버튼 클래스
class MedicineImageButton extends StatefulWidget {
  const MedicineImageButton({super.key, required this.changeImageFile});

  // ValueChanged : value 값 변화하는지 알 수 있는 타입
  // state 클래스 안의 변수값 _pickedImage 을 값을 저장하기 위한 변수를 changeImageFile 선언
  final ValueChanged<File?> changeImageFile;

  @override
  State<MedicineImageButton> createState() => _MedicineImageButtonState();
}

class _MedicineImageButtonState extends State<MedicineImageButton> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // 사이즈
      radius: 40,
      child: CupertinoButton(
        padding: _pickedImage == null ? null : EdgeInsets.zero,
        onPressed: _showBottomSheet,
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
    );
  }

  // CupertinoButton 눌렀을때 실행되는 함수
  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return PickImageBottomSheet(
            onPressedCamera: (() => _onPressed(ImageSource.camera)),
            onPressedGallery: (() => _onPressed(ImageSource.gallery)),
          );
        });
  }

// onPressed 의 공통적인 함수 분리
  void _onPressed(ImageSource source) {
    ImagePicker().pickImage(source: source).then((xFile) {
      if (xFile != null) {
        //xFile 값 있으면 File 객체 사용해서 _pickedImage 변수에 저장
        setState(() {
          _pickedImage = File(xFile.path);
          widget.changeImageFile(_pickedImage);
        });
      }
      // xFile 이 없으면 pop 해줘라!
      Navigator.maybePop(context);
    }).onError((error, stackTrace) {
      // show setting
      Navigator.pop(context);
      showPermissionDenied(context, permissionMessage: '카메라 및 갤러리 접근');
    });
  }
}

// 뷰단에 보여지는 실질적인 바텀 시트
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
