import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/Icons.dart';
import '../../../../../Constants/const.dart';
import '../../../../../Core/utils/retrive_user_data.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';

DateTime dateTime = DateTime.parse('2024-03-26 02:08:00');
String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

class CoursesScreenUpperPart extends StatefulWidget {
  const CoursesScreenUpperPart({super.key});

  @override
  _CoursesScreenUpperPartState createState() => _CoursesScreenUpperPartState();
}

class _CoursesScreenUpperPartState extends State<CoursesScreenUpperPart> {
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
    return FutureBuilder<CourseSelection>(
      future: _courseSelection,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.waveDots(
              color: Colors.blue,
              size: 50,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final daysLeft =
              calculateDaysLeft(snapshot.data!.data!.attributes!.endAt!);

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        SvgPicture.asset(
                          userIconPath,
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Hi, ',
                              style: AppFonts.manropeBoldSizable(
                                  fontSize: 18, color: kPrimaryColor),
                            ),
                            UserName(
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 18, color: kPrimaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Deadline in ',
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 15,
                                  color: Colors.pink,
                                  height: null),
                            ),
                            Text(
                              '$daysLeft days',
                              textAlign: TextAlign.center,
                              style: AppFonts.manropeNormalSizable(
                                  fontSize: 15,
                                  color: Colors.pink,
                                  height: null),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
