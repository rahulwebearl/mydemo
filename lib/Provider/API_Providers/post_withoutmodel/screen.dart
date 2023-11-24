import 'package:apidata/Provider/API_Providers/post_withoutmodel/providerfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MYPostScreen extends StatefulWidget {
  @override
  _MYPostScreenState createState() => _MYPostScreenState();
}

class _MYPostScreenState extends State<MYPostScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<mypostPROVIDER>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API with Provider'),
      ),
      body: Consumer<mypostPROVIDER>(
        builder: (context, postProvider, _) {
          if (postProvider.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts[index];
                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                  // You can display other details as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
