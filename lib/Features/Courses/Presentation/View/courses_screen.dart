import 'package:flutter/material.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'Widgets/course_bar.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CoursesScreenUpperPart(),
          CoursesList(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.courses),
    );
  }
}
