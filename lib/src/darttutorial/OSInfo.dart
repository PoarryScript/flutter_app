import 'dart:io' show Platform;

main() {
  Map<String, String> envVars = Platform.environment;
  print(envVars['PATH']); //获取环境变量的PATH
  print(Platform.environment); //获取环境变量
  print(Platform.operatingSystem); //获取操作系统
  print(Platform.isIOS); //是否是ios
  print(Platform.isAndroid);
  print(Platform.isFuchsia);
  print(Platform.isFuchsia);

  //获取当前脚本的绝对路径
  var uri = Platform.script;
  print(uri);
  //将URI转为系统路径
  print(uri.toFilePath());
}
