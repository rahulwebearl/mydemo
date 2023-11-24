import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

class PostProviderModel extends ChangeNotifier {
  List<Posts> _posts = [];
  final PostServiceModel _postService = PostServiceModel();

  List<Posts> get posts => _posts;

  Future<void> fetchPosts() async {
    try {
      _posts = await _postService.fetchPosts();
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }
}
