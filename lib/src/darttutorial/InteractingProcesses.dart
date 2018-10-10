import 'dart:io';

//进程间交互
main() async {
//  var result = await Process.run('ls', ['-l']);
  var result = await Process.runSync('dir',['']);
  print(result.stdout);
  var process = await Process.start('ls', ['-l']);
  // Get the exit code from the new process.
  var exitCode = await process.exitCode;
  print('exit code: $exitCode');
}
