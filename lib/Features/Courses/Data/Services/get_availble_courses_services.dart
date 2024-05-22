import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../Models/availble_courses.dart';
import '../Models/course_selection.dart';

class ApiService {
  static const String _baseUrl = MainApiConstants.baseUrl;
  static const String _availableCoursesEndpoint =
      MainApiConstants.courseSelectionAvailableCourses;
  static const String _courseSelectionEndpoint = MainApiConstants.courseSelection;

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

  Future<CourseSelection> fetchCourseSelection() async {
    final response = await http.get(
      Uri.parse('$_baseUrl$_courseSelectionEndpoint'),
      headers: {
        'Authorization': 'Bearer ${await TokenManager.getToken()}',
      },
    );

    if (response.statusCode == 200) {
      return CourseSelection.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load course selection');
    }
  }
}
