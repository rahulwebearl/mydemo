import 'package:apidata/ValuePass/demo2.dart';
import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  // use first controller to save TextEditingController.

  TextEditingController _textController = TextEditingController();
  TextEditingController _texcontroller1 = TextEditingController();

  // create variable for storing values
  String _displayedText = '';
  String _displayed1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Data Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Create Textform form field
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _texcontroller1,
              decoration: const InputDecoration(
                labelText: 'Enter Text1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // button for pass value in next page
            ElevatedButton(
              onPressed: () {
                // use setstate for saving values in variables
                setState(() {
                  _displayedText = _textController.text;
                  _displayed1 = _texcontroller1
                      .text; // Get the text entered in the TextFormField
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Screen2(name: _displayedText, name2: _displayed1),
                    ));
              },
              child: const Text('Display Text'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  // display text
                  Text(
                    _displayedText, // Display text in this container
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(_displayed1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
