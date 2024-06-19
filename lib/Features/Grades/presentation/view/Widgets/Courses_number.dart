import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class TotalCoursesWidget extends StatelessWidget {
  const TotalCoursesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseGradeCubit, CourseGradeStates>(
      builder: (context, state) {
        if (state is SuccessCourseGradeState) {
          return Text('${state.coursesGradeList.length}',style: const TextStyle(fontSize: 18,color: Colors.green));
        } else {
          return const Text('-', style: TextStyle(fontSize:22,));
        }
      },
    );
  }
}
