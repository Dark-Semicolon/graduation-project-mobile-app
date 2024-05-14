import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../Models/availble_courses.dart';

class ApiService {
  static const String _baseUrl = ApiConstants.baseUrl;
  static const String _availableCoursesEndpoint = ApiConstants.courseSelectionAvailableCourses;

  Future<AvailableCourses> fetchAvailableCourses() async {
    final response = await http.get(
      Uri.parse('$_baseUrl$_availableCoursesEndpoint'),
      headers: {
        'Authorization': 'Bearer ${await TokenManager.getToken()}',
      },
    );

    if (response.statusCode == 200) {
      return AvailableCourses.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load available courses');
    }
  }
}
