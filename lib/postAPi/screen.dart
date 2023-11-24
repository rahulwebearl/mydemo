import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostApiDemo extends StatefulWidget {
  @override
  _PostApiDemoState createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  // Define the API endpoint you want to send the POST request to
  final String apiUrl = 'http://13.127.94.213:3000/user';

  Future<void> sendPostRequest() async {
    // Data to be sent in the request body
    Map<String, dynamic> data = {
      "name": "manav",
      "email_address": "manav@gmail.com",
      "phone": "8758585251",
      "password": "123456",
      "gender": "male",
      "state": "gujrat",
      "city": "ahmedabad",
      "address": "satapda"
      // Add any other key-value pairs needed by your API
    };

    // Convert the data to JSON format
    String requestBody = json.encode(data);

    // Make the POST request
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: requestBody, // Pass the JSON formatted data in the request body
      );

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Request successful, you can handle the response data here
        print('Response: ${response.body}');
      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during the request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sendPostRequest(); // Call the function to make the POST request
          },
          child: Text('Send POST Request'),
        ),
      ),
    );
  }
}
