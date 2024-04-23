import 'package:eductionsystem/Features/assignment/widgets/TaskComplete.dart';
import 'package:eductionsystem/Features/assignment/widgets/TaskProgress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Constants/FontsConst.dart';
import '../../Core/GloabalWidgets/nav_bar.dart';

class AssignmentsView extends StatelessWidget {
  final List<Task> tasks;
  final int numberOfTasks;

  const AssignmentsView({
    Key? key,
    required this.tasks,
    required this.numberOfTasks,
  }) : super(key: key);

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
      body: Column(
        children: [
          SizedBox(height: 10),
          TaskProgressWidget(
              completedTasks: tasks.where((task) => task.isCompleted).length,
              totalTasks: numberOfTasks),
          SizedBox(height: 30),
          Text(
            'Lecture’s Tasks',
            style:
                AppFonts.manrope18.copyWith(fontSize: 20, color: Colors.black),
          ),
          Column(
            children: tasks
                .map((task) =>
                    TaskItem(task.title, task.isCompleted, task.dueIn))
                .toList(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.assessments,
      ),
    );
  }
}

class Task {
  final String title;
  final bool isCompleted;
  final String? dueIn;

  Task(this.title, this.isCompleted, [this.dueIn]);
}
