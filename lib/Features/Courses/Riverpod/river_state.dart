import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../Data/Models/availble_courses.dart';

class CourseState {
  final List<int> selectedCourseIds;
  final int totalCreditHours;
  final int minCreditHours;
  final int maxCreditHours;
  final Map<int, AvailableCoursesData> courseDetails;

  CourseState({
    required this.courseDetails,
    required this.selectedCourseIds,
    required this.totalCreditHours,
    required this.minCreditHours,
    required this.maxCreditHours,
  });

  CourseState copyWith({
    List<int>? selectedCourseIds,
    int? totalCreditHours,
    int? minCreditHours,
    int? maxCreditHours,
    Map<int, AvailableCoursesData>? courseDetails,
  }) {
    return CourseState(
      selectedCourseIds: selectedCourseIds ?? this.selectedCourseIds,
      totalCreditHours: totalCreditHours ?? this.totalCreditHours,
      minCreditHours: minCreditHours ?? this.minCreditHours,
      maxCreditHours: maxCreditHours ?? this.maxCreditHours,
      courseDetails: courseDetails ?? this.courseDetails,
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

  Future<void> saveSelectedCourses() async {
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
      print('Courses saved successfully');
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
      final List<dynamic> courseListJson = jsonDecode(response.body)['courses'];
      final courses = courseListJson
          .map((json) => AvailableCoursesData.fromJson(json))
          .toList();

      final selectedCourseIds = courses.map((course) => course.id!).toList();
      final courseDetails = {for (var course in courses) course.id!: course};

      state = state.copyWith(
        selectedCourseIds: selectedCourseIds,
        courseDetails: courseDetails,
        totalCreditHours: courses.fold(
            0, (sum, course) => sum! + course.attributes!.creditHours!),
      );
    } else {
      throw Exception('Failed to load enrolled courses');
    }
  }
}

final courseProvider =
    StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  return CourseNotifier();
});
