import 'package:flutter/material.dart';

class RadioButtonsExample22 extends StatefulWidget {
  @override
  _RadioButtonsExample22State createState() => _RadioButtonsExample22State();
}

class _RadioButtonsExample22State extends State<RadioButtonsExample22> {
  String selectedOption = 'Option 1';

  void handleRadioValueChanged(value) {
    setState(() {
      selectedOption = value;
    });
  }

  void navigateToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPage(selectedValue: selectedOption)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Buttons Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: const Text('Option 1'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            RadioListTile(
              title: const Text('Option 2'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            RadioListTile(
              title: const Text('Option 3'),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            const SizedBox(height: 16),
            Text(
              'Selected option: $selectedOption',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage(selectedValue: selectedOption),
                  )),
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String selectedValue;

  SecondPage({required this.selectedValue});

  @override
  _SecondPageState createState() => _SecondPageState(selectedValue);
}

class _SecondPageState extends State<SecondPage> {
  String selectedOption;

  _SecondPageState(this.selectedOption);

  void handleRadioValueChanged(value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: const Text('Option 1'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            RadioListTile(
              title: const Text('Option 2'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            RadioListTile(
              title: const Text('Option 3'),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            const SizedBox(height: 16),
            Text(
              'Selected option from first page: ${widget.selectedValue}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
