import 'package:eductionsystem/Features/Home/Presentation/view/widgets/progress_overview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Constants/FontsConst.dart';
import 'home_page_all.dart';

class ProgressOverViewScrollView extends StatelessWidget {
  const ProgressOverViewScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomePageAll(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Progress OverView",
                style: AppFonts.roboto17,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ProgressOverView(
                      title: 'Grades',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                      onPressed: () {
                        GoRouter.of(context).go('/GradesPage');
                      },
                    ),
                    ProgressOverView(
                      title: 'Enroll Courses',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                      onPressed: () {
                        GoRouter.of(context).go('/CoursesScreen');
                      },
                    ),
                    ProgressOverView(
                      title: 'Your Courses',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                      onPressed: () async {
                        GoRouter.of(context)
                            .go('/SelectedCoursesScreenWithoutEdit');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
