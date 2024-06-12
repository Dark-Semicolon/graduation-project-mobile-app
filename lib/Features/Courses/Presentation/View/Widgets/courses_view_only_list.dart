import 'package:eductionsystem/Features/Courses/Presentation/View/Widgets/exapndable_bar_view_only.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../Riverpod/river_state.dart';

class CoursesListViewOnly extends ConsumerWidget {
  final int expandedIndex;
  final Function(int) onSectionTapped;

  const CoursesListViewOnly({
    super.key,
    required this.expandedIndex,
    required this.onSectionTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseProvider);

    return ListView.builder(
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

        return SelectedCourseExpandableSectionViewOnly(
          title: courseData.attributes!.name!,
          description: 'Description: ${courseData.attributes!.description!}\n'
              'Credit Hours: ${courseData.attributes!.creditHours!}',
          index: index,
          expandedIndex: expandedIndex,
          onSectionTapped: onSectionTapped,
        );
      },
    );
  }
}
