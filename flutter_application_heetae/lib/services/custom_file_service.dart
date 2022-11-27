import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> saveImageToLocalDirectory(File image) async {
  // 사용하는 저장공간에 해당하는 파일 시스템상의 위치 정보를 얻을 수 있게 하는 함수
  final documentDirectory = await getApplicationDocumentsDirectory();

  // 폴더 경로
  final folderPath = documentDirectory.path + '/medicine/images';

  // unique 한값으로 하기 위해 millisecondsSinceEpoch 사용
  final filePath = folderPath + '/${DateTime.now().millisecondsSinceEpoch}.png';

  await Directory(folderPath).create(recursive: true);

  // 새로운 파일 객체에 filePath 를 파라미터로 전달해 리턴된 값 변수에 저장
  final newFile = File(filePath);

  // writeAsBytesSync() -> 쓰기용 파일을 만들고 파일이 이미 있는경우 파일을 잘라낸다.
  // readAsBytesSync() -> 전체 파일 내용을 바이트 목록으로 동기식으로 읽는 함수, 작업 실패시 FileSystemException 발생
  newFile.writeAsBytesSync(image.readAsBytesSync());

  return filePath;
}
