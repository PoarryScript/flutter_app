printNumber(num n) {
  print('The number is $n');
}

printStr(String str) {
  print('The String is $str');
}

var topLevel = true;
//程序执行入口
main(List<String> args) {
  var num;
  int nums;

  printNumber(nums);
  printNumber(num);
  final name = 'Poarry';
  printStr(name);
  var ha = '''
   ddd
   ddd
   ''';
  printStr(ha);
  var s = r"In a raw string, even \n isn't special.";
  printStr(s);
  var list = [1, 2, 3];

  printNumber(list[1]);

  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  print(Symbol("sss"));

  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  print(loudify);
  assert(loudify('hello') == '!!! HELLO !!!');

  var array = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
  array.forEach((i) {
    print(array.indexOf(i).toString() + ': ' + i);
  });
  array.forEach((i) => print(array.indexOf(i).toString() + ': ' + i));

  var insideMain = true;

  myFunction() {
    var insideFunction = true;

    nestedFunction() {
      var insideNestedFunction = true;
      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  print(add2(3));
  print(add4(5));

  var nsa= ['s',22,'dd'];
  var names = new List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>); // true

  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
}

Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}
/**
    1、 所有能够使用变量引用的都是对象，每个对象都是一个类的实例，（包括数字，方法，null）
    所有的对象都继承自Object类

    2、使用静态类型（如num）可以更清晰的表明你的意图，可以让静态分析工具来分析你的代码，但这不是强制性的

    3·、Dart在运行之前会先解析你的代码。

    4、Dart支持顶级方法（如main），也支持在类中定义函数，可以在方法中定义方法（嵌套方法或者局部方法）

    5、Dart支持顶级变量，以及在勒种定义变量（静态变量和实例变量），实例变量有时候被称之为域（Fields）或者属性（Properties）

    6、Dart没有public protected 以及private关键字，如果一个标识符以(_)开头，则该标识符在库内是私有的。

    7、标识符可以以字母或者 _ 下划线开头，后面可以是 其他字符和数字的组合。

    8、时候 表达式 expression 和 语句 statement 是有区别的，所以这种情况我们会分别指明每种情况。

 */
checkVersion() async {
  var version = await lookUpVersion();
  if (version == expectedVersion) {
    // Do something.
  } else {
    // Do something else.
  }
}
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}
class Television {
  /// _Deprecated: Use [turnOn] instead._
  @deprecated
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    print('on!');
  }
}
class TvTelevision extends Television{
  @override
  void activate() {
    // TODO: implement activate
    super.activate();
  }
}