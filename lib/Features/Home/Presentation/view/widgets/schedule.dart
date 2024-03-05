import 'package:flutter/material.dart';

import '../../../../../Constants/ColorsConst.dart';
import '../../../../../Constants/FontsConst.dart';

class Schedule extends StatelessWidget {
  const Schedule({
    Key? key,
    this.courseName = 'Course Name',
    this.endTime = 9.5,
    this.hallName = 'c22',
    this.startTime = 11,
  }) : super(key: key);

  final num startTime;
  final num endTime;
  final String courseName;
  final String hallName;

  final double spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 35,
                width: 340,
                decoration: BoxDecoration(
                  color: AppColors.blue2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '${startTime.toStringAsFixed(0)}:00',
                          style: AppFonts.robotoNormal14,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text('${endTime.toStringAsFixed(0)}:00',
                            style: AppFonts.robotoNormal14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 24,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.blue1,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            courseName,
                            style: AppFonts.robotoNormal14,
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 24,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text(hallName)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.blue1, // Adjust color as needed
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(
                            0, 0), // Offset in the positive direction of Y axis
                      ),
                    ],
                  ),
                  child: const Center(
                      child: Text(
                    'Lec',
                    style: AppFonts.robotoNormal14,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
