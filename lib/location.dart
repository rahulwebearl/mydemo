import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loctions extends StatefulWidget {
  const Loctions({super.key});

  @override
  State<Loctions> createState() => _LoctionsState();
}

class _LoctionsState extends State<Loctions> {
  var localist = [];

  location() async {
    try {
      var link = Uri.https("jsonplaceholder.typicode.com", "users");

      var res = await http.get(link);

      var jsres = json.decode(res.body);

      print(jsres);

      localist = jsres;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: localist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(localist[index]['name'].toString()),
              Center(
                  child:
                      Text(localist[index]["address"]['geo']['lat'].toString()))
            ],
          );
        },
      ),
    );
  }
}
