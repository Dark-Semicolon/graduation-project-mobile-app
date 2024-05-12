
import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Select_year_widget.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Total_Grade_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import '../manger/Couser_Grade_Cubit/course_grade_states.dart';
import 'Widgets/Subject_Score.dart';

class GradeViewBody extends StatelessWidget {
  const GradeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Select_year_container(),
          const SizedBox(height: 20,),
          TotalGPAWidget(),
          const SizedBox(
            height: 14,
          ),
          const Row(
            children: [
              Text(
                ' Your grades',
                style: TextStyle(
                    fontFamily: 'jost',
                    fontSize: 28,
                    color: Colors.blueAccent),
              )
            ],
          ),
          BlocBuilder<CourseGradeCubit,CourseGradeStates>(
            builder: (context, state) {
              if(state is LoadingCourseGradeState){
                return Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Center(child: LoadingAnimationWidget.inkDrop(color: kPrimaryColor, size: 60),),
                );
              }
              if(state is SuccessCourseGradeState){
                return Expanded(
                    child: ListView.builder(
                      itemCount:state.coursesGradeList.length ,
                      itemBuilder: (context, index) {
                        return SubjectScore(courseModel: state.coursesGradeList[index]);
                      },));
              }
              if(state is FailureCourseGradeState){
                return Text(state.errMsg);
              }
              return const Center(child: Text('Hello You Should Choose the year'));
            },


          ),
        ],
      ),
    );
  }
}