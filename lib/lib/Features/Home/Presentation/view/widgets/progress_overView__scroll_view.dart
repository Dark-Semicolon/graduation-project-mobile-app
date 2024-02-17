import 'package:eductionsystem/lib/Features/Home/Presentation/view/widgets/progress_overview.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
import 'home_page_all.dart';

class ProgressOverViewScrollView extends StatelessWidget {
  const ProgressOverViewScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomePageAll(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Progress OverView",
                style: AppFonts.roboto17,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ProgressOverView(
                      title: 'Custom Title',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                    ),
                    ProgressOverView(
                      title: 'Custom Title',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                    ),
                    ProgressOverView(
                      title: 'Custom Title',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
                    ),
                    ProgressOverView(
                      title: 'Custom Title',
                      color: Colors.blue,
                      percentage: 0.5,
                      svgAssetPath: 'assets/notification_bill.svg',
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
