import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Data/Models/availble_courses.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';
import '../../../Riverpod/river_state.dart';

class SectionData {
  final String title;
  final String description;
  final VoidCallback buttonAction;

  SectionData({
    required this.title,
    required this.description,
    required this.buttonAction,
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
    AvailableCourses availableCourses = await apiService.fetchAvailableCourses();

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
          buttonAction: () {
            _showAddCourseDialog(context, courseData);
          },
        );
      }).toList();
    });
  }

  void _showAddCourseDialog(BuildContext context, courseData) {
    final courseNotifier = ref.read(courseProvider.notifier);
    if (!courseNotifier.canAddCourse(courseData)) {
      _showMaxCreditsExceededDialog(context);
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Course'),
          content: Text('Are you sure you want to add the course "${courseData.attributes!.name!}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                courseNotifier.addCourse(courseData);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showMaxCreditsExceededDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Adding this course exceeds the maximum credit hours.'),
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
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _sectionData.length,
              itemBuilder: (context, index) {
                return CoursesExpandableSection(
                  sectionData: _sectionData[index],
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
  final VoidCallback onTap;

  const CoursesExpandableSection({
    super.key,
    required this.sectionData,
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
                  onPressed: sectionData.buttonAction,
                  child: const Text('Add Course'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
