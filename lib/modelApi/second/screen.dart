import 'package:apidata/modelApi/second/api.dart';
import 'package:flutter/material.dart';
import 'package:apidata/modelApi/second/model.dart';
//Import the file containing the fetchPosts method

class Screenpd extends StatefulWidget {
  const Screenpd({Key? key}) : super(key: key);

  @override
  State<Screenpd> createState() => _ScreenpdState();
}

class _ScreenpdState extends State<Screenpd> {
  final apifetch _apiFetch = apifetch(); // Instance of your apifetch class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<Myproduct>>(
        future: _apiFetch.fetchPosts(), // Call your API method here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the data is being fetched
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if fetching data fails
            return Center(child: Text('Failed to load data'));
          } else if (snapshot.hasData) {
            // Display the data when available
            List<Myproduct> products = snapshot.data!;

            // Use ListView.builder to display a list of products
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                // Extract the details you want to display from Myproduct
                Myproduct product = products[index];
                return ListTile(
                  leading: Image.network(
                      product.image ?? ''), // Display product image
                  title: Text(product.title ?? ''), // Display product title
                  subtitle: Text(
                      'ID: ${product.id}, Rate: ${product.rating?.rate}'), // Display ID and Rating
                );
              },
            );
          } else {
            return Center(
                child: Text('No data available')); // Show a message if no data
          }
        },
      ),
    );
  }
}
