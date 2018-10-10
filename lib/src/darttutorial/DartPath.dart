import 'package:path/path.dart' as path;
import 'dart:io' ;

main() async{
  //使用join创新拼接的新路径、
  //todo  windows 下路径分割和linux下不一样 output：root/home\dart/workspace
  var newPath = path.join('root/home', 'dart/workspace');
  print(newPath);
  //组件内解析path
  print(path.split('users/poarry'));
  // Windows example.
  print(path.split(r'C:\tempdir\tmp.txt'));

  //计算相对路径
  //使用relative()获取相对路径
  //默认获取的是当前路径的相对路径，需要获取指定路径的相对路径可以用from
  print(path.relative(Directory.systemTemp.path));
  var path1 = 'docs/book.html';
  var path2 = 'articles/list';
  print(path.relative(path1, from: path2)); // Prints '../../docs/book.html'.
  print(path.relative(path2, from: path1)); // Prints '../../articles/list'.

  // Or you can work with absolute paths.
  var samples = 'http://www.dartlang.org/samples';
  var docs = 'http://www.dartlang.org/docs';
  print(path.relative(samples, from: docs)); // Prints '../samples'
  //URI 和path转换
  //todo 使用  toUri()  和 fromUri()相互转换
  var uri = path.toUri('http://dartlang.org/samples');
  print(path.fromUri(uri)); // Prints 'http:/dartlang.org/samples'.


  var file = await new File('${Directory.systemTemp.path}/dir/myFile.txt')
      .create(recursive: true);

  print(path.basename(file.path)); // Prints 'file.txt'.
  print(path.dirname(file.path)); // Prints path ending with 'dir'.
  print(path.basenameWithoutExtension(file.path)); // Prints 'myFile'.
  print(path.extension(file.path)); // Prints '.txt'.
}
