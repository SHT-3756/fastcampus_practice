void main() {
  print('class 공부');
  // instance 인스턴스 : object (객체) 생성
  Student girlStudent = Student();
  print(girlStudent.name); // Kim
  print(girlStudent.age); // null

  girlStudent.printInfo();
  /*
  name: Kim
  age: null
  */

  girlStudent.name = 'shin';
  girlStudent.age = 28;
  print(girlStudent.name); // shin
  print(girlStudent.age); // 28

  girlStudent.printInfo();
  /*
  name: shin
  age: 28
  */
}
// Class(클래스): 객체지향프로그래밍(OOP) 에서 특징 object(객체) 생성하기 위해 정의하는 일종의 틀
// - class 는 변수와 함수를 정의할 수 있다.
// - 비슷한 성격을 가진 연관있는 변수와 함수들을 한 class 에 정의합니다.

class Student {
  String name = 'Kim';
  int? age;

  void printInfo() {
    print('---');
    print('name: $name');
    print('age: $age');
    print('---');
  }
}
