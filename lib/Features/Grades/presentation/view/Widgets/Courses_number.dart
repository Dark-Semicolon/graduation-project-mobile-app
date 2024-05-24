import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'package:flutter/material.dart';
import 'package:eductionsystem/Features/Grades/data/repos/course_grade_repo.dart';
import 'package:eductionsystem/Features/Grades/data/models/academic_year_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class TotalCoursesWidget extends StatelessWidget {
  const TotalCoursesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseGradeCubit, CourseGradeStates>(
      builder: (context, state) {
        if (state is SuccessCourseGradeState) {
          return Text('${state.coursesGradeList.length}',style: TextStyle(fontSize: 18,color: Colors.green));
        } else {
          return Text('--', style: TextStyle(fontSize:22,));
        }
      },
    );
  }
}
