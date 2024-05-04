import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:8000/api/v1/student';

  Future<void> get() async {
    Uri url = Uri.parse("$_baseUrl/academicYears/1/semesters/1/courseGrades");
    http.Response response = await http.get(url, headers: {
      "Authorization":
          "Bearer 1|1G5vhBuuyBFWP0HVssjOatUcmkKfWTeVkjD9GSc63bcd111c"
    });
    // debugPrint('Response -- 999 ---${response.body}');
    if (response.statusCode == 200) {
      debugPrint('Response -- 999 ---${response.body}');
      // return jsonDecode(response.body);
    } else {
      debugPrint('Error${response.statusCode}');
    }
  }
}
// import 'package: dio/dio.dart';
// class ApiService {
//   final Dio dio;
//   final baseUrl = "https://www.googleapis.com/books/v1/";
//   ApiService(this._dio);
//   Future<Map<String, dynamic>> get({required String endpoint}) async {
//     var response = await _dio.get('$baseUrl$endPoint');
//     return response.data;
//   }
// }
