import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class UsrPage extends StatefulWidget {
  const UsrPage({super.key});

  @override
  State<UsrPage> createState() => _UsrPageState();
}

class _UsrPageState extends State<UsrPage> {
  var mylist = [];
  fetchAPI() async {
    try {
      var link = "https://jsonplaceholder.typicode.com/users";
      var response = await http.get(Uri.parse(link));

      print(response);

      var jsonres = json.decode(response.body);

      print(jsonres);

      mylist = jsonres;

      setState(() {
        print(mylist);
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Data"),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          mylist[index]['id'],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red,
                                            ))
                                      ]),
                                );
                              },
                            );
                            print('Tap');
                          },
                          child: Text(mylist[index]['username'])),
                    ],
                  );
                },
              ));
  }
}
