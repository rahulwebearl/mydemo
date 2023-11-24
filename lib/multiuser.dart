import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MultiUser extends StatefulWidget {
  const MultiUser({super.key});

  @override
  State<MultiUser> createState() => _MultiUserState();
}

class _MultiUserState extends State<MultiUser> {
  var datalist = [];

  apicall() async {
    try {
      var links = Uri.https('dummyjson.com', 'products');

      var res = await http.get(links);

      var jsresp = json.decode(res.body);

      print(jsresp);

      // datalist = jsresp["products"];
      datalist = jsresp["images"];
      print("imgg ${datalist}");
      setState(() {
        datalist;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicall();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: datalist.length,
        itemBuilder: (context, index) {
          // var ud = datalist[index]['products'];
          return ListTile(
            title: Text(datalist[index]['title'].toString()),
            leading: SizedBox(
              height: 100,
              width: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datalist[index]['images'].length,
                itemBuilder: (context, i) {
                  return Image.network(datalist[index]['images'][i]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
