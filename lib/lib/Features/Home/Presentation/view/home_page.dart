import 'package:eductionsystem/lib/Features/Home/Presentation/view/widgets/home_page_all.dart';
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
      body:const HomePageAll(),
      bottomNavigationBar: CustomBottomNavBar(
      selectedMenu: MenuState.home,
    ));
  }
}
