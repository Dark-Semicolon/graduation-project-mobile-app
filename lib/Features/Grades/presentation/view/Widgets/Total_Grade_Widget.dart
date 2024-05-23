import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/All_Year_GPA.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Courses_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../GPA/GPACubit.dart';
import '../../../GPA/GPAState.dart';


class TotalGPAWidget extends StatelessWidget {
  const TotalGPAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GPACubit, GPAState>(
      builder: (context, state) {
        String gpaText = '';
        if (state is YearGPAState) {
          gpaText = 'Year GPA: ${state.yearGPA}';
        } else if (state is SemesterGPAState) {
          gpaText = 'Semester GPA: ${state.semesterGPA}';
        } else {
          gpaText = 'Please select a year or semester';
        }

        return Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 7),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'GPA',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            gpaText,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Container(
                      //     width: 50,
                      //     height: 50,
                      //     decoration: const BoxDecoration(
                      //       color: Colors.blue,
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: const Center(
                      //       child: Icon(
                      //         Icons.download_rounded,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Divider(),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.folder_outlined),
                              SizedBox(width: 4),
                              Text(
                                'Courses',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          //CoursesNumber(),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.trending_up_outlined),
                              SizedBox(width: 4),
                              Text(
                                'Total Scores',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1500',
                            style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 24,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_2_outlined),
                              SizedBox(width: 4),
                              Text(
                                'Total GPA',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          AllYearGpa()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
