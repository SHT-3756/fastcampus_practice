import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_heetae/components/custom_constant.dart';

class TodayPage extends StatelessWidget {
  TodayPage({super.key});

  final list = [
    '약1',
    '약이름',
    '약이름 테스트',
    '약이름약이름약이름약이름약이름약이름약이름',
    '약이름약이름약이름약이름약이름약이름약이름',
    '약이름약이름약이름약이름약이름약이름약이름',
    '약이름약이름약이름약이름약이름약이름약이름',
    '약이름약이름약이름약이름약이름약이름약이름',
    '약이름약이름약이름약이름약이름약이름약이름',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘 약 복용할 약은?',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: regularSpace),
        const Divider(
          // 구분선
          height: 1,
          thickness: 2.0,
        ),
        Expanded(
            // ListView.builder() : list 기반으로 view 가 그려진다.
            // ListView.separated(separatorBuilder) : itemBuilder 사이사이마다 separatorBuilder 의 위젯을 추가
            child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: smallSpace),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return MedicineListTitle(
              name: list[index],
            );
          },
          // itemBuilder 사이 구분 하기 위한 위젯(여백을 넣어서 구분하게 만들었다.)
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: regularSpace,
            );
          },
        )),
        const Divider(
          // 구분선
          height: 1,
          thickness: 2.0,
        ),
      ],
    );
  }
}

class MedicineListTitle extends StatelessWidget {
  const MedicineListTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const CircleAvatar(
            radius: 40,
          ),
        ),
        const SizedBox(
          width: smallSpace,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '8:30',
              style: textStyle,
            ),
            const SizedBox(
              height: 6,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(
                  name,
                  style: textStyle,
                ),
                TileActionButton(
                  onTap: () {},
                  title: '지금',
                ),
                Text(
                  '|',
                  style: textStyle,
                ),
                TileActionButton(
                  onTap: () {},
                  title: '아까',
                ),
                Text(
                  '먹었어요',
                  style: textStyle,
                ),
              ],
            )
          ]),
        ),
        CupertinoButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.ellipsis_vertical))
      ],
    );
  }
}

class TileActionButton extends StatelessWidget {
  const TileActionButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w500);
    return GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: buttonTextStyle,
        ));
  }
}
