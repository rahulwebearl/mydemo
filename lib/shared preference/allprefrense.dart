import 'package:apidata/deom/calenderdemo..dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fileUpload/multiple.dart';
import '../fileUpload/singlefile.dart';

class ALLSheredExamples extends StatefulWidget {
  @override
  _ALLSheredExamplesState createState() => _ALLSheredExamplesState();
}

class _ALLSheredExamplesState extends State<ALLSheredExamples> {
  late SharedPreferences _prefs;
  String _textData = 'No Text';
  late int _radioValue;
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load data from SharedPreferences
  _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _textData = _prefs.getString('') ?? ' No Text';
      _radioValue = _prefs.getInt('') ?? 0;
      _dropdownValue = _prefs.getString('') ?? 'Option 1';
    });
  }

  // Save text data to SharedPreferences
  _saveTextData(String newText) {
    _prefs.setString('textData', newText);
  }

  // Save radio button selection to SharedPreferences
  _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      _prefs.setInt('radioValue', value);
    });
  }

  // Save dropdown selection to SharedPreferences
  _handleDropdownValueChange(String value) {
    setState(() {
      _dropdownValue = value;
      _prefs.setString('dropdownValue', value);
    });
  }

  // Navigate to the next page and pass data
  _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(
          textData: _textData,
          radioValue: _radioValue,
          dropdownValue: _dropdownValue,
        ),
      ),
    );
  }

  // Function to save selected values to SharedPreferences
  void _saveSelectedValues() {
    _prefs.setString('textData', _textData);
    _prefs.setInt('radioValue', _radioValue);
    _prefs.setString('dropdownValue', _dropdownValue);

    _prefs.getString(
      "textValue :- ${_textData}",
    );
    _prefs.getInt('RadioValue:- ${_radioValue}');
    _prefs.getString("DropDown:- ${_dropdownValue}");
  }

  // Function to show the submit message
  void _showSubmitMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Submit button is not yet implemented.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Stored Text: $_textData'),
            TextField(
              onChanged: (newText) {
                _saveTextData(newText);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) => _handleRadioValueChange(value!),
                ),
                const Text('Option 1'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) => _handleRadioValueChange(value!),
                ),
                const Text('Option 2'),
                Radio(
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: (value) => _handleRadioValueChange(value!),
                ),
                const Text('Option 3')
              ],
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _dropdownValue,
              onChanged: (value) => _handleDropdownValueChange(value!),
              items: <String>[
                'Option 1',
                'Option 2',
                'Option 3',
                'Option 4',
                'My Opt'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveSelectedValues();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Selected values saved in SharedPreferences.'),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(
                          textData: _textData,
                          radioValue: _radioValue,
                          dropdownValue: _dropdownValue),
                    ));
              },
              child: const Text('Next Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calendersss()));
              },
              child: const Text('Calender Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String textData;
  final int radioValue;
  final String dropdownValue;

  NextPage(
      {required this.textData,
      required this.radioValue,
      required this.dropdownValue});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    // Print the selected data to the terminal
    print('Text: ${widget.textData}');
    print('Radio Value: ${widget.radioValue}');
    print('Dropdown Value: ${widget.dropdownValue}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Text: ${widget.textData}'),
            Text('Radio Value: ${widget.radioValue}'),
            Text('Dropdown Value: ${widget.dropdownValue}'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileUploadScreen(),
                      ));
                },
                child: Text("File upload")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultipleFile(),
                      ));
                },
                child: Text(" Multiple File upload"))
          ],
        ),
      ),
    );
  }
}
