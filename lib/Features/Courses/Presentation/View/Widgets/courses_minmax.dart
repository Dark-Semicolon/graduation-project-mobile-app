import 'package:flutter/material.dart';

import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';

// Define a model for the section data

class CourseMinMax extends StatefulWidget {
  const CourseMinMax({super.key});

  @override
  _CourseMinMaxState createState() => _CourseMinMaxState();
}

class _CourseMinMaxState extends State<CourseMinMax> {
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
          return Container(
            height: 190,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColumn(
                        'Min Credits: ${snapshot.data!.data!.attributes!.minCreditHours}',
                        'Max Credits: ${snapshot.data!.data!.attributes!.maxCreditHours}'),
                    _buildColumn('Courses', 'Courses'),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 40),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildColumn(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          title2,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
