import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../Data/Models/availble_courses.dart';
import '../../../Data/Models/course_selection.dart';
import '../../../Data/Services/get_availble_courses_services.dart';
import '../../../Riverpod/river_state.dart';
import 'courses_data_section.dart';
import 'courses_minmax.dart';
import 'expandable_bar.dart';

class CoursesList extends ConsumerStatefulWidget {
  const CoursesList({super.key});

  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends ConsumerState<CoursesList> {
  late int _expandedIndex;
  late List<CoursesSectionData> _sectionData;

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
        return CoursesSectionData(
          title: courseData.attributes!.name!,
          description: TextSpan(
            children: [
              TextSpan(
                text: '${courseData.attributes!.description!}\n',
                style: AppFonts.manropeNormalSizable(
                    height: 1.5, fontSize: 15, color: Colors.black),
              ),
              const TextSpan(
                text: 'Credit Hours: ',
                style: TextStyle(color: kPrimaryColor, fontSize: 15),
              ),
              TextSpan(
                text: '${courseData.attributes!.creditHours!}',
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
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

  void _addCourse(AvailableCoursesData courseData) {
    final courseNotifier = ref.read(courseProvider.notifier);
    if (!courseNotifier.addCourse(courseData)) {
      _showErrorDialog(
          'Failed to add course. It may exceed the maximum credit hours.');
    }
  }

  void _removeCourse(int courseId) {
    final courseNotifier = ref.read(courseProvider.notifier);
    courseNotifier.removeCourse(courseId);
    if (!courseNotifier.isMinCreditHoursReached()) {
      _showErrorDialog(
        'Your Credit Hours Below The Minimum Credit !!',
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset('assets/images/wrong.png', height: 50),
              const SizedBox(height: 10),
              Text(
                'Warning',
                style: AppFonts.manropeBoldSizable(
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: AppFonts.manropeNormalSizable(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'OK',
                  style: AppFonts.manropeBoldSizable(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddCourseDialog(AvailableCoursesData courseData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset('assets/images/righ.png', height: 50),
              const SizedBox(height: 10),
              Text(
                'Add Course',
                style: AppFonts.manropeBoldSizable(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to add this course?',
            style: AppFonts.manropeNormalSizable(
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addCourse(courseData);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: AppFonts.manropeBoldSizable(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: AppFonts.manropeNormalSizable(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showRemoveCourseDialog(int courseId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset('assets/images/wrong.png', height: 50),
              const SizedBox(height: 10),
              Text(
                'Remove Course',
                style: AppFonts.manropeBoldSizable(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to remove this course?',
            style: AppFonts.manropeNormalSizable(
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _removeCourse(courseId);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Remove',
                    style: AppFonts.manropeBoldSizable(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: AppFonts.manropeNormalSizable(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Row(
                children: [
                  Text(
                    'Available Courses To Enroll',
                    style: AppFonts.manropeBoldSizable(
                        color: kPrimaryColor, fontSize: 17),
                  ),
                ],
              ),
            ),
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
            const CourseMinMax(),
          ],
        ),
      ),
    );
  }
}
