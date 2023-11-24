import 'package:apidata/modelApi/api.dart';
// import 'package:apidata/modelApi/model.dart';
import 'package:apidata/modelApi/modela.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
            future: ApiConfig.getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              } else if (snapshot.hasData) {
                final List<Product> porducts = snapshot.data!;
                return ListView.builder(
                    itemCount: porducts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(porducts[index].title),
                            Text(porducts[index].brand.toString()),
                            Text(porducts[index].description.toString()),
                            Container(
                                height:
                                    100, // Adjust this height as per your requirement
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: porducts[index].images.length,
                                    itemBuilder: (context, i) {
                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                            porducts[index].images[i]),
                                      );
                                    }))
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
