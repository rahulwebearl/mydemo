import 'dart:convert';

import 'package:apidata/Provider/API_Providers/get_API/model.dart';
import 'package:http/http.dart' as http;

class ProviderServices {
  getAlldata() async {
    const url = "https://jsonplaceholder.typicode.com/posts/1/comments";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final post = json
          .map((e) => Welcome(
              id: e['id'],
              body: e['body'],
              email: e['email'],
              name: e['name'],
              postId: e['postId']))
          .toList();
      print(post);
      return post;
    }
  }
}
