import 'package:eductionsystem/Constants/FontsConst.dart';
import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Core/GloabalWidgets/nav_bar.dart';
import 'package:eductionsystem/Data/API/Const/end_points.dart';
import 'package:eductionsystem/Features/Courses/Presentation/View/student%20courses%20utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Widgets/courses_numbers.dart';
import 'Widgets/courses_upper_part.dart';
import 'Widgets/exapndable_bar_view_only.dart';

class CoursesViewOnlyScreen extends StatefulWidget {
  const CoursesViewOnlyScreen({super.key});

  @override
  CoursesViewOnlyScreenState createState() => CoursesViewOnlyScreenState();
}

class CoursesViewOnlyScreenState extends State<CoursesViewOnlyScreen> {
  int _expandedIndex = -1;
  late Future<StudentCoursesModel?> _studentCoursesFuture;
  final StudentCoursesService _studentCoursesService =
  StudentCoursesService(MainApiConstants.baseUrl);

  @override
  void initState() {
    super.initState();
    _studentCoursesFuture = _studentCoursesService.fetchStudentCourses();
  }

  void _handleSectionTapped(int index) {
    setState(() {
      _expandedIndex = (_expandedIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<StudentCoursesModel?>(
        future: _studentCoursesFuture,
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
                'You have no courses enrolled.',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(
              child: Text(
                'You have no courses enrolled.',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ),
            );
          }

          final studentCourses = snapshot.data!;
          final semester = studentCourses.semester.attributes.name;
          final academicYear = studentCourses.academicYear.attributes.name;

          return Column(
            children: [
              const CoursesScreenUpperPart(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 15.0, right: 15.0),
                          child: Text(
                            ' $semester, $academicYear',
                            style: AppFonts.manropeBoldSizable(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0),
                          child: Text(
                            'Your Enrolled Courses',
                            style: AppFonts.manropeNormalSizable(
                              color: kPrimaryColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        StudentsCoursesListViewOnly(
                          expandedIndex: _expandedIndex,
                          onSectionTapped: _handleSectionTapped,
                          courses: studentCourses.data,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CoursesNumbers(),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomBottomNavBar(selectedMenu: MenuState.courses),
            ],
          );
        },
      ),
    );
  }
}

class StudentsCoursesListViewOnly extends StatelessWidget {
  final int expandedIndex;
  final Function(int) onSectionTapped;
  final List<StudentCoursesData> courses;

  const StudentsCoursesListViewOnly({
    super.key,
    required this.expandedIndex,
    required this.onSectionTapped,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final courseData = courses[index];

        return SelectedCourseExpandableSectionViewOnly(
          title: courseData.attributes.name,
          description: courseData.attributes.description,
          creditHours: courseData.attributes.creditHours,
          index: index,
          expandedIndex: expandedIndex,
          onSectionTapped: onSectionTapped,
        );
      },
    );
  }
}
