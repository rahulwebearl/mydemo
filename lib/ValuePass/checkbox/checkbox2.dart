import 'package:flutter/material.dart';

class SelectMultipleOptions02 extends StatefulWidget {
  @override
  _SelectMultipleOptions02State createState() =>
      _SelectMultipleOptions02State();
}

class _SelectMultipleOptions02State extends State<SelectMultipleOptions02> {
  List<String> selectedOptions = [];

  void toggleSelection(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  void navigateToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(selectedOptions: selectedOptions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Multiple Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              title: Text('Option 1'),
              value: selectedOptions.contains('Option 1'),
              onChanged: (value) {
                toggleSelection('Option 1');
              },
            ),
            CheckboxListTile(
              title: Text('Option 2'),
              value: selectedOptions.contains('Option 2'),
              onChanged: (value) {
                toggleSelection('Option 2');
              },
            ),
            CheckboxListTile(
              title: Text('Option 3'),
              value: selectedOptions.contains('Option 3'),
              onChanged: (value) {
                toggleSelection('Option 3');
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => navigateToSecondPage(context),
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final List<String> selectedOptions;

  SecondPage({required this.selectedOptions});

  @override
  _SecondPageState createState() => _SecondPageState(selectedOptions);
}

class _SecondPageState extends State<SecondPage> {
  List<String> selectedOptions;

  _SecondPageState(this.selectedOptions);

  void toggleSelection(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  List<Widget> generateCheckboxes() {
    List<Widget> checkboxes = [];
    for (String option in selectedOptions) {
      checkboxes.add(
        CheckboxListTile(
          title: Text(option),
          value: true, // All values are selected from the previous page
          onChanged: (value) {
            toggleSelection(option);
          },
        ),
      );
    }
    return checkboxes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected options from first page:',
              style: TextStyle(fontSize: 18),
            ),
            Column(
              children: generateCheckboxes(),
            ),
          ],
        ),
      ),
    );
  }
}
