import 'package:flutter/material.dart';

import '../../../../Core/GloabalWidgets/nav_bar.dart';
import 'widgets/progress_overView__scroll_view.dart';
import 'widgets/schedule_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body: const Column(
        children: [
          ProgressOverViewScrollView(),
          SizedBox(height: 20),
          ScheduleView(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {
// GoRouter.of(context).push('/DisplayUserData');
// },
// child: const Text('User Data'),
// ),
// ElevatedButton(
// onPressed: () {
// GoRouter.of(context).push('/GradesPage');
// },
// child: const Text('Geades Page'),
// ),
