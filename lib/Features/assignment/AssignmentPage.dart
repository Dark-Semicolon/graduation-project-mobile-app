import 'package:eductionsystem/Features/assignment/widgets/TaskProgress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Splash/Persentation/widgets/Nav_bar.dart';

class AssignmentsView extends StatelessWidget {
  const AssignmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,

      body:
      const Column(
        children: [
          SizedBox(height: 100,),
          TaskProgressWidget(completedTasks: 8, totalTasks:20),
        ],
      ),








      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.assessments,
      ),
    );
  }
}
