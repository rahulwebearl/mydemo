import 'package:flutter/material.dart';

class Displaydata extends StatefulWidget {
  final String name;
  final String password;
  const Displaydata({super.key, required this.name, required this.password});

  @override
  State<Displaydata> createState() => _DisplaydataState();
}

class _DisplaydataState extends State<Displaydata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display'),
      ),
      body: Column(
        children: [Text(widget.name), Text(widget.password)],
      ),
    );
  }
}
