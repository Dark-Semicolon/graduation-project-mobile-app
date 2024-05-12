
import 'package:eductionsystem/Features/Grades/data/models/course_model.dart';

abstract class CourseGradeStates{}

class IntialCourseGradeState extends CourseGradeStates{}
class SuccessCourseGradeState extends CourseGradeStates{
  final List<CourseModel> coursesGradeList ;

  SuccessCourseGradeState({required this.coursesGradeList});

}
class LoadingCourseGradeState extends CourseGradeStates{}
class FailureCourseGradeState extends CourseGradeStates{
  final String errMsg;

  FailureCourseGradeState({required this.errMsg});
}
