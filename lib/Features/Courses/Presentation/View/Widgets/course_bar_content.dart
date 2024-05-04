import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';

class CourseBarContent extends StatelessWidget {
  const CourseBarContent(
      {super.key, this.courseName = 'Course Name', this.creditHours = '3 hours'});

  final String? courseName;

  final String? creditHours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 15, right: 20, bottom: 10, top: 10),
      child: Row(
        children: [
          Center(
            child: Text(
              courseName!,
              style: AppFonts.sfProTextSizable(fontSize: 25),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                creditHours!,
                style: AppFonts.sfProTextSizable(fontSize: 20),
              ),
            ),
          ),
           const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
