import 'circle.dart';
import 'rectangle.dart';
import 'shape.dart';

void main() {
  Circle circle = Circle(3);
  Rectangle rectangle = Rectangle(5, 10.3);
  printArea(circle);
  printArea(rectangle);
}

void printArea(Shape shape) {
  print('면적: ${shape.getArea()}');
}
