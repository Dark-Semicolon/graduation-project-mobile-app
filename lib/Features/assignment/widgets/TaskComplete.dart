import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final String? dueIn;

  const TaskItem(this.title, this.isCompleted, [this.dueIn]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: ListTile(
          title: Text(title, style: TextStyle(color: isCompleted ? Colors.white70 : Colors.white)),
          trailing: isCompleted
              ? const Icon(Icons.check_circle)
              : (dueIn != null ? Text(dueIn!) : null),
        ),
      ),
    );
  }
}
