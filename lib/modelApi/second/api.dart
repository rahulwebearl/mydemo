import 'dart:convert';

import 'package:apidata/modelApi/second/model.dart';
import 'package:http/http.dart' as http;

class apifetch {
  Future<List<Myproduct>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Myproduct> posts =
          data.map((json) => Myproduct.fromJson(json)).toList();
      print(posts);

      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
