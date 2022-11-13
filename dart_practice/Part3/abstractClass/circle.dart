import 'shape.dart';

class Circle extends Shape {
  Circle(this.redius);

  double redius;

  @override
  double getArea() {
    return redius * redius * 3.14;
  }
}
