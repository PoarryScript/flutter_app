/**

    在函数式编程中
    可以将函数当做参数直接传递
    将函数直接赋值给变量
    对函数进行解构 值传递给函数一部分参数来调用它，让他返回一个函数去处理剩下的参数
    创建一个可以被当做常量的匿名函数（lambda）
 */

String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  //将上面的代码转换成函数式
  values.map(scream).forEach(print);
  //skip(1) 会忽略迭代中的第一个值
  //take(3)会获取接下来的 3 个值，也就是 2，3 和 5 剩下的值都会被忽略掉
  values.skip(1).take(3).map(scream).forEach(print);
}
