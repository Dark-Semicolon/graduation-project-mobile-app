import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../../Constants/const.dart';
import '../../../Riverpod/river_state.dart';

class SaveCoursesButton extends ConsumerWidget {
  const SaveCoursesButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(220, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(
                color: kPrimaryColor,
                width: 1,
              ),
            ),
            elevation: 5,
            shadowColor:
                Colors.black.withOpacity(0.5), // Customize shadow color
          ),
          onPressed: () async {
            try {
              final navigator = GoRouter.of(context);
              navigator.go('/HomePage');
              await ref.read(courseProvider.notifier).saveSelectedCourses();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Courses saved successfully')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to save courses: $e')),
              );
            }
          },
          child: Text('Save Courses',
              style: AppFonts.manropeBoldSizable(color: kPrimaryColor)),
        ),
      ),
    );
  }
}

class EditCoursesButton extends ConsumerWidget {
  const EditCoursesButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(50, 50),
              fixedSize: const Size(130, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: kPrimaryColor, // Border color
                  width: 1, // Border width
                ),
              ),
              elevation: 5,
              // Add shadow elevation
              shadowColor:
                  Colors.black.withOpacity(0.5), // Customize shadow color
            ),
            onPressed: () async {
              final navigator = GoRouter.of(context);
              navigator.go('/CoursesEnrollmentScreen');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit, color: kPrimaryColor),
                const SizedBox(width: 8),
                Text('Edit',
                    style: AppFonts.manropeBoldSizable(color: kPrimaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
