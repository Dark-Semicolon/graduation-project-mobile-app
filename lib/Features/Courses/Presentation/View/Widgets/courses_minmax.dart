import 'package:eductionsystem/Constants/FontsConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Constants/const.dart';
import '../../../Riverpod/river_state.dart';
import '../selected_courses.dart';

class CourseMinMax extends ConsumerWidget {
  const CourseMinMax({super.key});

  void _showMinCreditsNotReachedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Minimum Credit Hours Not Reached',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          content: const Text(
            'You have not reached the minimum required credit hours.',
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
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
      height: 220,
      color: Colors.white,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoColumn('Your Total Credit Hours: ',
                  '${courseState.totalCreditHours}'),
              // _buildInfoColumn('Total Courses Enrolled: ',
              //     '${courseState.selectedCourseIds.length}'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(
                  'Min Credit Hours: ', '${courseState.minCreditHours}'),
              _buildInfoColumn(
                  'Max Credit Hours: ', '${courseState.maxCreditHours}'),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () async {
                final courseNotifier = ref.read(courseProvider.notifier);
                if (courseNotifier.isMinCreditHoursReached()) {
                  await _saveAndNavigate(context, courseNotifier);
                } else {
                  _showMinCreditsNotReachedDialog(context);
                }
              },
              child: Text(
                'Save and View Selected Courses',
                style: AppFonts.manropeBoldSizable(color: kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    TextStyle staticTextStyle = AppFonts.manropeNormalSizable(
        height: null, color: Colors.black, fontSize: 17);
    TextStyle dynamicTextStyle =
        AppFonts.manropeBoldSizable(color: kPrimaryColor, fontSize: 17);

    return Row(
      children: [
        Text(title, style: staticTextStyle),
        Text(value, style: dynamicTextStyle),
      ],
    );
  }

  Future<void> _saveAndNavigate(
      BuildContext context, CourseNotifier courseNotifier) async {
    try {
      await courseNotifier.saveSelectedCourses();
      final courseSelection = await courseNotifier.fetchCourseSelection();
      final endDate = DateTime.parse(courseSelection.data!.attributes!.endAt!);
      final canModify = DateTime.now().isBefore(endDate);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SelectedCoursesScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to save courses: $e',
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      );
    }
  }
}
