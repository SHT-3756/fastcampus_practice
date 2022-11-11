void main() {
  print('class 공부');
  // instance 인스턴스 : object (객체) 생성
  // Student girlStudent = Student('taetae', 20);
  // 생성자 예시를 위한 인스턴스 생성
  Student girlStudent = Student(name: 'gugu', age: 21);

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
  // constructor : 생성자
  // 생성자의 매개변수에 this 를 사용해서 인스턴스의 파라미터로 받아 넣어줄 경우!
  // Student(this.name, this.age);
  // 생성자의 매개변수에 (타입 매개변수, 타입 매개변수) 넣을 경우, 잘못된 방법이다.
  // Student(String name2, int age2) {
  //   print('생성자 실행');
  //   this.name = name2;
  //   this.age = age2;
  // }

  // 생성자 에서 name 뒤에 학생을 붙이고 싶을때!, 그리고 생성자 이기떄문에 클래스가 생성될 떄 딱한번만 실행 된다.
  Student({required String name, this.age}) : name = '$name 학생';

  String name = 'Kim';
  int? age;

  void printInfo() {
    print('---');
    print('name: $name');
    print('age: $age');
    print('---');
  }
}
