import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';
import 'package:eductionsystem/Features/Grades/data/repos/course_grade_repo.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseGradeCubit extends Cubit<CourseGradeStates> {
  CourseGradeCubit() : super(IntialCourseGradeState());

  fetchStudentCoursesGrade({required int yearId,required int semesterId}) async {
    emit(LoadingCourseGradeState());
    try {
      List<CourseModel> coursesGradeList =
          await CourseGradeRepo.fetchUserGrades(yearId: yearId,semesterId:semesterId );
      emit(SuccessCourseGradeState(coursesGradeList: coursesGradeList));
    } on Exception catch (ex) {
      emit(FailureCourseGradeState(errMsg: ex.toString()));
    }
  }
}
