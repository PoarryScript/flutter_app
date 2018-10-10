import 'dart:convert';
//import "dart:io" show Directory, HttpClient, RedirectInfo;
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

main() async {
  //file option
  var dir = await Directory.systemTemp.createTemp('my_temp_dir');
  print(await dir.exists());

  await dir.delete();

  print(await dir.exists());

  //get
  var url = 'http://httpbin.org/';
  var response = await http.get(url);
  print("Response status:${response.statusCode}");
  print("response body:${response.body}");

  //post
  var postUrl = 'http://httpbin.org/post';
  var postResponse = await http.post(postUrl, body: 'name=doodle&color=blue');
  print("response status:${postResponse.statusCode}");
  print("response body:${postResponse.body}");

  //add header
  var headerUrl = 'https://api.github.com/users/dart-lang/repos';
  var headerResponse = await http
      .get(headerUrl, headers: {'User-Agent': 'Dart/1.0 (My Dart client)'});
//parser response
  List<dynamic> repos = json.decode(headerResponse.body);
  var heading = 'Repository  | Star count | Fork count';
  print(heading);
  print(new List.filled(heading.length, '=').join());
  print(repos);
  for (var repo in repos) {
    print("${repo['name']}  |  "
        "${repo['stargazers_count']}  | "
        "${repo['forks_count']}");
  }

  //use client 获取长连接；
  var connectionUrl = 'http://www.google.com/';
  var client = new http.Client();
  var connectionResponse = await client.get('$connectionUrl/search');

  try {
    printResponseBody(connectionResponse);

    connectionResponse = await client.get('$connectionUrl/doodles');
    printResponseBody(connectionResponse);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
  //use httpclient 获取redirects
  var httpClient = new HttpClient();
  var httpRequest = await httpClient.getUrl(Uri.parse('http://google.com'));
  var httpResponse = await httpRequest.close();

  List<RedirectInfo> redirectsArray = httpResponse.redirects;
  redirectsArray.forEach((redirect) {
    print(redirect.location);
  });

  //get response as String
  print(await http.read("http://www.google.com/"));

  //get response as binary format
//  var burl = "https://www.dartlang.org/logos/dart-logo.png";
//  var bresponse = await http.get(burl);
//  List<int> bytes = response.bodyBytes;
//  // Do something with the bytes. For example, convert to base64.
//  String base64 =CryptoUtils.bytesToBase64(bytes);
//  print(base64);

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (HttpRequest request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write('Hello, world')
      ..close();
  }
}

printResponseBody(response) {
  print(response.body.length);
  if (response.body.length > 100) {
    print(response.body.substring(0, 100));
  } else {
    print('...\n');
  }
}
