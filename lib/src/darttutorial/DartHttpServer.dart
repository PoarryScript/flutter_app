import 'dart:io';
import 'package:route/server.dart';
import 'package:route/url_pattern.dart';

// Pattern for all posts (plural).
final postsUrl = new UrlPattern(r'/posts\/?');

// Pattern for a single post('/post/24', for example).
final postUrl = new UrlPattern(r'/post/(\d+)\/?');

// Callback for all posts (plural).
servePosts(req) {
  req.response.write("All blog posts");
  req.response.close();
}

// Callback for a single post('/post/24', for example).
servePost(req) {
  var postId = postUrl.parse(req.uri.path)[0];
  req.response.write('Blog post $postId');
  req.response.close();
}

// Callback to handle illegal urls.
serveNotFound(req) {
  req.response.statusCode = HttpStatus.NOT_FOUND;
  req.response.write('Not found');
  req.response.close();
}

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  var router = new Router(server)
  // Associate callbacks with URLs.
    ..serve(postsUrl, method: 'GET').listen(servePosts)
    ..serve(postUrl, method: 'GET').listen(servePost)
    ..defaultStream.listen(serveNotFound);
}