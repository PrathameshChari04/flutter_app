import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Container(
        height: 100,
        color: Colors.blueGrey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.orange,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.yellow,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
