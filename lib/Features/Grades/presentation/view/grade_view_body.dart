import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semester_cubit.dart';
import 'package:eductionsystem/Features/Grades/presentation/manger/Academic_Semester_Cubit/academic_semseter_states.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Select_year_widget.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Total_Grade_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import '../manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'Widgets/Select_Semester.dart';
import 'Widgets/Subject_Score.dart';






class GradeViewBody extends StatelessWidget {
  const GradeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Select_year_container(),
          const SizedBox(height: 10),
          BlocBuilder<AcademicSemsterCubit, AcademicSemseterStates>(
            builder: (context, state) {
              if (state is LoadingAcademicSemseterState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SuccessAcademicSemseterState) {
                return const Select_Semester_container();
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 20),
          const TotalGPAWidget(),
          const SizedBox(height: 14),
          const Row(
            children: [
              Text(
                ' Your grades',
                style: TextStyle(
                  fontFamily: 'jost',
                  fontSize: 28,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          BlocBuilder<CourseGradeCubit, CourseGradeStates>(
            builder: (context, state) {
              if (state is LoadingCourseGradeState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: kPrimaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              if (state is SuccessCourseGradeState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.coursesGradeList.length,
                    itemBuilder: (context, index) {
                      return SubjectScore(
                        courseModel: state.coursesGradeList[index],
                      );
                    },
                  ),
                );
              }
              if (state is FailureCourseGradeState) {
                return Text(state.errMsg);
              }
              return Column(
                children: [
                    SizedBox(height: 80,),
                  const Center(
                    child: Text('Hello! You should choose the year'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}