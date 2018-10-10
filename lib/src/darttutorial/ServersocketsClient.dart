import 'dart:convert';
import 'dart:io';
//socket client
main() async{
//client
var socket = await Socket.connect('127.0.0.1', 4041);
print(socket.runtimeType);
socket.write('Hello,Poarry');
}