import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreApi extends StatefulWidget {
  const StoreApi({super.key});

  @override
  State<StoreApi> createState() => _StoreApiState();
}

class _StoreApiState extends State<StoreApi> {
  var storlist = [];

  storAPI() async {
    try {
      var link = Uri.https('fakestoreapi.com', 'products');

      var res = await http.get(link);

      var jsres = json.decode(res.body);

      print(jsres);

      storlist = jsres;
      print(storlist);

      setState(() {
        storlist;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storAPI();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: storlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(storlist[index]['title'].toString()),
            subtitle: Text(
              storlist[index]['description'].toString(),
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            leading: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(storlist[index]['image'] ?? "IMG"),
            ),
            trailing: Text(storlist[index]['rating']['rate'].toString()),
          );
        },
      ),
    );
  }
}
