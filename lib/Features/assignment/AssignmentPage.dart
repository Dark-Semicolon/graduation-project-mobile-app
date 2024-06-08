import 'package:eductionsystem/Features/assignment/widgets/TaskComplete.dart';
import 'package:eductionsystem/Features/assignment/widgets/TaskProgress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Constants/FontsConst.dart';
import '../../Core/GloabalWidgets/nav_bar.dart';

class AssignmentsView extends StatelessWidget {
  final List<Task> tasks;
  final int numberOfTasks;

  const AssignmentsView({
    super.key,
    required this.tasks,
    required this.numberOfTasks,
  });

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final navigator = GoRouter.of(context);
            navigator.go('/HomePage');
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TaskProgressWidget(
              completedTasks: tasks.where((task) => task.isCompleted).length,
              totalTasks: numberOfTasks),
          const SizedBox(height: 30),
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
      bottomNavigationBar: const CustomBottomNavBar(
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
