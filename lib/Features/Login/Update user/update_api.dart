import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../../../Data/API/Services/api_constant.dart';
import 'PatchUseDataModel.dart';

class UserApiService {
  static const String _baseUrl = ApiConstants.baseUrl;

  static Future<dynamic> multiPartRequestForDetection({
    required String endPoint,
    Map<String, String>? header,
    Map<String, String>? body,
    required File image,
  }) async {
    try {
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var length = await image.length();
      var uri = Uri.parse("$_baseUrl/user");
      var request = http.MultipartRequest('PATCH', uri);

      // Add headers
      request.headers.addAll(header ?? {});

      // Add body fields
      if (body != null) {
        request.fields.addAll(body);
      }

      // Add the image file
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();
      final res = await http.Response.fromStream(response);

      // Print and handle the response
      print('Response body: ${res.body}');
      if (res.statusCode == 200 || res.statusCode == 201) {
        return jsonDecode(res.body);
      } else {
        print('Error status code: ${res.statusCode}');
        print('Error response: ${res.body}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e');
      return null;
    }
  }

  Future<void> updateUserData(PatchUseData data, {File? image}) async {
    final token = await TokenManager.getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    var body = data.toJson().map((key, value) => MapEntry(key, value.toString()));

    var endpoint = MainApiConstants.userDataEndpoint;
    var url = Uri.parse("$_baseUrl/user");
    print("Request URL: $url"); // Print full URL for debugging

    if (image != null) {
      await multiPartRequestForDetection(
        endPoint: endpoint,
        header: headers,
        body: body,
        image: image,
      );
    } else {
      var response = await http.put(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          print('User data updated successfully. Response: {}');
        } else {
          print('User data updated successfully. Response: ${response.body}');
        }
      } else {
        print('Failed to update user data. Status code: ${response.statusCode},'
            ' Response: ${response.body}');
        throw Exception('Failed to update user data. Status code: '
            '${response.statusCode}, Response: ${response.body}');
      }
    }
  }
}
