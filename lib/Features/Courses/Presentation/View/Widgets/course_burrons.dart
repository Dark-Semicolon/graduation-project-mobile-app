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
            backgroundColor: kPrimaryColor,
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            try {
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
          child: Text('Save Courses', style: AppFonts.manropeBoldSizable()),
        ),
      ),
    );
  }
}

class EditCoursesButton extends ConsumerWidget {
  const EditCoursesButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(50, 50),
        fixedSize: const Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () async {
        final navigator = GoRouter.of(context);
        navigator.go('/CoursesScreen');
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
    );
  }
}
