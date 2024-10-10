import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'bsslapidemo.dcontroller.com';

  // Method to create a new user
  Future<Map<String, dynamic>> createUser({
    required String email,
    required String password,
    required String name,
    required String zcopny,
    required String copny,
    required String staffCode,
    required bool pwdExpiry,
  }) async {
    final url = Uri.https(baseUrl, '/api/Account/CreateUser');
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'email': email,
      'password': password,
      'name': name,
      'zcopny': zcopny,
      'copny': copny,
      'staffCode': staffCode,
      'pwdExpiry': pwdExpiry
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }

  // Method to login a user and save token
  Future<void> loginUser({
    required String email,
    required String password,
    required String module,
    required String branch,
  }) async {
    final url = Uri.https(baseUrl, '/api/Account/Login');
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'email': email,
      'password': password,
      'module': module,
      'branch': branch
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['token'] != null) {
          final token = data['token'];

          // Save token to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          print('Login successful. Token saved.');
        } else {
          throw Exception('Login failed: Token not found in response');
        }
      } else {
        // Provide more detailed error message
        final errorData = jsonDecode(response.body);
        throw Exception('Failed to login user: ${response.statusCode}, ${errorData['statusDescription']}');
      }
    } catch (e) {
      // Handle network or other errors
      throw Exception('An error occurred while logging in: $e');
    }
  }

  // Method to log out user and remove token
  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}

