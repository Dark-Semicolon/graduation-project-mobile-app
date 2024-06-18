import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import '../../../../Courses/Data/Models/course_selection.dart';
import '../../../../Courses/Riverpod/river_state.dart';
import '../../../../Courses/Utils/courses_navigator.dart';
import 'Course_card.dart';
import 'Grades_card.dart';
import 'home_upper_bar.dart';

class HomeBody extends ConsumerWidget {
  final double gpa;

  const HomeBody({super.key, required this.gpa});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseNotifier = ref.read(courseProvider.notifier);
    final courseSelectionFuture = courseNotifier.fetchCourseSelection();

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
                const SizedBox(height: 22),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GradesCard(
                          gpa: double.parse(gpa.toStringAsFixed(2)),
                          onPressed: () {
                            GoRouter.of(context).push("/GradesPage");
                          },
                        ),
                        const SizedBox(width: 14),
                        FutureBuilder<CourseSelection>(
                          future: courseSelectionFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final daysLeft = calculateDaysLeft(
                                  snapshot.data!.data!.attributes!.endAt!);
                              return CourseEnrollmentCard(
                                daysLeft: daysLeft,
                                onPressed: () => navigateBasedOnCourseSelection(
                                    context, ref),
                              );
                            } else {
                              return const Text('No data available');
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

  int calculateDaysLeft(String endDate) {
    final now = DateTime.now();
    final deadline = DateTime.parse(endDate);
    return deadline.difference(now).inDays;
  }
}
