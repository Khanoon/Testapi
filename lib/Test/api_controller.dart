// ignore_for_file: unnecessary_null_comparison

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {
  static Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://apirov.vercel.app/hero'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data[0]['name']);
      return data;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

}
