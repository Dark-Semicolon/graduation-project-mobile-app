import 'package:flutter/material.dart';

class TopImageInLogin extends StatelessWidget {
  const TopImageInLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          'assets/images/top_login_scene.png',
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 60,
          left: 370,
          child: Image.asset(
            'assets/images/logo.png',
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
