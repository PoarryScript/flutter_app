import 'dart:convert';
import 'dart:io';
//socket server
main() async {
  //server
  var serverSocket = await ServerSocket.bind('127.0.0.1', 4041);
  print('connected');
  await for (var socket in serverSocket)
    socket.transform(Utf8Decoder()).listen(print);

}
