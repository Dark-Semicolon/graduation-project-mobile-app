import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import '../../../../Courses/Data/Models/course_selection.dart';
import '../../../../Courses/Riverpod/river_state.dart';
import 'Course_card.dart';
import 'Grades_card.dart';
import 'home_upper_bar.dart';

class HomeBody extends ConsumerWidget {
  final double gpa;

  const HomeBody({super.key, required this.gpa});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseNotifier = ref.watch(courseProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomePageUpperBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Student Services",
            style: AppFonts.manropeNormalSizable(
              height: null,
              color: kPrimaryColor,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
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
                        future: courseNotifier.fetchCourseSelection(),
                        builder:
                            (context, AsyncSnapshot<CourseSelection> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              color: Colors.white,
                              child: LoadingAnimationWidget.fourRotatingDots(
                                color: Colors.blue,
                                size: 35,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final daysLeft = calculateDaysLeft(
                                snapshot.data!.data!.attributes!.endAt!);
                            return CourseEnrollmentCard(
                              daysLeft: daysLeft,
                              onPressed: () {
                                navigateBasedOnCourseSelection(context, ref);
                              },
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(width: 14),
                      StudentCourses(
                        onPressed: () {
                          GoRouter.of(context).push("/CoursesViewOnlyScreen");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int calculateDaysLeft(String endDate) {
    final now = DateTime.now();
    final deadline = DateTime.parse(endDate);
    return deadline.difference(now).inDays;
  }

  Future<void> navigateBasedOnCourseSelection(
      BuildContext context, WidgetRef ref) async {
    final courseNotifier = ref.read(courseProvider.notifier);

    // Show loading dialog
    showLoadingDialog(context);

    try {
      // Determine the navigation screen
      final screen = await courseNotifier.determineNavigationScreen();

      // Check if context is still valid before navigating
      if (context.mounted) {
        // Pop the loading dialog
        Navigator.of(context).pop();

        // Navigate to the determined screen
        GoRouter.of(context).push(screen);
      }
    } catch (e) {
      // Check if context is still valid before showing error
      if (context.mounted) {
        // Pop the loading dialog in case of error
        Navigator.of(context).pop();

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error determining navigation: $e')),
        );
      }
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.waveDots(
            color: Colors.blue,
            size: 50,
          ),
        );
      },
    );
  }
}
