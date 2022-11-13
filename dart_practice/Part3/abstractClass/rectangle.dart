import 'shape.dart';

class Rectangle extends Shape {
  Rectangle(this.width, this.height);

  double width;
  double height;

  @override
  double getArea() {
    return width * height;
  }
}
