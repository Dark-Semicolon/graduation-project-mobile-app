import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Constants/Icons.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';
import 'package:intl/intl.dart';

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
    _courseSelection = ApiService().fetchCourseSelection();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseSelection>(
      future: _courseSelection,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Eslam Tarek',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Semester 2 Year 4',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.redAccent,
                          ),
                          child: Center(
                            child: Text(
                              'Enrollments end on ${DateFormat('yyyy-MM-dd').format(DateTime.parse(snapshot.data!.data!.attributes!.endAt!))}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15 ,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
