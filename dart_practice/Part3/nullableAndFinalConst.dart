void main() {
  // var = 타입 추론가능한 타입
  // 타입 추론이 아닌 타입을 명시하는 걸 권장
  String name = 'Kim';
  int age = 28;
  int year = 1995;
  double height = 174.9;

  List<String> animals = [
    'dog',
    'cat',
    'fox',
  ];

  Map<String, dynamic> image = {
    'tags': ['saturn'],
    'url': 'https://www.naver.com'
  };
}

void main2() {
  // dynamic : 여러 타입을 받을 수 있는 변수 타입
  dynamic temp1 = 'Park';
  temp1 = 3;
  print(temp1); // 3
  temp1 = 3.2;
  print(temp1); // 3.2
  temp1 = true;
  print(temp1); // true
}

void main3() {
  // non-nullable: null 값 허용되지 않음
  String nonNullableName = '';
  print(nonNullableName); // ''

  // nullable: null 값 허용
  // 작성하는 방법
  // 변수타입?
  String? name = ''; // 빈값
  print(name); //

  name = 'Kim';
  print(name); // Kim

  name = null; // 널값 Null 값
  print(name); // null
}

void main4() {
  // final 상수 : 변하지 않는 데이터(run-time 때 값 할당)
  // const 상수 : 변하지 않는 데이터(compile-time 때 값 할당)
  final String name = 'Kim';
  print(name); // Kim

  final DateTime now1 = DateTime.now();
  print(now1); // 2022-11-10 16:05.288199

  Future.delayed(Duration(seconds: 1), () {
    final DateTime now2 = DateTime.now();
    print(now1); // 2022-11-10 16:05.288199
    print(now2); // 2022-11-10 16:06.288199
  });
}
