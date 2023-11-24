import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({
    required this.name,
    required this.color,
    required this.ontap,
    super.key,
  });
  String? name;
  Color? color;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(name.toString()),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
