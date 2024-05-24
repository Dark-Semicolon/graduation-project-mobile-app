import 'package:meta/meta.dart';

@immutable
abstract class GPAState {}

class InitialGPAState extends GPAState {}

class YearGPAState extends GPAState {
  final double yearGPA;

  YearGPAState(this.yearGPA);
}

class SemesterGPAState extends GPAState {
  final double semesterGPA;

  SemesterGPAState(this.semesterGPA);
}
