
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Select_year_widget.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/grade_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import '../manger/Couser_Grade_Cubit/course_grade_cubit.dart';
import 'Widgets/Subject_Score.dart';
import 'Widgets/Total_Grade_Widget.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<CourseGradeCubit>(context).fetchStudentCoursesGrade();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'MyGrades',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/Back ICon.svg',
              color: Colors.black,
              width: 18,
              height: 18,
            ),
          ),
          onPressed: () {
            // Navigator.pop(context);
            GoRouter.of(context).push("/HomePage");
            GoRouter.of(context).pop();

          },
        ),
      ),
      body:const GradeViewBody(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.account,
      ),
    );
  }
}
