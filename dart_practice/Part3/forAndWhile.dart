import 'dart:math';

void main() {
  // 반복문
  // while, for

  double weight = 75;
  int count = 0;

  while (weight > 68) {
    print('총 몸무게 : $weight');
    count++;
    print('줄넘기 횟수: $count');

    var removeWeight = Random().nextInt(2);
    weight = weight - removeWeight;
    print('감량한 무게: $removeWeight kg');
    print('총 몸무게: $weight kg');

    /*
    줄넘기 횟수: 1
    감량한 무게: 1 kg
    총 몸무게: 74.0 kg
    총 몸무게 : 74.0
    줄넘기 횟수: 2
    감량한 무게: 1 kg
    총 몸무게: 73.0 kg
    총 몸무게 : 73.0
    줄넘기 횟수: 3
    감량한 무게: 1 kg
    총 몸무게: 72.0 kg
    총 몸무게 : 72.0
    줄넘기 횟수: 4
    감량한 무게: 1 kg
    총 몸무게: 71.0 kg
    총 몸무게 : 71.0
    줄넘기 횟수: 5
    감량한 무게: 0 kg
    총 몸무게: 71.0 kg
    총 몸무게 : 71.0
    줄넘기 횟수: 6
    감량한 무게: 0 kg
    총 몸무게: 71.0 kg
    총 몸무게 : 71.0
    줄넘기 횟수: 7
    감량한 무게: 0 kg
    총 몸무게: 71.0 kg
    총 몸무게 : 71.0
    줄넘기 횟수: 8
    감량한 무게: 1 kg
    총 몸무게: 70.0 kg
    총 몸무게 : 70.0
    줄넘기 횟수: 9
    감량한 무게: 1 kg
    총 몸무게: 69.0 kg
    총 몸무게 : 69.0
    줄넘기 횟수: 10
    감량한 무게: 1 kg
    총 몸무게: 68.0 kg
    */

    final tempCount = 3;
    for (var i = 0; i < tempCount; i++) {
      print(i);
    }

    final scoreList = [10, 30, 23, 50, 67, 30, 100, 87, 90];
    for (var i = 0; i < scoreList.length; i++) {
      if (scoreList[i] >= 60) {
        print('${scoreList[i]}점 학생, ${i + 1} 번째 합격입니다.');
      } else {
        print('${scoreList[i]}점 학생, ${i + 1} 번째 불합격입니다.');
      }
    }

    /*
    0점 학생, 1 번째 불합격입니다.
    30점 학생, 2 번째 불합격입니다.
    23점 학생, 3 번째 불합격입니다.
    50점 학생, 4 번째 불합격입니다.
    67점 학생, 5 번째 합격입니다.
    30점 학생, 6 번째 불합격입니다.
    100점 학생, 7 번째 합격입니다.
    87점 학생, 8 번째 합격입니다.
    90점 학생, 9 번째 합격입니다.
    */

    // for in 반복문 열거형 이다.
    for (var score in scoreList) {
      print('점수 : $score');
    }
    /*
    점수 : 10
    점수 : 30
    점수 : 23
    점수 : 50
    점수 : 67
    점수 : 30
    점수 : 100
    점수 : 87
    점수 : 90
     */

  }
}
