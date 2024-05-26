import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import 'PatchUseDataModel.dart';

class UserApiService {
  static const String _baseUrl = MainApiConstants.baseUrl;

  Future<void> updateUserData(PatchUseData data) async {
    final token = await TokenManager.getToken();
    final response = await http.patch(
      Uri.parse('$_baseUrl${MainApiConstants.userDataEndpoint}'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user data');
    }
  }
}
