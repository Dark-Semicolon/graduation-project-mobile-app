import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'Widgets/courses_enrollments_list.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesEnrollmentScreen extends StatefulWidget {
  const CoursesEnrollmentScreen({super.key});

  @override
  _CoursesEnrollmentScreenState createState() =>
      _CoursesEnrollmentScreenState();
}

class _CoursesEnrollmentScreenState extends State<CoursesEnrollmentScreen> {
  late Future<void> _fetchCoursesFuture;

  @override
  void initState() {
    super.initState();
    _fetchCoursesFuture = _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));
    // Add your actual data fetching logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: _fetchCoursesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading courses.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CoursesScreenUpperPart(),
                CoursesList(),
                CustomBottomNavBar(selectedMenu: MenuState.courses),
              ],
            );
          }
        },
      ),
    );
  }
}
