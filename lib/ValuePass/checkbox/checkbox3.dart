import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
              title: const Text("Aapple"),
              value: checkbox1,
              onChanged: (value) {
                setState(() {
                  checkbox1 = value!;
                });
              }),

          CheckboxListTile(
            title: const Text("Mango"),
            value: checkbox2,
            onChanged: (value) {
              setState(() {
                checkbox2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Banana"),
            value: checkbox3,
            onChanged: (value) {
              setState(() {
                checkbox3 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Lemon"),
            value: checkbox4,
            onChanged: (value) {
              setState(() {
                checkbox4 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Orange"),
            value: checkbox5,
            onChanged: (value) {
              setState(() {
                checkbox5 = value!;
              });
            },
          ),
          // Other checkboxes similarly
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    checkbox1: checkbox1,
                    checkbox2: checkbox2,
                    checkbox3: checkbox3,
                    checkbox4: checkbox4,
                    checkbox5: checkbox5,
                  ),
                ),
              );
            },
            child: const Text('Go to Second Page'),
          ),

          Container(
            child: Column(
              children: [Text(checkbox1.toString())],
            ),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final bool checkbox1;
  final bool checkbox2;
  final bool checkbox3;
  final bool checkbox4;
  final bool checkbox5;

  SecondPage({
    required this.checkbox1,
    required this.checkbox2,
    required this.checkbox3,
    required this.checkbox4,
    required this.checkbox5,
  });

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late bool checkbox1;
  late bool checkbox2;
  late bool checkbox3;
  late bool checkbox4;
  late bool checkbox5;

  @override
  void initState() {
    super.initState();
    checkbox1 = widget.checkbox1;
    checkbox2 = widget.checkbox2;
    checkbox3 = widget.checkbox3;
    checkbox4 = widget.checkbox4;
    checkbox5 = widget.checkbox5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text("Apple"),
            value: checkbox1,
            onChanged: (value) {
              setState(() {
                checkbox1 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Mango"),
            value: checkbox2,
            onChanged: (value) {
              setState(() {
                checkbox2 = value!;
              });
            },
            // Other checkboxes similarly
          ),
          CheckboxListTile(
            title: const Text("Banana"),
            value: checkbox3,
            onChanged: (value) {
              setState(() {
                checkbox3 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Lemon"),
            value: checkbox4,
            onChanged: (value) {
              setState(() {
                checkbox4 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Orange"),
            value: checkbox5,
            onChanged: (value) {
              setState(() {
                checkbox5 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
