import 'package:flutter/material.dart';

class TaskProgressWidget extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const TaskProgressWidget({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    double progress = completedTasks / totalTasks;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            const Row(
              children: [ SizedBox(width: 6,),
                Text('Task',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white, fontFamily: 'jost',
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 6),
                      Text(
                        '$completedTasks/$totalTasks Task',
                        style: const TextStyle(fontFamily: 'jost',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(fontFamily: 'jost',
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 12,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: Colors.white),
                ),
                child: LinearProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  value: progress,
                ),
              )

            ),
            const SizedBox(height: 4,),

          ],
        ),
      ),
    );
  }
}
