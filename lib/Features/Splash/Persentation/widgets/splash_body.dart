import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/AssetsData.dart';
import '../../../../Data/API/Token/token_manager.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();

    Future.delayed(
      const Duration(seconds: 2),
          () async {
        final token = await TokenManager.getToken();
        if (token == null) {
          GoRouter.of(context).push('/LoginPage');
        } else {
          GoRouter.of(context).push('/HomePage');
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 8),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
