import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void addCourse(Data courseData) {
    if (!state.selectedCourseIds.contains(courseData.id)) {
      state = state.copyWith(
        selectedCourseIds: [...state.selectedCourseIds, courseData.id!],
        totalCreditHours:
            state.totalCreditHours + courseData.attributes!.creditHours!,
      );
    }
  }

  void setMinMaxCredits(int minCredits, int maxCredits) {
    state = state.copyWith(
      minCreditHours: minCredits,
      maxCreditHours: maxCredits,
    );
  }
}

final courseProvider =
    StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  return CourseNotifier();
});
