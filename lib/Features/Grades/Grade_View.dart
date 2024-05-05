import 'package:eductionsystem/Features/Grades/Widgets/Subject_Score.dart';
import 'package:eductionsystem/Features/Grades/Widgets/Total_Grade_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Core/GloabalWidgets/nav_bar.dart';
import 'Widgets/Select_year_widget.dart';

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
          'MyGrades',
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
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [

            Select_year_container(),
            SizedBox(height: 20,),
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
            SubjectScore(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.account,
      ),
    );
  }
}
