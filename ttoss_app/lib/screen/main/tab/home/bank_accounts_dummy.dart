import 'package:ttoss_app/screen/main/tab/home/banks_dummy.dart';
import 'package:ttoss_app/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(banksShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(banksShinhan, 4000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(banksShinhan, 5000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(banksTtoss, 50000000);
final bankAccountKakao = BankAccount(banksKakao, 200000, accountTypeName: '입출금 통장');

main() {
  // list index 의 키 벨류 출력
  // print('test ${bankAccounts[0].accountTypeName}');

  // list 반복문 위젯에 키 벨류 바인딩 가능
  for(final item in bankAccounts) {
    print(item.accountTypeName);
  }

  // Map 해당 키 벨류 출력 가능 (fromMap() 에 활용)
  final shinhanBank = bankMap['shinhan1'];
  print(shinhanBank == bankAccountShinhan1); // true
  // 반복문
  for(final entry in bankMap.entries) {
    print(entry.key + ':' + (entry.value.accountTypeName ?? entry.value.bank.name));
  }

  // Set 데이터가 존재하는지를 체크하기 위해 자주씀
  print(bankSet.contains(bankAccountShinhan1));
  // List 에서도 contains() 함수가 있는데, 시간복잡도에 관련이 있다. 리스트는 안의 크기만큼 돌면서 확인하고 O(n), Set 은 안의 해시테이블을 통해서 즉 유무를 판단해준다 O(1).
  // List 의 크기가 커질 수록 오래걸리기 때문에, Set을 쓰는것이 좋다.

  // 형변환 가능
  // List -> Set
  bankAccounts.toSet();
  // Set -> List
  bankSet.toList();
}

// List : 중복 허용 O
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map : 중복 허용 X, 순서 보장 X, 보장 시키고 싶으면 LinkedHashMap 사용
final bankMap = {'shinhan1': bankAccountShinhan1, 'shinhan2': bankAccountShinhan2};

// Set : 중복 허용 X
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
};
