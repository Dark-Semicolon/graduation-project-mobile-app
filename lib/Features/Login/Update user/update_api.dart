import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import 'patch_user_data_model.dart';

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
      final responseBody = jsonDecode(response.body);
      final errorMessage = responseBody['message'] ?? 'Unknown error';
      if (responseBody['errors'] != null) {
        final errors = responseBody['errors']
            .entries
            .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
            .join('\n');
        throw Exception('$errorMessage\n$errors');
      } else {
        throw Exception(errorMessage);
      }
    }
  }
}
