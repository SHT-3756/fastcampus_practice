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
  Student({required String name, this.age}) : _name = '$name 학생';

  // private
  String _name;
  // public
  int? age;

  // setter, getter 생성
  // setter 와 getter 는 변수 선언할떄, 호출할때 이미 내장 되어있는 것이다. 그래서 변수에 값을 저장하고, 불러올 수 있는 것이다.
  set name(String value) {
    _name = '$value 학생';
  }

  // getter 생성
  // getter 는 매개변수를 받을 필요가 없다. 왜냐
  // String get name {
  //   print('getter 호출 $name');
  //   return _name;
  // }

  // getter 생성 (람다식)
  String get name => _name;

  void printInfo() {
    print('---');
    print('name: $_name');
    print('age: $age');
    print('---');
  }
}
