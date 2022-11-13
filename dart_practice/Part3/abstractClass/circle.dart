import 'shape.dart';

class Circle implements Shape {
  Circle(this.redius);

  double redius;

  @override
  double getArea() {
    return redius * redius * 3.14;
  }

  @override
  String? color;

  @override
  void draw() {
    // TODO: implement draw
  }
}
