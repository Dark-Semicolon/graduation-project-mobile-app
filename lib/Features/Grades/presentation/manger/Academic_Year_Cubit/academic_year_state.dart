import 'package:eductionsystem/Features/Grades/data/models/academic_year_model.dart';

abstract class AcademicYearStates {}

class InitialAcademicYearState extends AcademicYearStates {}

class SuccessAcademicYearState extends AcademicYearStates {
  final List<AcademicYearModel> yearsList;

  SuccessAcademicYearState({required this.yearsList});
}

class LoadingAcademicYearState extends AcademicYearStates {}

class FailureAcademicYearState extends AcademicYearStates {
  final String errMsg;

  FailureAcademicYearState({required this.errMsg});
}
