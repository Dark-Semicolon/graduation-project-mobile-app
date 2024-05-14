import 'package:eductionsystem/Features/Grades/data/models/academic_semester_model.dart';

abstract class AcademicSemseterStates{}




class InitialAcademicSemseterState extends AcademicSemseterStates{}
class SuccessAcademicSemseterState extends AcademicSemseterStates{
  final List<AcademicSemesterModel> semesterList;

  SuccessAcademicSemseterState({required this.semesterList});
}
class LoadingAcademicSemseterState extends AcademicSemseterStates{}
class FailureAcademicSemseterState extends AcademicSemseterStates{
  final String errMsg;

  FailureAcademicSemseterState({required this.errMsg});
}