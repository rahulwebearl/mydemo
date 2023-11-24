import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenPost extends StatefulWidget {
  const ScreenPost({super.key});

  @override
  State<ScreenPost> createState() => _ScreenPostState();
}

class _ScreenPostState extends State<ScreenPost> {
  List data = [];
  // String email = 'rahul12@gmail.com';
  String password = 'Rahul';
  TextEditingController emailss = TextEditingController();
  List<String> emails = [
    'rahul12@gmail.com',
    'arpan@gmail.com',
    'raja@gmail.com'
  ];
  List<String> passwords = [
    'Rahul',
    '123',
    'taja123',
  ];

  registerdata() async {
    var link = "https://jkswaramongo.onrender.com/user/login";

    var url = Uri.parse(link);
    var resbody = {'user_email': emailss.text, 'user_password': password};

    var jsonres = await http.post(
      url, body: resbody,
      // headers: { },
    );

    var jsonresbody = json.decode(jsonres.body);
    print(jsonresbody);

    data = jsonresbody['data'];

    setState(() {
      data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    registerdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registration"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TextField(
                  controller: emailss,
                ),
                // DropdownButton<String>(
                //   value: email,
                //   items: emails.map((email) {
                //     return DropdownMenuItem(value: email, child: Text(email));
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       email = value!;
                //     });
                //   },
                // ),
                SizedBox(),
                DropdownButton<String>(
                  value: password,
                  items: passwords.map((password) {
                    return DropdownMenuItem(
                        value: password, child: Text(password));
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
                      registerdata();
                    },
                    child: Text("Submit")),

                Text(data[index]['user_name'].toString())
              ],
            );
          },
        ));
  }
}
