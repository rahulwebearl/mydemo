import 'dart:convert';

import 'package:http/http.dart' as http;

class MyTryPost {
  Future<List<dynamic>> postfetch() async {
    final respose = await http.get(Uri.parse('https://dummyjson.com/posts'));

    if (respose.statusCode == 200) {
      final List<dynamic> data = json.decode(respose.body)['posts'];
      print(data);
      return data;
    } else {
      throw Exception("Failed to load");
    }
  }
}
