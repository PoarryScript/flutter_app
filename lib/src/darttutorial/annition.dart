library todo;

class todo {
  final String who;
  final String what;

  const todo(this.who, this.what);
}

//使用注解@todo
@todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}
