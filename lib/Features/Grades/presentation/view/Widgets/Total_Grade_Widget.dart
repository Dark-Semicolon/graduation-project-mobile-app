import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/All_Year_GPA.dart';
import 'package:eductionsystem/Features/Grades/presentation/view/Widgets/Courses_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../GPA/GPACubit.dart';
import '../../../GPA/GPAState.dart';
import 'faild_Course_Count.dart';


class TotalGPAWidget extends StatelessWidget {
  const TotalGPAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GPACubit, GPAState>(
      builder: (context, state) {
        String gpaText = ('');
        if (state is YearGPAState) {
          gpaText = 'Year GPA : ${state.yearGPA.toString().substring(0,4)}';
        } else if (state is SemesterGPAState) {
          gpaText = 'Semester GPA : ${state.semesterGPA.toString().substring(0,4)}';
        } else {
          gpaText = 'Please select a year';
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
                      Column(crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          const Row(mainAxisAlignment: MainAxisAlignment.start,
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
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                gpaText,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.download_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Divider(),
                  const SizedBox(height: 6),
                  const Row(
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center,
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
                          TotalCoursesWidget(),
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
                                'Failed Courses',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          failedCoursesCount(),
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
