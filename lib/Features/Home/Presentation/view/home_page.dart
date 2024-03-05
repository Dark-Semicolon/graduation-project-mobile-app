import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Splash/Persentation/widgets/Nav_bar.dart';
import 'widgets/progress_overView__scroll_view.dart';
import 'widgets/schedule_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
      body: Column(
        children: [
          const ProgressOverViewScrollView(),
          const SizedBox(height: 20),
          const ScheduleView(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     GoRouter.of(context).push('/LoginPage');
              //   },
              //   child: const Text('log'),
              // ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/DisplayUserData');
                },
                child: const Text('User Data'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
