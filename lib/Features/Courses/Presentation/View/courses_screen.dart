import 'package:flutter/material.dart';

import 'Widgets/course_bar.dart';
import 'Widgets/courses_minmax.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CoursesScreenUpperPart(), // Wrap with PreferredSize
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpandableSectionList(),
          CourseMinMax(),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.courses),
    );
  }
}
