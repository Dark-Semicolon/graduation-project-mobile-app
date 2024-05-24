import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Riverpod/river_state.dart';

class SelectedCoursesScreen extends ConsumerWidget {
  const SelectedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selected Courses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: courseState.selectedCourseIds.length,
                itemBuilder: (context, index) {
                  final courseId = courseState.selectedCourseIds[index];
                  return ListTile(
                    title: Text('Course ID: $courseId'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
              child: const Text('Save Courses'),
            ),
          ],
        ),
      ),
    );
  }
}
