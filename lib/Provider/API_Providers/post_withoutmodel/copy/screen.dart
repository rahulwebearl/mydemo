import 'package:apidata/Provider/API_Providers/post_withoutmodel/copy/provider.dart';
import 'package:apidata/Provider/API_Providers/post_withoutmodel/providerfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MydemoPost extends StatefulWidget {
  const MydemoPost({super.key});

  @override
  State<MydemoPost> createState() => _MydemoPostState();
}

class _MydemoPostState extends State<MydemoPost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Myproviderdemo>(context, listen: false).myprovider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my demo post"),
      ),
      body: Consumer<Myproviderdemo>(
        builder: (context, value, child) {
          if (value.mposts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: value.mposts.length,
              itemBuilder: (context, index) {
                final post = value.mposts[index];
                return ListTile(
                  title: Text(post['title']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
