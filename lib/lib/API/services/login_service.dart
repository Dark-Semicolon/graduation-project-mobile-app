import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';


class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
