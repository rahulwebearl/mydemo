import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_number_captcha/flutter_number_captcha.dart';

class Random_captcha extends StatefulWidget {
  const Random_captcha({Key? key}) : super(key: key);

  @override
  State<Random_captcha> createState() => _Random_captchaState();
}

class _Random_captchaState extends State<Random_captcha> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Captcha'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () async {
                final bool test = await FlutterNumberCaptcha.show(
                  context,
                  titleText: 'Enter correct number',
                  placeholderText: 'Enter Number',
                  checkCaption: 'Check',
                  accentColor: Colors.blue,
                  invalidText: 'Invalid code',
                );
                // TODO: Do whatever you want with the result!
                print(test);
              },
              child: const Text('Open Default Captcha'),
            ),
            TextButton(
              onPressed: () async {
                final bool test = await FlutterNumberCaptcha.show(
                  context,
                  titleText: 'Enter Captcha',
                  placeholderText: 'Check Captcha',
                  checkCaption: 'Compare',
                  invalidText: "Wrong Captcha",
                  accentColor: Colors.red,
                );
                // TODO: Do whatever you want with the result!
                print(test);
              },
              child: const Text('Open Captcha - Customized'),
            ),
          ],
        ),
      ),
    );
  }
}
