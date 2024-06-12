import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../Riverpod/river_state.dart';
import 'Widgets/courses_numbers.dart';
import 'Widgets/courses_upper_part.dart';
import 'Widgets/courses_view_only_list.dart';

class CoursesViewOnlyScreen extends ConsumerStatefulWidget {
  const CoursesViewOnlyScreen({
    super.key,
  });

  @override
  CoursesViewOnlyScreenState createState() => CoursesViewOnlyScreenState();
}

class CoursesViewOnlyScreenState extends ConsumerState<CoursesViewOnlyScreen> {
  late int _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    ref.read(courseProvider.notifier).fetchSelectedCourses();
  }

  void _handleSectionTapped(int index) {
    setState(() {
      _expandedIndex = (_expandedIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CoursesScreenUpperPart(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0),
                      child: Text(
                        'Your Enrolled Courses',
                        style: AppFonts.manropeNormalSizable(
                            color: kPrimaryColor, fontSize: 25),
                      ),
                    ),
                    CoursesListViewOnly(
                      expandedIndex: _expandedIndex,
                      onSectionTapped: _handleSectionTapped,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CoursesNumbers(),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
