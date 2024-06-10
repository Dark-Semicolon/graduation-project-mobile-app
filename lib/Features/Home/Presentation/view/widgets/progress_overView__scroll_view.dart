import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';
import 'Grades_card.dart';
import 'home_page_all.dart';

class ProgressOverViewScrollView extends StatelessWidget {
  final double gpa; // GPA parameter

  const ProgressOverViewScrollView({Key? key, required this.gpa}) : super(key: key);

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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GradesCard(gpa: double.parse(gpa.toStringAsFixed(2))), // Format GPA here
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
