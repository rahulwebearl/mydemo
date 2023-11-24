import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String name;
  final String name2;
  const Screen2({super.key, required this.name, required this.name2});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
      ),
      body: Column(
        children: [Text(widget.name), Text(widget.name2)],
      ),
    );
  }
}
