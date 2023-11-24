import 'dart:convert';
import 'package:http/http.dart' as http;

class myPostService {
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['posts'];
      print(data);
      return data;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

/// step 1 create myPostService class 
/// step 2 create fetchPost function  fetch data from 'post' array.

