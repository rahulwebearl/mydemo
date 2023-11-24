import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}


/// step 1 Create service file for api call function 
/// step 2 in api call using list for storing data
/// step 3 now create new page for provider function