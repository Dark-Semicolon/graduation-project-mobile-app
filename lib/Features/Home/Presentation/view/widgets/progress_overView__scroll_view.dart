import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import '../../../../Courses/Data/Models/course_selection.dart';
import '../../../../Courses/Data/Services/get_availble_courses_services.dart';
import 'Course_card.dart';
import 'Grades_card.dart';
import 'home_page_all.dart';

class ProgressOverViewScrollView extends StatefulWidget {
  final double gpa;

  const ProgressOverViewScrollView({Key? key, required this.gpa}) : super(key: key);

  @override
  _ProgressOverViewScrollViewState createState() => _ProgressOverViewScrollViewState();
}

class _ProgressOverViewScrollViewState extends State<ProgressOverViewScrollView> {
  late Future<CourseSelection> _courseSelection;

  @override
  void initState() {
    super.initState();
    _courseSelection = CoursesApiService().fetchCourseSelection();
  }

  int calculateDaysLeft(String endDate) {
    final now = DateTime.now();
    final deadline = DateTime.parse(endDate);
    return deadline.difference(now).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomePageUpperBar(),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Progress OverView",
                    style: AppFonts.manropeNormalSizable(
                      height: null,
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 22,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GradesCard(
                          gpa: double.parse(widget.gpa.toStringAsFixed(2)),
                          onPressed: () {
                            GoRouter.of(context).push("/GradesPage");
                          },
                        ),
                        const SizedBox(width: 14),
                        FutureBuilder<CourseSelection>(
                          future: _courseSelection,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final daysLeft = calculateDaysLeft(snapshot.data!.data!.attributes!.endAt!);

                              return CourseEnrollmentCard(
                                daysLeft: daysLeft,
                                onPressed: () {
                                  GoRouter.of(context).push("/SelectedCoursesScreen");
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
