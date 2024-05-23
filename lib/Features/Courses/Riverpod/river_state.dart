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

  CourseState({
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
  }) {
    return CourseState(
      selectedCourseIds: selectedCourseIds ?? this.selectedCourseIds,
      totalCreditHours: totalCreditHours ?? this.totalCreditHours,
      minCreditHours: minCreditHours ?? this.minCreditHours,
      maxCreditHours: maxCreditHours ?? this.maxCreditHours,
    );
  }
}

class CourseNotifier extends StateNotifier<CourseState> {
  CourseNotifier()
      : super(CourseState(
      selectedCourseIds: [],
      totalCreditHours: 0,
      minCreditHours: 0,
      maxCreditHours: 0));

  bool canAddCourse(Data courseData) {
    final newTotalCreditHours = state.totalCreditHours + courseData.attributes!.creditHours!;
    return newTotalCreditHours <= state.maxCreditHours;
  }

  bool addCourse(Data courseData) {
    if (state.selectedCourseIds.contains(courseData.id)) {
      return false;
    }
    if (!canAddCourse(courseData)) {
      return false;
    }

    state = state.copyWith(
      selectedCourseIds: [...state.selectedCourseIds, courseData.id!],
      totalCreditHours: state.totalCreditHours + courseData.attributes!.creditHours!,
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
      Uri.parse('${MainApiConstants.baseUrl}${MainApiConstants.courseSelectionEnrollments}'),
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
}

final courseProvider = StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  return CourseNotifier();
});
