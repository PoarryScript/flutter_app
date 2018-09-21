import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  //todo Dart 并不支持构造函数的重载
  //这个构造方法使用了可选类型参数
  Rectangle({this.origin = const Point(0, 0), this.height = 0, this.width = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
}
