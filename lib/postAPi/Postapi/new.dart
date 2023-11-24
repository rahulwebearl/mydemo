import 'dart:convert';

import 'package:apidata/postAPi/Postapi/display.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostdataScreen extends StatefulWidget {
  const PostdataScreen({super.key});

  @override
  State<PostdataScreen> createState() => _PostdataScreenState();
}

class _PostdataScreenState extends State<PostdataScreen> {
  TextEditingController email = TextEditingController();
  String password = 'Rahul';
  List<String> selcpasswords = ['Rahul', '123', 'taja123'];

  passdata() async {
    var link = "https://jkswaramongo.onrender.com/user/login";

    var url = Uri.parse(link);

    var resbody = {'user_email': email.text, 'user_password': password};

    var jsores = await http.post(url, body: resbody);

    var jsonres1 = json.decode(jsores.body);
    print(jsonres1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Registration"),
      ),
      body: Column(children: [
        TextField(
          controller: email,
        ),
        SizedBox(),
        DropdownButton<String>(
          value: password,
          items: selcpasswords.map((pass) {
            return DropdownMenuItem(value: pass, child: Text(pass));
          }).toList(),
          onChanged: (value) {
            setState(() {
              password = value!;
            });
          },
        ),
        SizedBox(),
        ElevatedButton(
            onPressed: () {
              passdata();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Displaydata(name: email.text, password: password),
                  ));

              // print('pressed');
            },
            child: Text("Submit"))
      ]),
    );
  }
}
