void main() {
// 변수
  // 1. 선언법
  // 변수타입 변수명 = 값;
  var name = 'Hera'; // 문자인 값
  var year = 1977; // 정수값
  var grade = 3.7; // 실수값
  var animals = ['fox', 'dog', 'cat']; // 문자열이 담긴 list 값
  var Image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  }; // Map 값
}

void main2() {
  // 2. 변수 타입
  // 문자열 값 = String
  String name = 'Panda';
  String nickname = 'hehe';

  print('name: $name');
  print('nickname: $nickname');
}

void main3() {
  // 2. 변수타입
  // 숫자값 = 정수(int), 실수(double, 소수점 0)

  int num1 = 12;
  int num2 = 5;
  print(num1 + num2); // 17
  print(num1 - num2); // 7
  print(num1 * num2); // 60
  print(num1 / num2); // 2.4
  print(num1 % num2); // 2

  int age = 28;
  double width = 30; // 30.0
  double height = 174.9;

  // 값 변경
  // 변수명 = 변경될 값;
  age = age + 1;
  print(age); // 29

  // double 에는 int 값을 담지 못한다!!!
  height = height + 1; // 174.9 + 1 = X

  width = width + 3.5;
  print(width); // 33.5
}

void main4() {
  // 변수 타입
  // boolean 값 = bool;
  bool isShow = false;
  print('isShow = $isShow'); // isShow = false

  bool isTrue = 4 > 10;
  print('isTrue = 4 > 10 = $isTrue'); // isTrue = 4 > 10 = false

  bool isTrue2 = (5 == 10);
  print('isTrue2 = 5 == 10 => $isTrue2'); // isTrue2 5 == 10 => false

  isTrue2 = (1 == 1);
  print('isTrue2 = 1 == 1 => $isTrue2'); // isTrue2 = 1 == 1 => true

  isTrue2 = (2 == 2.0);
  print('isTrue2 = 2 == 2.0 => $isTrue2'); // isTrue2 = 2 == 2.0 => true

  isTrue2 = (2 == 2.0);
  print('isTrue2 = 2 == 2.0 => $isTrue2'); // isTrue2 = 2 == 2.0 => true

  isTrue2 = ((2 == 2.0) && (4 == 4.2));
  print(
      'isTrue2 = (2 == 2.0) && (4 == 4.2) => $isTrue2'); // isTrue2 = (2 == 2.0) && (4 == 4.2) => false

  isTrue2 = ((2 == 2.0) || (4 == 4.2));
  print(
      'isTrue2 = (2 == 2.0) || (4 == 4.2) => $isTrue2'); // isTrue2 = (2 == 2.0) || (4 == 4.2) => true
}
