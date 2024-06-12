import 'package:eductionsystem/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Constants/FontsConst.dart';
import '../../Riverpod/river_state.dart';
import 'Widgets/course_burrons.dart';
import 'Widgets/courses_numbers.dart';
import 'Widgets/courses_view_only_list.dart';

class ConfirmCoursesScreen extends ConsumerStatefulWidget {
  const ConfirmCoursesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ConfirmCoursesScreenState createState() => _ConfirmCoursesScreenState();
}

class _ConfirmCoursesScreenState extends ConsumerState<ConfirmCoursesScreen> {
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
              const SaveCoursesButton(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
