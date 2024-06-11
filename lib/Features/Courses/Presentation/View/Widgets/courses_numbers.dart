import 'package:eductionsystem/Constants/FontsConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Constants/const.dart';
import '../../../Riverpod/river_state.dart';

class CoursesNumbers extends ConsumerWidget {
  const CoursesNumbers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseProvider);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                    'Total Credit Hours: ', '${courseState.totalCreditHours}'),
                const SizedBox(height: 15),
                _buildInfoColumn('Total Courses Enrolled: ',
                    '${courseState.selectedCourseIds.length}'),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _buildInfoColumn(
            //         'Min Credit Hours: ', '${courseState.minCreditHours}'),
            //     _buildInfoColumn(
            //         'Max Credit Hours: ', '${courseState.maxCreditHours}'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    TextStyle staticTextStyle = AppFonts.manropeNormalSizable(
        height: null, color: Colors.black, fontSize: 18);
    TextStyle dynamicTextStyle =
        AppFonts.manropeBoldSizable(color: kPrimaryColor, fontSize: 18);

    return Row(
      children: [
        Text(title, style: staticTextStyle),
        Text(value, style: dynamicTextStyle),
      ],
    );
  }
}
