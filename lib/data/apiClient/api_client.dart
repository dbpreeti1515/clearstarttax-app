import 'package:preeti_s_application3/core/app_export.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final String authToken;

  ApiService({
    required this.baseUrl,
    required this.authToken,
  });

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final headers = await _getHeaders();

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Successful response, parse and return the data
      return json.decode(response.body);
    } else {
      // Handle error, you can throw an exception or return an error response
      throw Exception('Failed to load data');
    }
  }
}
class ApiClient extends GetConnect {}