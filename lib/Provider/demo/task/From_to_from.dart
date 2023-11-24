import 'package:flutter/material.dart';
import 'package:from_to_time_picker/from_to_time_picker.dart';

class Form_to_form extends StatefulWidget {
  const Form_to_form({
    Key? key,
  }) : super(key: key);

  @override
  State<Form_to_form> createState() => _Form_to_formState();
}

class _Form_to_formState extends State<Form_to_form> {
  String startTime = 'from';
  String endTime = 'to'
      '';

  void showLightTimePicker() {
    showDialog(
        context: context,
        builder: (_) => FromToTimePicker(
              onTab: (from, to) {
                print('from $from to $to');
                setState(() {
                  startTime = from.hour.toString();
                  endTime = to.hour.toString();
                });
              },
            ));
  }

  void showDarkTimePicker() {
    showDialog(
      context: context,
      builder: (_) => FromToTimePicker(
        onTab: (from, to) {
          print('from $from to $to');
          setState(() {
            startTime = from.hour.toString();
            endTime = to.hour.toString();
          });
        },
        dialogBackgroundColor: Color(0xFF121212),
        fromHeadlineColor: Colors.white,
        toHeadlineColor: Colors.white,
        upIconColor: Colors.white,
        downIconColor: Colors.white,
        timeBoxColor: Color(0xFF1E1E1E),
        timeHintColor: Colors.grey,
        timeTextColor: Colors.white,
        dividerColor: Color(0xFF121212),
        doneTextColor: Colors.white,
        dismissTextColor: Colors.white,
        defaultDayNightColor: Color(0xFF1E1E1E),
        defaultDayNightTextColor: Colors.white,
        colonColor: Colors.white,
        showHeaderBullet: true,
        headerText: 'Time available from 01:00 AM to 11:00 PM',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form to Form"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('selected duration'),
            SizedBox(
              height: 10,
            ),
            Text('$startTime - $endTime'),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () => showLightTimePicker(),
                child: Text(' show light time picker')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => showDarkTimePicker(),
                child: Text(' show dark time picker')),
          ],
        ),
      ),
    );
  }
}
