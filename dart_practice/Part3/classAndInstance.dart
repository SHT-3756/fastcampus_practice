import 'classAndInstanceClass.dart';

void main() {
  print('class 공부');
  // instance 인스턴스 : object (객체) 생성
  // Student girlStudent = Student('taetae', 20);
  // 생성자 예시를 위한 인스턴스 생성
  Student girlStudent = Student(name: 'gugu', age: 21);

  // print(girlStudent.age);

  girlStudent.printInfo();

  // setter
  girlStudent.name = 'shin';

  // getter
  print(girlStudent.name);

  girlStudent.age = 28;

  print(girlStudent.age);

  girlStudent.printInfo();
}
