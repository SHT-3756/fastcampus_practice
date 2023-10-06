import 'package:ttoss_app/screen/main/tab/home/banks_dummy.dart';
import 'package:ttoss_app/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(banksShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(banksShinhan, 4000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(banksShinhan, 5000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(banksTtoss, 50000000);
final bankAccountKakao = BankAccount(banksKakao, 200000, accountTypeName: "입출금 통장");

main() {
  print('test ${bankAccounts[0].accountTypeName}');
}

// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map

// Set