import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http; // Added import

import '../../../../Data/API/Const/end_points.dart';
import '../../../../Data/API/Token/token_manager.dart';
import '../Data/Models/availble_courses.dart';
import '../Data/Models/course_selection.dart';
import '../Data/Services/get_availble_courses_services.dart';

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
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CourseNotifier extends StateNotifier<CourseState> {
  final CoursesApiService apiService;

  CourseNotifier(this.apiService)
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
      throw Exception('Failed to load enrolled courses');
    }
  }

  Future<List<AvailableCoursesData>> getAvailableCourses() async {
    final response = await apiService.fetchAvailableCourses();
    return response.data!;
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
    return await apiService.fetchCourseSelection();
  }

  Future<String> determineNavigationScreen() async {
    try {
      await fetchSelectedCourses();
      final courseSelection = await fetchCourseSelection();
      final endDate = DateTime.parse(courseSelection.data!.attributes!.endAt!);

      if (state.selectedCourseIds.isEmpty && DateTime.now().isBefore(endDate)) {
        // No course IDs selected and end date hasn't come
        return '/CoursesScreen';

      } else if (state.selectedCourseIds.isNotEmpty &&
          DateTime.now().isBefore(endDate)) {
        // Course IDs selected and end date hasn't come
        return '/SelectedCoursesScreen';
      } else if (state.selectedCourseIds.isNotEmpty &&
          DateTime.now().isAfter(endDate)) {
        // Course IDs selected and end date has come
        return '/SelectedCoursesScreenWithoutEdit';
      } else if (state.selectedCourseIds.isEmpty &&
          DateTime.now().isAfter(endDate)) {
        // No course IDs selected and end date has come
        return '/ContactAdminScreen';
      } else {
        throw Exception('Unknown navigation state');
      }
    } catch (e) {
      throw Exception('Error determining navigation screen: $e');
    }
  }
}

final courseProvider =
    StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  final apiService = CoursesApiService();
  return CourseNotifier(apiService);
});
