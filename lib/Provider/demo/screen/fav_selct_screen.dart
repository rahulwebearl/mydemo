import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorite.dart';

class Fav_Sel extends StatefulWidget {
  const Fav_Sel({super.key});

  @override
  State<Fav_Sel> createState() => _Fav_SelState();
}

class _Fav_SelState extends State<Fav_Sel> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<favouriteProvider>(context);
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected_Favourite"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Fav_Sel()));
              },
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          SizedBox(width: 20)
        ],
      ),
      body: ListView.builder(
          itemCount: provider.selected.length,
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
