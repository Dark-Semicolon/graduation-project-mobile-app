import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Riverpod/river_state.dart';

class CourseMinMax extends ConsumerWidget {
  const CourseMinMax({super.key});

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
            onPressed: () {
              // Save or perform an action with the selected courses
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 40),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
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
