import 'dart:convert';

import 'package:apidata/modelApi/products/model.dart';
import 'package:apidata/modelApi/second/model.dart';
import 'package:http/http.dart' as http;

class apifetch {
  Future<List<UserPd>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<UserPd> posts = data.map((e) => UserPd.fromJson(e)).toList();

      print(posts);

      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
