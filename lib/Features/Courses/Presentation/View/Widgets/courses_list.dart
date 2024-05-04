import 'package:flutter/material.dart';

import 'course_bar.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CourseBar();
        },
      ),
    );
  }
}
