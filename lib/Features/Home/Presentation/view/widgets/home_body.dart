import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import '../../../../Courses/Data/Models/course_selection.dart';
import '../../../../Courses/Presentation/View/courses_view_only_screen.dart';
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

    return Column(
      children: [
        const HomePageUpperBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Student Services",
                style: AppFonts.manropeNormalSizable(
                  height: null,
                  color: kPrimaryColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        onPressed: () async {
                          showLoadingDialog(context);
                          await Future.delayed(const Duration(
                              seconds: 1)); // Simulating async operation
                          GoRouter.of(context).push("/GradesPage");
                          Navigator.of(context).pop(); // Dismiss loading dialog
                        },
                      ),
                      const SizedBox(width: 14),
                      FutureBuilder<CourseSelection>(
                        future: courseNotifier.fetchCourseSelection(),
                        builder:
                            (context, AsyncSnapshot<CourseSelection> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoadingAnimationWidget.waveDots(
                              color: Colors.blue,
                              size: 50,
                            );
                          } else if (snapshot.hasData) {
                            final daysLeft = calculateDaysLeft(
                                snapshot.data!.data!.attributes!.endAt!);
                            return CourseEnrollmentCard(
                              daysLeft: daysLeft,
                              onPressed: () {
                                showLoadingDialog(context);
                                navigateBasedOnCourseSelection(context, ref);
                              },
                            );
                          } else {
                            return  StudentCourses(onPressed: () {
                              GoRouter.of(context).push("/CoursesViewOnlyScreen");
                            },);
                          }
                        },
                      ),
                      const SizedBox(width: 14),
                      StudentCourses(onPressed: () {  GoRouter.of(context).push("/CoursesViewOnlyScreen");},),
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

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
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
// else if (snapshot.hasError) {
// //   return Text('Error: ${snapshot.error}');
// // }
