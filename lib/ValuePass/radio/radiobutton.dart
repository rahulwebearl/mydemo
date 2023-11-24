import 'package:flutter/material.dart';

class RadioButtonsExample extends StatefulWidget {
  @override
  _RadioButtonsExampleState createState() => _RadioButtonsExampleState();
}

class _RadioButtonsExampleState extends State<RadioButtonsExample> {
  String selectedOption = 'Option 1';

  void handleRadioValueChanged(result) {
    setState(() {
      selectedOption = result;
    });
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
              onChanged: (result2) => handleRadioValueChanged(result2),
            ),
            RadioListTile(
              title: const Text('Option 3'),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            RadioListTile(
              title: const Text('Option 4'),
              value: 'Option 4',
              groupValue: selectedOption,
              onChanged: (value) => handleRadioValueChanged(value),
            ),
            const SizedBox(height: 16),
            Text(
              'Selected option: $selectedOption',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SecondPage(selectedValue: selectedOption),
                      ));
                },
                child: Text("page2"))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String selectedValue;

  SecondPage({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(
          'Selected option from first page: $selectedValue',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
