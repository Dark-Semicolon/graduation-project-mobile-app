import 'package:eductionsystem/Features/Courses/Presentation/View/Widgets/exapndable_bar_view_only.dart';
import 'package:eductionsystem/Features/Courses/Presentation/View/student%20courses%20utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../Constants/const.dart';
import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'widgets/courses_numbers.dart';
import 'widgets/courses_upper_part.dart';

class CoursesViewOnlyScreen extends ConsumerStatefulWidget {
  const CoursesViewOnlyScreen({
    super.key,
  });

  @override
  CoursesViewOnlyScreenState createState() => CoursesViewOnlyScreenState();
}

class CoursesViewOnlyScreenState extends ConsumerState<CoursesViewOnlyScreen> {
  late int _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
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
      body: Column(
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
                    Consumer(
                      builder: (context, ref, child) {
                        final studentCoursesAsyncValue =
                            ref.watch(studentCoursesProvider);

                        return studentCoursesAsyncValue.when(
                          data: (studentCourses) {
                            if (studentCourses == null ||
                                studentCourses.data == null ||
                                studentCourses.data!.isEmpty) {
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

                            final semester = studentCourses.semester;
                            final academicYear = studentCourses.academicYear;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0, right: 15.0),
                                  child: Text(
                                    'Your Enrolled Courses',
                                    style: AppFonts.manropeNormalSizable(
                                        color: kPrimaryColor, fontSize: 25),
                                  ),
                                ),
                                StudentsCoursesListViewOnly(
                                  expandedIndex: _expandedIndex,
                                  onSectionTapped: _handleSectionTapped,
                                  courses: studentCourses.data!,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CoursesNumbers(),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          loading: () => Center(
                            child: LoadingAnimationWidget.waveDots(
                              color: Colors.blue,
                              size: 15,
                            ),
                          ),
                          error: (error, stack) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'You have no courses enrolled.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ref.refresh(studentCoursesProvider);
                                  },
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const CustomBottomNavBar(selectedMenu: MenuState.courses),
        ],
      ),
    );
  }
}

class StudentsCoursesListViewOnly extends StatelessWidget {
  final int expandedIndex;
  final Function(int) onSectionTapped;
  final List<Data> courses;

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
