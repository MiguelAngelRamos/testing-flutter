import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:testing_flutter/models/user.dart';

class UserService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers(http.Client client) async {
    final response = await client.get(Uri.parse(_baseUrl));

    if(response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);

      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}