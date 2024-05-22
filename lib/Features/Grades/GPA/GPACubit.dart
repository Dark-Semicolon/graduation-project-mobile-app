import 'package:bloc/bloc.dart';
import 'GPAState.dart';

class GPACubit extends Cubit<GPAState> {
  GPACubit() : super(InitialGPAState());

  void setYearGPA(double gpa) {
    emit(YearGPAState(gpa));
  }

  void setSemesterGPA(double gpa) {
    emit(SemesterGPAState(gpa));
  }
}
