import 'package:eductionsystem/Features/Grades/presentation/view/grade_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  late Future<void> _loadingFuture;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulate a 2-second delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'MyGrades',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/Back ICon.svg',
              color: Colors.black,
              width: 18,
              height: 18,
            ),
          ),
          onPressed: () {
            // Navigator.pop(context);
            GoRouter.of(context).push("/HomePage");
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const GradeViewBody();
          } else {
            return const Center(
              child: Text(
                'Failed to load data',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.Grades,
      ),
    );
  }
}
