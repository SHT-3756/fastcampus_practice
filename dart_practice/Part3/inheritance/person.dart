class Hero extends Person {
  // name 값을 받는다.
  Hero(String name) : super(name: name);

  void fly() {
    print('$name, 날다');
  }

  //  부모 함수를 무효화 시키고 자식 함수로 재정의 시킨다.
  @override
  void walk() {
    super.walk(); // 부모의 함수를 부를 수 있다.
    print('$name, 뛴다.');
  }
}

class Person {
  Person({required this.name});

  String? name;

  void speak() {
    print('안녕 나는 $name 이야.');
  }

  void walk() {
    print('$name은 걷는다.');
  }
}
