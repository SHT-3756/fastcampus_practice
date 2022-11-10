void main() {
    // Map : key, value 한쌍 으로 이뤄진 자료 구조
    // map 선언 방법
    // 특징 : key 값이 중복 되면 안된다.
    Map<String, dynamic> joinInputForm = {
    	'name':'panda',
        'age':28,
        'height': 174.9,
        'bool': false,
        'list': [1, 2, 3, 4],
        'phone': '010-1234-1234'.
    };
    
    print(joinInputForm['name']); // panda
    print(joinInputForm['list']); // [1, 2, 3, 4]
}
void main2() {
    Map map = {};
    print(map); // {}
    print(map['name']); // null    
    
    // key 값 할당
    // key 값이 없다?  = 선언 insert
    map['name'] = 'Kum';
    print(map); // {name : Kim}
    print(map['name']); // Kim
    
    
    // key 값이 있다? = update
    map['name'] = 'Park';
    print(map); // {name: Park}
    print(map['name']); // Park
    
    
    // delete
    map.remove('name');
    print(map); // {}
    print(map['name']); // null
}

void main3() {
    Map<String, dynamic> joinForm = {
    'name': 'Kim',
    'age': 28,
    'height': 174.9,
    'phone': '010-1234-1234',
    };
    
    print(joinForm); // {name: Kim, age: 28, height: 174.9, phone: 010-1234-1234}
    // key 목록 .keys
    print(joinForm.keys.toList()); //  [name, age, height, phone]
   
    // values 목록 .values
    print(joinForm.values.toList()); // [Kim, 28, 174.9, 010-1234-1234]
    
    // map 의 길이 
    print(joinForm.length); // 4
    
    // 포함 여부 판단
    print(joinForm.containsKey('name')); // true
    print(joinForm.containsKey('width')); // false
    
    // 전체 요소 지우기 
    joinForm.clear();
    print(joinForm); // {}
}