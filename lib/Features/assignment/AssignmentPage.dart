import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Splash/Persentation/widgets/Nav_bar.dart';
import 'package:eductionsystem/Features/assignment/widgets/TaskProgress.dart';

class AssignmentsView extends StatelessWidget {
  const AssignmentsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Assignments',
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
      body: const Column(
        children: [
          SizedBox(height: 10,),
          TaskProgressWidget(completedTasks: 8, totalTasks:20),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.assessments,
      ),
    );
  }
}
