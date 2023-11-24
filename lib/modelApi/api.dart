import 'dart:convert';
import 'package:apidata/modelApi/products/model.dart';
import 'package:apidata/modelApi/modela.dart';
import 'package:http/http.dart' as http;

class ApiConfig {
  static const mainUrl = 'https://dummyjson.com/';
  static const product = 'products';

  static Future<List<Product>> getAllProducts() async {
    var response = await http.get(Uri.parse(mainUrl + product));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> allProducts = data['products'];
      return allProducts.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed load to products');
    }
  }
}
