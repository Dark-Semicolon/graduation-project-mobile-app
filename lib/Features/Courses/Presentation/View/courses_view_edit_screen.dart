import 'package:eductionsystem/Constants/const.dart';
import 'package:eductionsystem/Features/Courses/Presentation/View/Widgets/courses_view_only_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../../../Core/GloabalWidgets/nav_bar.dart';
import '../../Riverpod/river_state.dart';
import 'Widgets/course_burrons.dart';
import 'Widgets/courses_numbers.dart';
import 'Widgets/courses_upper_part.dart';

class CoursesViewAndEditScreen extends ConsumerStatefulWidget {
  const CoursesViewAndEditScreen({
    super.key,
  });

  @override
  SelectedCoursesScreenState createState() => SelectedCoursesScreenState();
}

class SelectedCoursesScreenState
    extends ConsumerState<CoursesViewAndEditScreen> {
  late int _expandedIndex;
  late Future<void> _fetchCoursesFuture;

  @override
  void initState() {
    super.initState();
    _expandedIndex = -1;
    _fetchCoursesFuture =
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
      body: FutureBuilder<void>(
        future: _fetchCoursesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading courses.',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ),
            );
          } else {
            return Column(
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
                                EditCoursesButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const CustomBottomNavBar(selectedMenu: MenuState.courses),
              ],
            );
          }
        },
      ),
    );
  }
}
