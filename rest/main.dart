import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}


Future<void> fetchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts'); 

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); 
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RestAp(),
    );
  }
}

class RestAp extends StatelessWidget {
  const RestAp({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('REST API Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Fetch Data'),
          ),
        ),
      );
  }
}


