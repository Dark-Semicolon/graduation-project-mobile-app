import 'package:flutter/material.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'Widgets/course_bar.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CoursesScreenUpperPart(),
          const CoursesList(),
          CustomBottomNavBar(selectedMenu: MenuState.courses),
        ],
      ),
    );
  }
}
