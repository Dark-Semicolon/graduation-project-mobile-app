import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Riverpod/river_state.dart';
import '../selected_courses.dart';

class CourseMinMax extends ConsumerWidget {
  const CourseMinMax({super.key});

  void _showMinCreditsNotReachedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Minimum Credit Hours Not Reached'),
          content: const Text(
              'You have not reached the minimum required credit hours.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseProvider);
    return Container(
      height: 250,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumn(
                  'Total Credit Hours', '${courseState.totalCreditHours}'),
              _buildColumn('Total Courses Enrolled',
                  '${courseState.selectedCourseIds.length}'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumn('Min Credit Hours', '${courseState.minCreditHours}'),
              _buildColumn('Max Credit Hours', '${courseState.maxCreditHours}'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final courseNotifier = ref.read(courseProvider.notifier);
              if (courseNotifier.isMinCreditHoursReached()) {
                try {
                  await courseNotifier.saveSelectedCourses();

                  // Fetch course selection details to get the end date
                  final courseSelection =
                      await courseNotifier.fetchCourseSelection();
                  final endDate =
                      DateTime.parse(courseSelection.data!.attributes!.endAt!);
                  final canModify = DateTime.now().isBefore(endDate);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectedCoursesScreen(
                        /*endDate: endDate,
                        canModify: canModify,*/
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to save courses: $e')),
                  );
                }
              } else {
                _showMinCreditsNotReachedDialog(context);
              }
            },
            child: const Text('Save and View Selected Courses'),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
