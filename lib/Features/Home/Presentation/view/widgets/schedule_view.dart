import 'package:eductionsystem/Features/Home/Presentation/view/widgets/schedule.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/FontsConst.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lectures Schedule',
                style: AppFonts.roboto17,
              )
            ],
          ),
        ),
        Schedule(
            courseName: 'OOP', endTime: 9.5, hallName: 'c44', startTime: 5),
        Schedule(
            courseName: 'OOP', endTime: 9.5, hallName: 'c44', startTime: 5),
        Schedule(
            courseName: 'OOP', endTime: 9.5, hallName: 'c44', startTime: 5),
        Schedule(
            courseName: 'OOP', endTime: 9.5, hallName: 'c44', startTime: 5),
      ],
    );
  }
}
