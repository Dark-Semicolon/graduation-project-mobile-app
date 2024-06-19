import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Data/API/Token/token_manager.dart';
import '../../../../Local App Data/Local/local_storage.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final isOnboardingShown =
        await HiveBoxManager.readFromBox('Status', 'isOnboardingShown') ??
            false;

    if (!mounted) return;

    if (!isOnboardingShown) {
      context.go('/OnBoarding');
    } else {
      final token = await TokenManager.getToken();
      if (token == null) {
        context.go('/LoginPage');
      } else {
        context.go('/HomePage');
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, _) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Campus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Suit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
