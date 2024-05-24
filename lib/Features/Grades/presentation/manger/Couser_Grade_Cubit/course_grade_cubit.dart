import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:eductionsystem/Features/Grades/data/repos/course_grade_repo.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseGradeCubit extends Cubit<CourseGradeStates> {
  CourseGradeCubit() : super(IntialCourseGradeState());

  // Method to fetch student courses grade
  fetchStudentCoursesGrade({required int yearId, required int semesterId}) async {
    emit(LoadingCourseGradeState()); // Emit loading state
    try {
      // Fetch student courses grade from repository
      Map<String, dynamic> result =
      await CourseGradeRepo.fetchUserGrades(yearId: yearId, semesterId: semesterId);
      List<CourseModel> coursesGradeList = result['courses']; // Extract the list of CourseModel from the result
      emit(SuccessCourseGradeState(coursesGradeList: coursesGradeList)); // Emit success state with data
    } on Exception catch (ex) {
      emit(FailureCourseGradeState(errMsg: ex.toString())); // Emit failure state with error message
    }
  }
}
