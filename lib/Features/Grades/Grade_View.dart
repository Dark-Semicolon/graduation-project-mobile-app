import 'package:eductionsystem/Features/Grades/Widgets/Subject_Score.dart';
import 'package:eductionsystem/Features/Grades/Widgets/Total_Grade_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Grades',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/Back ICon.svg',
              color: Colors.black,
              width: 18,
              height: 18,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TotalGPAWidget(),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Text(
                  ' Your grades',
                  style: TextStyle(
                      fontFamily: 'jost',
                      fontSize: 28,
                      color: Colors.blueAccent),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            const SliverToBoxAdapter(
              child: SubjectIteams(),
            ),
          ],
        ),
      ),
    );
  }
}
