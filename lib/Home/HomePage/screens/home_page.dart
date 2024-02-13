import 'package:flutter/material.dart';

import '../../../feature/splash/persentation/widgets/Nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ketfom AWAD'),

      ),
      body: Column(
        children: [
          Image.asset('assets/images/awad.jpg'),
          const SizedBox(height: 10,),
        ],
      ),
       bottomNavigationBar: CustomBottomNavBar(
         selectedMenu: MenuState.home,)
    );
  }
}
