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
      return response.body; // Returning token as a plain string
    } else {
      return null;
    }
  }

  Future<void> logoutUser(String token) async {
    final url = Uri.parse('$baseUrl/logout');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }

  Future<UserDataModel?> fetchUserData(String token) async {
    final url = Uri.parse('$baseUrl/api/v1/student/user');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return UserDataModel.fromJson(jsonData);
    } else {
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
