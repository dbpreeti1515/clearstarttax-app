// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String apiUrl = 'https://api.example.com/user';
//
//   Future<User> fetchUserData() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);
//       return User.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to load user data');
//     }
//   }
// }
