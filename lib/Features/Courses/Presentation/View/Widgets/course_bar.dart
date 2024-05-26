import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Data/Models/availble_courses.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';
import '../../../Riverpod/river_state.dart';

class SectionData {
  final String title;
  final String description;
  final AvailableCoursesData courseData;

  SectionData({
    required this.title,
    required this.description,
    required this.courseData,
  });
}

class CoursesList extends ConsumerStatefulWidget {
  const CoursesList({super.key});

  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends ConsumerState<CoursesList> {
  late int _expandedIndex;
  late List<SectionData> _sectionData;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    _sectionData = [];
    _fetchSectionData();
  }

  Future<void> _fetchSectionData() async {
    CoursesApiService apiService = CoursesApiService();
    AvailableCourses availableCourses =
        await apiService.fetchAvailableCourses();

    // Fetch min and max credits from the course selection API
    CourseSelection courseSelection = await apiService.fetchCourseSelection();
    int minCredits = courseSelection.data!.attributes!.minCreditHours!;
    int maxCredits = courseSelection.data!.attributes!.maxCreditHours!;

    // Update the provider with min and max credits
    ref.read(courseProvider.notifier).setMinMaxCredits(minCredits, maxCredits);

    setState(() {
      _sectionData = availableCourses.data!.map((courseData) {
        return SectionData(
          title: courseData.attributes!.name!,
          description: 'Description: ${courseData.attributes!.description!}\n'
              'Credit Hours: ${courseData.attributes!.creditHours!}',
          courseData: courseData,
        );
      }).toList();
    });
  }

  void _toggleCourseEnrollment(AvailableCoursesData courseData) {
    final courseNotifier = ref.read(courseProvider.notifier);
    if (courseNotifier.state.selectedCourseIds.contains(courseData.id)) {
      _showRemoveCourseDialog(courseData.id!);
    } else {
      _showAddCourseDialog(courseData);
    }
  }

  void _showAddCourseDialog(AvailableCoursesData courseData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Course'),
          content: const Text('Are you sure you want to add this course?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addCourse(courseData);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addCourse(AvailableCoursesData courseData) {
    final courseNotifier = ref.read(courseProvider.notifier);
    if (!courseNotifier.addCourse(courseData)) {
      _showErrorDialog(
          'Failed to add course. It may exceed the maximum credit hours.');
    }
  }

  void _showRemoveCourseDialog(int courseId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Course'),
          content: const Text('Are you sure you want to remove this course?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _removeCourse(courseId);
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  void _removeCourse(int courseId) {
    final courseNotifier = ref.read(courseProvider.notifier);
    courseNotifier.removeCourse(courseId);
    if (!courseNotifier.isMinCreditHoursReached()) {
      _showErrorDialog(
          'Failed to remove course. It may fall below the minimum credit hours.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _sectionData.length,
              itemBuilder: (context, index) {
                final sectionData = _sectionData[index];
                final isSelected = courseState.selectedCourseIds
                    .contains(sectionData.courseData.id);
                return CoursesExpandableSection(
                  sectionData: sectionData,
                  index: index,
                  isExpanded: _expandedIndex == index,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      _expandedIndex = (_expandedIndex == index) ? -1 : index;
                    });
                  },
                  buttonAction: () =>
                      _toggleCourseEnrollment(sectionData.courseData),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesExpandableSection extends StatelessWidget {
  final SectionData sectionData;
  final int index;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback buttonAction;

  const CoursesExpandableSection({
    super.key,
    required this.sectionData,
    required this.index,
    required this.isExpanded,
    required this.isSelected,
    required this.onTap,
    required this.buttonAction,
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
                color: isSelected ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sectionData.title,
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
                  sectionData.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: buttonAction,
                  child: Text(isSelected ? 'Remove Course' : 'Add Course'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
