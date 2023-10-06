import 'package:ttoss_app/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  // final 유무 차이는 유 : 안변함, 무 : 변함
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance, {
    this.accountTypeName, // 옵셔널 파라미터로 생성
  });
}
