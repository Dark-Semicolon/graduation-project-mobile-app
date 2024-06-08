import 'package:eductionsystem/Features/Grades/data/repos/course_grade_repo.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semseter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicSemsterCubit extends Cubit<AcademicSemseterStates>{
  AcademicSemsterCubit() : super(InitialAcademicSemseterState());



  getAcademicSemester({required int id})async{
    emit(LoadingAcademicSemseterState());
    try{
      var result=await CourseGradeRepo.fetchAcademicSemester(id:id );
      emit(SuccessAcademicSemseterState(semesterList: result));

    }catch(ex){
      emit(FailureAcademicSemseterState(errMsg: ex.toString()));

    }

  }


}