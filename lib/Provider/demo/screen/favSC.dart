import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorite.dart';
import 'fav_selct_screen.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  List<int> selected = [];
  @override
  Widget build(BuildContext context) {
// final provider =  Provider.of<favouriteProvider>(context);
    print("object2");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Fav_Sel()));
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Consumer<favouriteProvider>(
                builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  if (value.selected.contains(index)) {
                    value.removeitem(index);
                  } else {
                    value.additem(index);
                  }
                },
                title: Text("Index is " + index.toString()),
                leading: Text(index.toString()),
                trailing: Icon(value.selected.contains(index)
                    ? Icons.favorite_outlined
                    : Icons.favorite_border),
              );
            });
          }),
    );
  }
}
