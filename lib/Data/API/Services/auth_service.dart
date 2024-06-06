import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/auth_data.dart';
import '../Models/user_data.dart';

class AuthApi {
  final String baseUrl;

  AuthApi({required this.baseUrl});

  Future<String?> loginUser(AuthDataModel authData) async {
    final url = Uri.parse('$baseUrl/api/v1/student/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(authData.toJson()),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 422) {
      return 'These credentials do not match our records';
    } else if (response.statusCode == 237) {
      return 'Please enter your password';
    } else if (response.statusCode == 247) {
      return 'The email field is required';
    } else {
      if (response.headers['content-type']?.contains('html') ?? false) {
        return 'Failed to login. Server returned an unexpected response.';
      }
      return 'Failed to login: ${response.body}';
    }
  }

  Future<void> logoutUser(String token) async {
    final url = Uri.parse('$baseUrl/logout');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout: ${response.body}');
    }
  }

  Future<UserDataModel?> fetchUserData(String token) async {
    final url = Uri.parse(
        '$baseUrl/api/v1/student/user?includeGpa=true&load=gpa,failedCoursesCount');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;
      print('API Response: $responseBody'); // Debug statement
      final jsonData = jsonDecode(responseBody);
      print('User data fetched: $jsonData'); // Debug statement
      return UserDataModel.fromJson(jsonData);
    } else {
      print('Failed to load user data: ${response.body}');
      throw Exception('Failed to load user data');
    }
  }
}

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<String?> loginUser(AuthDataModel authData) async {
    return await authApi.loginUser(authData);
  }

  Future<void> logoutUser(String token) async {
    return await authApi.logoutUser(token);
  }

  Future<UserDataModel?> fetchUserData(String token) async {
    return await authApi.fetchUserData(token);
  }
}
