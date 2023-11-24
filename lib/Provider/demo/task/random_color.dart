import 'package:colorlizer/colorlizer.dart';
import 'package:flutter/material.dart';

class Randomcolors extends StatefulWidget {
  @override
  _RandomcolorsState createState() => _RandomcolorsState();
}

class _RandomcolorsState extends State<Randomcolors> {
  int _counter = 0;
  ColorLizer colorlizer = ColorLizer();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorlizer.getRandomColors(),
      appBar: AppBar(
        title: Text("Random"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
