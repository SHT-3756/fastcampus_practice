void main() {
  // list
  List list = [];
  print(list);

  // list 안에 값을 추가할 때 .add()
  list.add('a');
  list.add('b');
  print(list); // [a, b]

  list.add('c');
  print(list); // [a, b, c]
  print(list.length); // 3

  // <> 제네릭 타입 선언 -> 타입 제한 가능
  // String 으로 타입 선언
  List<String> stringList = <String>[];
  // int 로 타입 선언
  List<int> intList = <int>[];

  print(list[0]); // a
}

void main2() {
  List<String> list = [];
  list.add('a');
  print(list); // a

  list.addAll(['b', 'c', 'a']);
  print(list); // [a, b, ,c, d]
  print(list[0]); // a
  print(list[3]); // a

  print(list.lengh); // 4

  // 포함 여부를 확인하는 연산자
  print(list.contains('a')); // true
  print(list.contains('4')); // false
  print(list.contains('b')); // true

  // 마지막 요소
  print(list.last); // a
  // 첫번째 요소
  print(list.first); // a

  // index 기반으로 값을 수정할때
  list[0] = '가';
  list[1] = '나';
  list[2] = '다';
  list[3] = '라';
  print(list); // [가, 나, 다, 라]

  // 삭제
  list.remove('라');
  print(list); // [가, 나, 다]
  list.remove('가');
  print(list); // [나, 다]
  list.removeAt(0);
  print(list); // [다]
}

void main3() {
  // set 선언
  Set<String> set = {};
  set.add('a');
  set.add('b');
  set.add('c');
  print(set); // {a, b, c}
  print(set.length); // 3
  // print(set[2]);// error: The operator '[]' isn't defined for the type 'Set<String>'.
  // set 은 순서보장 안되는 열거 타입이다. 그래서 인덱스 접근이 X

  // xm특징 2 중복을 허용하지 않는다.
  set.add('a');
  print(set); // {a, b, c}

  // 특징 3 list 보다 접근하는것이 빠르다.
  // list 는 인덱스에 차곡차곡 넣는 반면, set 은 뭉텅이로 넣는다.

  // 포함 여부를 확인하는 연산자
  set.contains('a'); // true;
  set.contains('d'); // false;
}
