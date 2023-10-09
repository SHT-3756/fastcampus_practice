import 'package:flutter/material.dart';
import 'package:ttoss_app/common/common.dart';
import 'package:ttoss_app/common/widget/w_rounded_container.dart';
import 'package:ttoss_app/screen/main/tab/home/vo/vo_bank_account.dart';

class BankAccountWidget extends StatelessWidget {
  final BankAccount account;

  const BankAccountWidget(
    this.account, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          account.bank.logeImagePath,
          width: 40,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (account.accountTypeName ?? '${account.bank.name} 통장')
                  .text
                  .white
                  .size(12)
                  .make(),
              ('${account.balance} 원').text.white.bold.size(18).make(),
            ],
          ).pSymmetric(h: 20, v: 10),
        ),
        RoundedContainer(
          backgroundColor: context.appColors.buttonBackground,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          radius: 10,
          child: '송금'.text.white.bold.make(),
        ),
      ],
    );
  }
}
