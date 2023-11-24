// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class Postdisplay extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final String title = _titleController.text;
              final String body = _bodyController.text;

              if (title.isNotEmpty && body.isNotEmpty) {
                postProvider.createPost(title, body);
                _titleController.clear();
                _bodyController.clear();
              }
            },
            child: Text('Create Post'),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 600,
            child: FutureBuilder(
              future: postProvider.fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                } else {
                  return ListView.builder(
                    itemCount: postProvider.posts.length,
                    itemBuilder: (context, index) {
                      final post = postProvider.posts[index];
                      return ListTile(
                        title: Text(
                          post.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(post.body),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
