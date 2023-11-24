// post_provider.dart (updated)

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      _posts = jsonData.map((data) => Post.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Function to create a new post
  Future<void> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: json.encode({'title': title, 'body': body}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // Assuming the server returns the created post in the response
      final Map<String, dynamic> responseData = json.decode(response.body);
      final newPost = Post.fromJson(responseData);
      _posts.insert(0,
          newPost); // Insert the newly created post at the beginning of the list
      notifyListeners();
    } else {
      throw Exception('Failed to create post');
    }
  }
}
