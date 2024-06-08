import 'package:flutter/material.dart';

import '../../../Data/Models/availble_courses.dart';

class CoursesSectionData {
  final String title;
  final TextSpan description;
  final AvailableCoursesData courseData;

  CoursesSectionData({
    required this.title,
    required this.description,
    required this.courseData,
  });
}
