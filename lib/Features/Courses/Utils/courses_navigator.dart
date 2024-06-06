/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Data/API/Const/end_points.dart';
import '../../../Data/API/Token/token_manager.dart';
import '../Data/Models/availble_courses.dart';
import '../Presentation/View/Widgets/course_bar.dart';
import '../Presentation/View/selected_courses.dart';

class CourseNavigation {
  static Future<void> navigateToCourses(BuildContext context) async {
    final token = await TokenManager.getToken();

    // Fetch the enrolled courses
    final enrolledCoursesResponse = await http.get(
      Uri.parse(
          '${MainApiConstants.baseUrl}${MainApiConstants.courseSelectionEnrollments}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (enrolledCoursesResponse.statusCode == 200) {
      final dynamic jsonData = jsonDecode(enrolledCoursesResponse.body);
      print(jsonData['courses']); // Check the structure of the courses data

      final List<dynamic> enrolledCoursesList = jsonData['courses'];
      final enrolledCourses = enrolledCoursesList
          .map((json) => AvailableCoursesData.fromJson(json))
          .toList();

      // Fetch course selection details to get min and max credit hours
      final courseSelectionResponse = await http.get(
        Uri.parse(
            '${MainApiConstants.baseUrl}${MainApiConstants.courseSelection}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (courseSelectionResponse.statusCode == 200) {
        final courseSelectionData =
            jsonDecode(courseSelectionResponse.body)['data']['attributes'];
        final int minCredits =
            int.parse(courseSelectionData['minCreditHours'].toString());
        final int maxCredits =
            int.parse(courseSelectionData['maxCreditHours'].toString());
        final String endDateString = courseSelectionData['endDate'].toString();
        final DateTime endDate = DateTime.parse(endDateString);

        // Calculate total credit hours of enrolled courses
        final num totalCreditHours = enrolledCourses.fold<num>(
            0, (sum, course) => sum + (course?.attributes?.creditHours ?? 0));

        // Check if total credit hours are above the minimum
        if (totalCreditHours >= minCredits) {
          // Navigate to selected courses screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectedCoursesScreen(
                endDate: endDate,
                canModify: DateTime.now().isBefore(endDate),
              ),
            ),
          );
        } else {
          // Navigate to courses enrollment screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CoursesList(),
            ),
          );
        }
      } else {
        throw Exception('Failed to fetch course selection details');
      }
    } else {
      throw Exception('Failed to fetch enrolled courses');
    }
  }
}
*/
