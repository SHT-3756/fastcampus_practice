import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimeOutScreen extends StatelessWidget {
  const TimeOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TimerCountdown(
            onTick: (Duration duration) {},
            spacerWidth: 5,
            daysDescription: '날',
            hoursDescription: '시',
            minutesDescription: '분',
            secondsDescription: '초',
            enableDescriptions: true,
            timeTextStyle: const TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold),
            colonsTextStyle: const TextStyle(color: Colors.redAccent, fontSize: 15, fontWeight: FontWeight.bold),
            endTime: currentTime.add(
              const Duration(
                days: 0,
                hours: 1,
                minutes: 2,
                seconds: 0,
              ),
            ),
            onEnd: () {
              print("Timer finished 끝난 시간 체크 @@ :${DateTime.now()}!!");
            },
          ),
        ),
      ),
    );
  }
}
