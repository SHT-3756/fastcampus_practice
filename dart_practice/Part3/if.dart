void main() {
// 조건문
  int number = 49;

  if (number % 4 == 0) {
    print('$number값은 4의 배수입니다.');
  } else {
    print('나머지 값은 ${number % 4}');
    print('$number값은 4의 배수가 아닙니다.');
  }

  // else if 문
  if (number % 4 == 0) {
    print('$number 는 4의 배수입니다.');
  } else if (number % 5 == 0) {
    print('$number 는 5의 배수입니다.');
  } else if (number % 6 == 0) {
    print('$number 는 6의 배수입니다.');
  } else {
    print('$number 는 4, 5, 6 의 배수가 아닙니다!');
  }

  // switch문
  int tempNumber = 5;
  switch (tempNumber) {
    case 1:
      print('1 이다.');
      break;
    case 2:
      print('2 이다.');
      break;
    default:
      print('1,2 가 아니다.');
  }
}
