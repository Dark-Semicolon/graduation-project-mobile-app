import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../Data/Models/availble_courses.dart';
import '../Data/Models/course_selection.dart';

class CourseState {
  final List<int> selectedCourseIds;
  final int totalCreditHours;
  final int minCreditHours;
  final int maxCreditHours;
  final Map<int, AvailableCoursesData> courseDetails;
  final bool isLoading;
  final String? errorMessage;

  CourseState({
    required this.courseDetails,
    required this.selectedCourseIds,
    required this.totalCreditHours,
    required this.minCreditHours,
    required this.maxCreditHours,
    this.isLoading = false,
    this.errorMessage,
  });

  CourseState copyWith({
    List<int>? selectedCourseIds,
    int? totalCreditHours,
    int? minCreditHours,
    int? maxCreditHours,
    Map<int, AvailableCoursesData>? courseDetails,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CourseState(
      selectedCourseIds: selectedCourseIds ?? this.selectedCourseIds,
      totalCreditHours: totalCreditHours ?? this.totalCreditHours,
      minCreditHours: minCreditHours ?? this.minCreditHours,
      maxCreditHours: maxCreditHours ?? this.maxCreditHours,
      courseDetails: courseDetails ?? this.courseDetails,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class CourseNotifier extends StateNotifier<CourseState> {
  CourseNotifier()
      : super(CourseState(
            selectedCourseIds: [],
            totalCreditHours: 0,
            minCreditHours: 0,
            maxCreditHours: 0,
            courseDetails: {}));

  bool canAddCourse(AvailableCoursesData courseData) {
    final newTotalCreditHours =
        state.totalCreditHours + courseData.attributes!.creditHours!;
    return newTotalCreditHours <= state.maxCreditHours;
  }

  bool addCourse(AvailableCoursesData courseData) {
    if (state.selectedCourseIds.contains(courseData.id)) {
      return false; // Indicate that the course is already added
    }
    if (!canAddCourse(courseData)) {
      return false;
    }

    final updatedCourseDetails =
        Map<int, AvailableCoursesData>.from(state.courseDetails);
    updatedCourseDetails[courseData.id!] = courseData;

    state = state.copyWith(
      selectedCourseIds: [...state.selectedCourseIds, courseData.id!],
      totalCreditHours:
          state.totalCreditHours + courseData.attributes!.creditHours!,
      courseDetails: updatedCourseDetails,
    );
    return true;
  }

  void setMinMaxCredits(int minCredits, int maxCredits) {
    state = state.copyWith(
      minCreditHours: minCredits,
      maxCreditHours: maxCredits,
    );
  }

  bool isMinCreditHoursReached() {
    return state.totalCreditHours >= state.minCreditHours;
  }

  Future<String> saveSelectedCourses() async {
    final token = await TokenManager.getToken();
    final response = await http.post(
      Uri.parse(
          '${MainApiConstants.baseUrl}${MainApiConstants.courseSelectionEnrollments}'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'courses': state.selectedCourseIds}),
    );

    if (response.statusCode == 200) {
      return 'Courses saved successfully';
    } else {
      throw Exception('Failed to save courses');
    }
  }

  Future<void> fetchSelectedCourses() async {
    final token = await TokenManager.getToken();
    final response = await http.get(
      Uri.parse(
          '${MainApiConstants.baseUrl}${MainApiConstants.courseSelectionEnrollments}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> courseIdListJson = jsonDecode(response.body);
      print('Course ID List JSON: $courseIdListJson'); // Debug print

      if (courseIdListJson is List<dynamic>) {
        final selectedCourseIds = courseIdListJson.cast<int>();
        final availableCourses =
            await getAvailableCourses(); // Fetch or get the available courses data

        // Filter the available courses based on the selected course IDs
        final filteredCourses = availableCourses
            .where((course) => selectedCourseIds.contains(course.id))
            .toList();

        final courseDetails = {
          for (var course in filteredCourses) course.id!: course
        };

        state = state.copyWith(
          selectedCourseIds: selectedCourseIds,
          courseDetails: courseDetails,
          totalCreditHours: filteredCourses.fold(
            0,
            (sum, course) => sum! + course.attributes!.creditHours!,
          ),
        );
      } else {
        throw Exception('Invalid JSON structure');
      }
    } else {
      throw Exception('Failed to load enrolled courses');
    }
  }

  Future<List<AvailableCoursesData>> getAvailableCourses() async {
    final token = await TokenManager.getToken();
    const url =
        '${MainApiConstants.baseUrl}/api/v1/student/courseSelection/availableCourses'; // Update this URL to the correct endpoint if necessary
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('getAvailableCourses request URL: $url'); // Debug print
    print(
        'getAvailableCourses response status: ${response.statusCode}'); // Debug print
    print('getAvailableCourses response body: ${response.body}'); // Debug print

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      if (responseJson is Map<String, dynamic> &&
          responseJson.containsKey('data')) {
        final List<dynamic> courseListJson = responseJson['data'];
        return courseListJson
            .map((json) => AvailableCoursesData.fromJson(json))
            .toList();
      } else {
        throw Exception('Invalid JSON structure: expected "data" key');
      }
    } else {
      throw Exception('Failed to load available courses');
    }
  }

  void removeCourse(int courseId) {
    final courseData = state.courseDetails[courseId];
    if (courseData != null) {
      final updatedCourseDetails =
          Map<int, AvailableCoursesData>.from(state.courseDetails);
      updatedCourseDetails.remove(courseId);

      state = state.copyWith(
        selectedCourseIds:
            state.selectedCourseIds.where((id) => id != courseId).toList(),
        totalCreditHours:
            state.totalCreditHours - courseData.attributes!.creditHours!,
        courseDetails: updatedCourseDetails,
      );
    }
  }

  Future<CourseSelection> fetchCourseSelection() async {
    final token = await TokenManager.getToken();
    final response = await http.get(
      Uri.parse(
          '${MainApiConstants.baseUrl}${MainApiConstants.courseSelection}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final courseSelectionJson = jsonDecode(response.body);
      return CourseSelection.fromJson(courseSelectionJson);
    } else {
      throw Exception('Failed to fetch course selection details');
    }
  }

  Future<void> navigateBasedOnCourseSelection(BuildContext context) async {
    try {
      await fetchSelectedCourses();
      final courseSelection = await fetchCourseSelection();
      final endDate = DateTime.parse(courseSelection.data!.attributes!.endAt!);

      print('Selected Courses: ${state.selectedCourseIds}');
      print('Course Selection End Date: $endDate');

      if (state.selectedCourseIds.isNotEmpty) {
        if (DateTime.now().isBefore(endDate)) {
          print(
              'Navigating to SelectedCoursesScreen with modification allowed');
          GoRouter.of(context).go('/SelectedCoursesScreen',
              extra: {'endDate': endDate, 'canModify': true});
        } else {
          print(
              'Navigating to SelectedCoursesScreen with modification not allowed');
          GoRouter.of(context).go('/SelectedCoursesScreen',
              extra: {'endDate': endDate, 'canModify': false});
        }
      } else {
        if (DateTime.now().isBefore(endDate)) {
          print('Navigating to CoursesScreen');
          GoRouter.of(context).go('/CoursesScreen');
        } else {
          print('Navigating to ContactAdminScreen');
          GoRouter.of(context).go('/ContactAdminScreen');
        }
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}

final courseProvider =
    StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  return CourseNotifier();
});
