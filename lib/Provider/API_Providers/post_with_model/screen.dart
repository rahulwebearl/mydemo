import 'package:apidata/Provider/API_Providers/post_with_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class DisplayScreenmodel extends StatefulWidget {
  @override
  _DisplayScreenmodelState createState() => _DisplayScreenmodelState();
}

class _DisplayScreenmodelState extends State<DisplayScreenmodel> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProviderModel>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Posts'),
      ),
      body: Consumer<PostProviderModel>(
        builder: (context, postProvider, child) {
          List<Posts> posts = postProvider.posts;
          if (posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                List<String> tages = posts[index].tags;
                String tagestext = tages.join(',');
                return Column(
                  children: [
                    ListTile(
                      title: Text(posts[index].title),
                      subtitle: Text(posts[index].body),
                      // Display other post details as needed
                    ),
                    Column(
                      children: [
                        Text(
                          "Tages : $tagestext",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
