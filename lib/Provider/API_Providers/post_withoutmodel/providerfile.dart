import 'package:apidata/Provider/API_Providers/post_withoutmodel/servicefile.dart';
import 'package:flutter/material.dart';

class mypostPROVIDER extends ChangeNotifier {
  final myPostService _postService = myPostService();
  List<dynamic> posts = [];

  Future<void> fetchPosts() async {
    try {
      posts = await _postService.fetchPosts();
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }
}
// step 1 extend with ChangeNotifier  
// step 2 create variable name of service use _private 
// step 3 create empty list for get data 
// step 4 create function in this function use list  use previous varible with api function
// step 5 add notifylistner