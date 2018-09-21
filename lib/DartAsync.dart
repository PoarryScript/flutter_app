import 'dart:async';
import 'dart:html';
import 'dart:math' show Random;

main() async {
  print('Compute π using the Monte Carlo method.');
  var output = querySelector("#output");
  await for (var estimate in computePi().take(500)) {
    print('π=$estimate');
    output.text = estimate.toStringAsFixed(5);
    await window.animationFrame;
  }
}

Stream<double> computePi({int batch: 100000}) async* {
  var total = 0;
  var count = 0;
  while (true) {
    var points = generateRandom().take(batch);
    var inside = points.where((p) => p.isInsideUnitCircle);
    total += batch;
    count += inside.length;
    var ratio = count / total;
    yield ratio * 4;
  }
}

Iterable<Point> generateRandom([int send]) sync* {
  final random = Random(send);
  while (true) {
    yield Point(random.nextDouble(), random.nextDouble());
  }
}

class Point {
  final double x, y;

  const Point(this.x, this.y);

  bool get isInsideUnitCircle => x * x + y * y <= 1;
}
