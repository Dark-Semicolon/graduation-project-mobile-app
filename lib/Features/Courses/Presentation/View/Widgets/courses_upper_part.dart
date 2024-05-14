import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Constants/Icons.dart';

class CoursesScreenUpperPart extends StatelessWidget {
  const CoursesScreenUpperPart({super.key});

  @override
  Widget build(BuildContext context) {
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
                    width: 40, // Corrected width
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
                    'Semester 2 Year 4', // Corrected spelling
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()), // Removed const
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100, // Adjusted width for better visibility
                    height: 80, // Reduced height for better proportion
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.redAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'Enrollments end on 20/20/2020', // Corrected spelling
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
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
}
