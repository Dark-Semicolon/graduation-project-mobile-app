import 'package:eductionsystem/lib/Features/Home/Presentation/view/widgets/progress_overView__scroll_view.dart';
import 'package:eductionsystem/lib/Features/Home/Presentation/view/widgets/schedule_view.dart';
import 'package:flutter/material.dart';

import '../../../Splash/Persentation/widgets/Nav_bar.dart';

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
            SizedBox(height: 20,),
            ScheduleView(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ));
  }
}
