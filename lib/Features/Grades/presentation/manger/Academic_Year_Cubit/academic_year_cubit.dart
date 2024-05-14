import 'package:eductionsystem/Features/Grades/data/repos/course_grade_repo.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Year_Cubit/academic_year_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicYearCubit extends Cubit<AcademicYearStates>{
  AcademicYearCubit() : super(InitialAcademicYearState());



  getAcademicYears()async{
    emit(LoadingAcademicYearState());
   try{
     var result=await CourseGradeRepo.fetchAcademicYear();
     emit(SuccessAcademicYearState(yearsList: result));

   }catch(ex){
     emit(FailureAcademicYearState(errMsg: ex.toString()));

   }

  }


}