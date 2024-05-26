import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Riverpod/river_state.dart';

class SelectedCoursesScreen extends ConsumerStatefulWidget {
  final DateTime endDate;
  final bool canModify;

  const SelectedCoursesScreen({
    super.key,
    required this.endDate,
    required this.canModify,
  });

  @override
  _SelectedCoursesScreenState createState() => _SelectedCoursesScreenState();
}

class _SelectedCoursesScreenState extends ConsumerState<SelectedCoursesScreen> {
  late int _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    // Fetch selected courses when the screen is initialized
    ref.read(courseProvider.notifier).fetchSelectedCourses();
  }

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Selected Courses'),
        actions: [
          if (widget.canModify)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                GoRouter.of(context).go('/CoursesScreen');
              },
            ),
        ],
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
                  final courseData = courseState.courseDetails[courseId];

                  if (courseData == null) {
                    return ListTile(
                      title: Text('Course ID: $courseId'),
                    );
                  }

                  return SelectedCourseExpandableSection(
                    title: courseData.attributes!.name!,
                    description:
                        'Description: ${courseData.attributes!.description!}\n'
                        'Credit Hours: ${courseData.attributes!.creditHours!}',
                    index: index,
                    isExpanded: _expandedIndex == index,
                    onTap: () {
                      setState(() {
                        _expandedIndex = (_expandedIndex == index) ? -1 : index;
                      });
                    },
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

class SelectedCourseExpandableSection extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const SelectedCourseExpandableSection({
    super.key,
    required this.title,
    required this.description,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
