import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../Riverpod/river_state.dart';
import 'Widgets/course_burrons.dart';
import 'Widgets/courses_numbers.dart';

class ConfirmCoursesScreen extends ConsumerStatefulWidget {
  const ConfirmCoursesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SelectedCoursesScreenState createState() => _SelectedCoursesScreenState();
}

class _SelectedCoursesScreenState extends ConsumerState<ConfirmCoursesScreen> {
  late int _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    ref.read(courseProvider.notifier).fetchSelectedCourses();
  }

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Selected Courses and Edit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final navigator = GoRouter.of(context);
            navigator.go('/HomePage');
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Your Enrolled Courses',
                  style: AppFonts.manropeNormalSizable(
                      color: kPrimaryColor, fontSize: 25),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courseState.selectedCourseIds.length,
                itemBuilder: (context, index) {
                  final courseId = courseState.selectedCourseIds[index];
                  final courseData = courseState.courseDetails[courseId];

                  if (courseData == null) {
                    return ListTile(
                      title: Text('Course ID: $courseId',
                          style: AppFonts.manropeNormalSizable()),
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
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CoursesNumbers(),
                    Expanded(child: SizedBox()),
                    EditCoursesButton(),
                  ],
                ),
              ),
              const SaveCoursesButton(),
              const SizedBox(
                height: 50,
              )
            ],
          ),
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
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppFonts.manropeNormalSizable(fontSize: 20),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  description,
                  style: AppFonts.manropeNormalSizable(
                      color: Colors.black, fontSize: 17, height: 1.5),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
