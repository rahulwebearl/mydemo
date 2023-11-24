import 'package:flutter/material.dart';
import 'package:time_interval_picker/time_interval_picker.dart';

class Time_intervalPK extends StatefulWidget {
  const Time_intervalPK({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Time_intervalPK> createState() => _Time_intervalPKState();
}

class _Time_intervalPKState extends State<Time_intervalPK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TimeIntervalPicker(
          endLimit: DateTime(2025, 08, 01),
          startLimit: DateTime(2022, 10, 01),
          onChanged: (DateTime? startTime, DateTime? endTime, bool isAllDay) {},
        ),
      ),
    );
  }
}
