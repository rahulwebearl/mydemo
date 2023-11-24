import 'package:apidata/modelApi/products/api.dart';
import 'package:apidata/modelApi/products/model.dart';
import 'package:flutter/material.dart';

class UserPDscreen extends StatefulWidget {
  const UserPDscreen({Key? key}) : super(key: key);

  @override
  State<UserPDscreen> createState() => _UserPDscreenState();
}

class _UserPDscreenState extends State<UserPDscreen> {
  late Future<List<UserPd>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = apifetch()
        .fetchPosts(); // Replace 'apifetch()' with your actual class instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Products'),
      ),
      body: FutureBuilder<List<UserPd>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // }
          else if (snapshot.hasData) {
            // Data fetched successfully, display it
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final post2 = post.products![index];
                return ListTile(
                  title: Text(post2.title ?? 'No Title'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${post2.price ?? 0}'),
                      Text(post2.description ?? 'No Description'),
                      // Display image or thumbnail here, you might use Image.network or Image.asset
                      // Example: Image.network(post.thumbnail ?? 'https://placeholder.com/image.jpg'),
                    ],
                  ),
                );
              },
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
