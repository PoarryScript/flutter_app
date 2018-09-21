class Bicycle {
  int cadence;

  //todo 所有名字以下划线开头的变量，Dart 的编译器都会将其强制标记为私有的
  int _speed = 0;

  //todo 未初始化的变量（即使是数字类型的变量）的值都为 null
  int gear;

  Bicycle(this.cadence, this.gear);

  int get speed => _speed;

  @override
  String toString() => 'Bicycle:$speed mph';

  voidapplyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
}

//https://codelabs.flutter-io.cn/codelabs/from-java-to-dart-cn/index.html#1
void main() {
  var bike = Bicycle(2, 1); //new关键词是可选的
  print(bike);
}


