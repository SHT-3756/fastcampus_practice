import 'dart:math';

void main() {
  print('함수 선언');
  basic();

  String message = functionStudyReturnType();
  print(message);

  print(plus(3, 5));
}

void basic() {
  print('basic 함수 호출');
}

// 반환 타입 함수명(매개변수) { 실행문; }

int plus(int a, int b) {
  print('$a + $b = ${a + b}');
  return a + b;
}

String functionStudyReturnType() {
  print('type1');
  print('type2');
  return '완료';
}
