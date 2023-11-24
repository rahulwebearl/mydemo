import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  @override
  _SharedPreferencesExampleState createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  late TextEditingController _textController;
  late String _savedText = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _loadSavedData(); // Load saved data when the widget initializes
  }

  Future<void> _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedText = prefs.getString('saved_text') ?? ''; // Retrieve saved text
    });
  }

  Future<void> _saveData(String text) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_text', text); // Save text to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the text to SharedPreferences
                _saveData(_textController.text);
                setState(() {
                  _savedText =
                      _textController.text; // Update the displayed text
                });
              },
              child: Text('Save Text'),
            ),
            SizedBox(height: 20),
            Text(
              'Saved Text: $_savedText',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }
}
