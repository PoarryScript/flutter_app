import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: 'Search', onPressed: null)
        ],
      ),
      body: new Center(
        child: new Text('Hello world'),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add', child: new Icon(Icons.add), onPressed: null),
    );
  }
}
