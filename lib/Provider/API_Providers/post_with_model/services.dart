import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class PostServiceModel {
  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['posts'];
      print(jsonList);
      return jsonList.map((json) => Posts.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
