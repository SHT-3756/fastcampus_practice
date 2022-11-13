import 'person.dart';

void main() {
  print('상속 공부');

  Person mom = Person(name: '엄마');

  mom.speak();
  mom.walk();
  print(mom.name);

  // 자식클래스인 Hero 인스턴스 생성
  Hero child = Hero('자식');
  print(child.name); // 자식
  child.speak(); // 안녕 나는 자식 이야.
  child.walk(); // 자식은 걷는다.
  child.fly(); // 자식, 날다

  // 부모 타입의 변수 = 자식인스턴스 (생성자)
  Person child2 = Hero('자식2');
  child2.walk(); // 자식 클래스에서 재정의된 함수를 호출한다.
  child2.speak();

  speakName(mom);
  speakName(child);
  speakName(child2);
}

void speakName(Person person) {
  // person 이라는 객체를 받을 것이다.
  print('이름: ${person.name}');
}
