import 'dart:convert';

import 'package:eductionsystem/Data/API/Services/api_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> get({required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams}) async {
    Uri url = Uri.parse("${ApiConstants.baseUrl}$endPoint");

    Map<String, String> header = {};
    Map<String, dynamic> queryParameters = {};
    header.addEntries(headers?.entries ?? {});
    queryParameters.addEntries(queryParams?.entries ?? {});

    http.Response response = await http.get(
      url.replace(queryParameters: queryParameters),
      headers: headers,
    );

    // error handel

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      debugPrint('Successful Response $data');
      return jsonDecode(response.body);
    } else {
      debugPrint('There was an Error ::  ${response.statusCode}');
      throw Exception('There was an Error ::  ${response.statusCode}');
    }
  }
}