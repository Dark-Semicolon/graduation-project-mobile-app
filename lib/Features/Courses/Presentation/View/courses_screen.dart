import 'package:flutter/material.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'Widgets/courses_list.dart';
import 'Widgets/courses_minmax.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Column(
        children: [
          SizedBox(height: 20),
          CoursesScreenUpperPart(),
          CoursesList(),
          CourseMinMax()
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.courses),
    );
  }
}
