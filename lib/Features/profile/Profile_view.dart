import 'package:eductionsystem/Features/profile/Profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Splash/Persentation/widgets/Nav_bar.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,

      body: Column(
        children: [
          const SizedBox(height: 50,),
          ProfileScreen(),
      ]
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.account,
      ),
    );
  }
}
