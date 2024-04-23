import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/AssetsData.dart';
import '../../../../Local App Data/Local/local_storage.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation; // Change to double for fade animation

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // AnimationController for fade animation
    fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        bool onBoardingStatus = await HiveBoxManager.readFromBox('Status', 'onBoardingStatus');

        GoRouter.of(context).push(onBoardingStatus ? '/LoginPage' : '/OnBoarding');

      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 8,
        ),
        AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, _) {
            return FadeTransition(
              opacity: fadeAnimation,
              child: const Column(
                children: [
                  Text(
                    'Eduaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontFamily: kFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
