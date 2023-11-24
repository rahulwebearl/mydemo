import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class Duration_picker extends StatefulWidget {
  const Duration_picker({
    Key? key,
  }) : super(key: key);

  @override
  _Duration_pickerState createState() => _Duration_pickerState();
}

class _Duration_pickerState extends State<Duration_picker> {
  Duration _duration = const Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duration_picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
              duration: _duration,
              baseUnit: BaseUnit.second,
              onChange: (val) {
                setState(() => _duration = val);
              },
              snapToMins: 5.0,
            ))
          ],
        ),
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) => FloatingActionButton(
                onPressed: () async {
                  var resultingDuration = await showDurationPicker(
                    context: context,
                    initialTime: const Duration(seconds: 60),
                    baseUnit: BaseUnit.second,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Chose duration: $resultingDuration')));
                },
                tooltip: 'Popup Duration Picker',
                child: const Icon(Icons.add),
              )),
    );
  }
}
